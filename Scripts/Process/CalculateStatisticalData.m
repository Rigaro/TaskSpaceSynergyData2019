%
colours = {[0.8 0.8 0.8], 'b', 'r', 'g'};
%
% Initialize the iterations of each target
targetIteration = ones(targetNum); 
for modalityNumber = 1:length(modalities)   
    %
    % Extract data
    % 
    for i=1:maxIterations
        currentTarget = loc(modalityNumber,i) + 1;
        currentTargetIteration = targetIteration(modalityNumber, currentTarget);
        % Task time
        tFinal(currentTarget, currentTargetIteration, modalityNumber) = t{modalityNumber,i}(end);
    
        % Upper arm displacement
        startPos = [zUA{modalityNumber, i}(1), xUA{modalityNumber, i}(1), yUA{modalityNumber, i}(1)];
        endPos = [zUA{modalityNumber, i}(end), xUA{modalityNumber, i}(end), yUA{modalityNumber, i}(end)];
        d_UA(currentTarget, currentTargetIteration, modalityNumber) = norm(endPos - startPos);
                        
        % Upper body displacement
        startPos = [zUB{modalityNumber, i}(1), xUB{modalityNumber, i}(1), yUB{modalityNumber, i}(1)];
        endPos = [zUB{modalityNumber, i}(end), xUB{modalityNumber, i}(end), yUB{modalityNumber, i}(end)];
        d_UB(currentTarget, currentTargetIteration, modalityNumber) = norm(endPos - startPos);        
        
        % Shoulder displacement
        startPos = [zSH{modalityNumber, i}(1), xSH{modalityNumber, i}(1), ySH{modalityNumber, i}(1)];
        endPos = [zSH{modalityNumber, i}(end), xSH{modalityNumber, i}(end), ySH{modalityNumber, i}(end)];
        d_SH(currentTarget, currentTargetIteration, modalityNumber) = norm(endPos - startPos) - d_UB(currentTarget, currentTargetIteration, modalityNumber);
                
        % Prosthesis utilization
        if (modalityNumber > 1)
            useData = 0;
            for k=1:length(t{modalityNumber,i})
                if(enable{modalityNumber, i}(k) == "True")
                    useData = useData + 1;
                end
            end            
            prosthesisActivation(currentTarget, currentTargetIteration, modalityNumber) = 100*useData/length(t{modalityNumber,i});
        end
        
        %
        % Smoothness
        %
        % Hand
        S_xHand(currentTarget, currentTargetIteration, modalityNumber) = SpectralArcLength(xDotHand{modalityNumber,i}', t{1, 1}(2));
        S_yHand(currentTarget, currentTargetIteration, modalityNumber) = SpectralArcLength(yDotHand{modalityNumber,i}', t{1, 1}(2));
        S_zHand(currentTarget, currentTargetIteration, modalityNumber) = SpectralArcLength(zDotHand{modalityNumber,i}', t{1, 1}(2));
        handSpeedMag_temp = vecnorm([xDotHand{modalityNumber,i}; yDotHand{modalityNumber,i}; zDotHand{modalityNumber,i}]);
        S_Hand(currentTarget, currentTargetIteration, modalityNumber) = SpectralArcLength(handSpeedMag_temp', t{1, 1}(2));
        % Upper arm
        S_xUA(currentTarget, currentTargetIteration, modalityNumber) = SpectralArcLength(xDotUA{modalityNumber,i}', t{1, 1}(2));
        S_yUA(currentTarget, currentTargetIteration, modalityNumber) = SpectralArcLength(yDotUA{modalityNumber,i}', t{1, 1}(2));
        S_zUA(currentTarget, currentTargetIteration, modalityNumber) = SpectralArcLength(zDotUA{modalityNumber,i}', t{1, 1}(2));
        uaSpeedMag_temp = vecnorm([xDotUA{modalityNumber,i}; yDotUA{modalityNumber,i}; zDotUA{modalityNumber,i}]);
        S_UA(currentTarget, currentTargetIteration, modalityNumber) = SpectralArcLength(uaSpeedMag_temp', t{1, 1}(2));
        % Shoulder
        S_xSH(currentTarget, currentTargetIteration, modalityNumber) = SpectralArcLength(xDotSH{modalityNumber,i}', t{1, 1}(2));
        S_ySH(currentTarget, currentTargetIteration, modalityNumber) = SpectralArcLength(yDotSH{modalityNumber,i}', t{1, 1}(2));
        S_zSH(currentTarget, currentTargetIteration, modalityNumber) = SpectralArcLength(zDotSH{modalityNumber,i}', t{1, 1}(2));
        shSpeedMag_temp = vecnorm([xDotSH{modalityNumber,i}; yDotSH{modalityNumber,i}; zDotSH{modalityNumber,i}]);
        S_SH(currentTarget, currentTargetIteration, modalityNumber) = SpectralArcLength(shSpeedMag_temp', t{1, 1}(2));
        % Upper body
        S_xUB(currentTarget, currentTargetIteration, modalityNumber) = SpectralArcLength(xDotUB{modalityNumber,i}', t{1, 1}(2));
        S_yUB(currentTarget, currentTargetIteration, modalityNumber) = SpectralArcLength(yDotUB{modalityNumber,i}', t{1, 1}(2));
        S_zUB(currentTarget, currentTargetIteration, modalityNumber) = SpectralArcLength(zDotUB{modalityNumber,i}', t{1, 1}(2));
        ubSpeedMag_temp = vecnorm([xDotUB{modalityNumber,i}; yDotUB{modalityNumber,i}; zDotUB{modalityNumber,i}]);
        S_UB(currentTarget, currentTargetIteration, modalityNumber) = SpectralArcLength(ubSpeedMag_temp', t{1, 1}(2));
        
        % Update iterator
        targetIteration(modalityNumber, currentTarget) = targetIteration(modalityNumber, currentTarget) + 1;
        
        clear handSpeedMag_temp uaSpeedMag_temp shSpeedMag_temp ubSpeedMag_temp
    end
    %
    % Calculate statistical data
    %
    for target = 1:targetNum
        % Mean
        mean_t(modalityNumber, target) = mean(tFinal(target, :, modalityNumber));
        mean_d_UA(modalityNumber, target) = mean(d_UA(target, :, modalityNumber));
        mean_d_SH(modalityNumber, target) = mean(d_SH(target, :, modalityNumber));
        mean_d_UB(modalityNumber, target) = mean(d_UB(target, :, modalityNumber));
        % Median
        median_t(modalityNumber, target) = median(tFinal(target, :, modalityNumber));
        median_d_UA(modalityNumber, target) = median(d_UA(target, :, modalityNumber));
        median_d_SH(modalityNumber, target) = median(d_SH(target, :, modalityNumber));
        median_d_UB(modalityNumber, target) = median(d_UB(target, :, modalityNumber));
        % Smoothness
        % Hand
        median_S_xHand(modalityNumber, target) = median(S_xHand(target, :, modalityNumber));
        median_S_yHand(modalityNumber, target) = median(S_yHand(target, :, modalityNumber));
        median_S_zHand(modalityNumber, target) = median(S_zHand(target, :, modalityNumber));
        median_S_Hand(modalityNumber, target) = median(S_Hand(target, :, modalityNumber));
        % UA
        median_S_xUA(modalityNumber, target) = median(S_xUA(target, :, modalityNumber));
        median_S_yUA(modalityNumber, target) = median(S_yUA(target, :, modalityNumber));
        median_S_zUA(modalityNumber, target) = median(S_zUA(target, :, modalityNumber));
        median_S_UA(modalityNumber, target) = median(S_UA(target, :, modalityNumber));
        % SH
        median_S_xSH(modalityNumber, target) = median(S_xSH(target, :, modalityNumber));
        median_S_ySH(modalityNumber, target) = median(S_ySH(target, :, modalityNumber));
        median_S_zSH(modalityNumber, target) = median(S_zSH(target, :, modalityNumber));
        median_S_SH(modalityNumber, target) = median(S_SH(target, :, modalityNumber));
        % UB
        median_S_xUB(modalityNumber, target) = median(S_xUB(target, :, modalityNumber));
        median_S_yUB(modalityNumber, target) = median(S_yUB(target, :, modalityNumber));
        median_S_zUB(modalityNumber, target) = median(S_zUB(target, :, modalityNumber));
        median_S_UB(modalityNumber, target) = median(S_UB(target, :, modalityNumber));
        % Standard deviation
        std_t(modalityNumber, target) = std(tFinal(target, :, modalityNumber));
        std_d_UA(modalityNumber, target) = std(d_UA(target, :, modalityNumber));
        std_d_SH(modalityNumber, target) = std(d_SH(target, :, modalityNumber));
        std_d_UB(modalityNumber, target) = std(d_UB(target, :, modalityNumber));
        % Quantiles
        quant_t(:, modalityNumber, target) = quantile(tFinal(target, :, modalityNumber), [0.25 0.75]);
        quant_d_UA(:, modalityNumber, target) = quantile(d_UA(target, :, modalityNumber), [0.25 0.75]);
        quant_d_SH(:, modalityNumber, target) = quantile(d_SH(target, :, modalityNumber), [0.25 0.75]);
        quant_d_UB(:, modalityNumber, target) = quantile(d_UB(target, :, modalityNumber), [0.25 0.75]);
        % Smoothness
        % Hand
        quant_S_xHand(:, modalityNumber, target) = quantile(S_xHand(target, :, modalityNumber), [0.25 0.75]);
        quant_S_yHand(:, modalityNumber, target) = quantile(S_yHand(target, :, modalityNumber), [0.25 0.75]);
        quant_S_zHand(:, modalityNumber, target) = quantile(S_zHand(target, :, modalityNumber), [0.25 0.75]);
        quant_S_Hand(:, modalityNumber, target) = quantile(S_Hand(target, :, modalityNumber), [0.25 0.75]);
        % UA
        quant_S_xUA(:, modalityNumber, target) = quantile(S_xUA(target, :, modalityNumber), [0.25 0.75]);
        quant_S_yUA(:, modalityNumber, target) = quantile(S_yUA(target, :, modalityNumber), [0.25 0.75]);
        quant_S_zUA(:, modalityNumber, target) = quantile(S_zUA(target, :, modalityNumber), [0.25 0.75]);
        quant_S_UA(:, modalityNumber, target) = quantile(S_UA(target, :, modalityNumber), [0.25 0.75]);
        % SH
        quant_S_xSH(:, modalityNumber, target) = quantile(S_xSH(target, :, modalityNumber), [0.25 0.75]);
        quant_S_ySH(:, modalityNumber, target) = quantile(S_ySH(target, :, modalityNumber), [0.25 0.75]);
        quant_S_zSH(:, modalityNumber, target) = quantile(S_zSH(target, :, modalityNumber), [0.25 0.75]);
        quant_S_SH(:, modalityNumber, target) = quantile(S_SH(target, :, modalityNumber), [0.25 0.75]);
        % UB
        quant_S_xUB(:, modalityNumber, target) = quantile(S_xUB(target, :, modalityNumber), [0.25 0.75]);
        quant_S_yUB(:, modalityNumber, target) = quantile(S_yUB(target, :, modalityNumber), [0.25 0.75]);
        quant_S_zUB(:, modalityNumber, target) = quantile(S_zUB(target, :, modalityNumber), [0.25 0.75]);
        quant_S_UB(:, modalityNumber, target) = quantile(S_UB(target, :, modalityNumber), [0.25 0.75]);
        
        if (modalityNumber > 1)
            mean_pa(modalityNumber, target) = mean(prosthesisActivation(target, :, modalityNumber));
            median_pa(modalityNumber, target) = median(prosthesisActivation(target, :, modalityNumber));
            std_pa(modalityNumber, target) = std(prosthesisActivation(target, :, modalityNumber));
            quant_pa(:, modalityNumber, target) = quantile(prosthesisActivation(target, :, modalityNumber), [0.25 0.75]);            
        end
    end
    
%     % Plot data
%     x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
%     % Time data
%     figure(21)
%     hold on
%     p1{modalityNumber} = bar(x, median_t(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
% %     er = errorbar(x, median_t(modalityNumber,:), std_t(modalityNumber,:), 'k' , 'LineWidth', 0.8);                   
% %     er.LineStyle = 'none';
%     for target = 1:targetNum
%         plot([x(target) x(target)], [quant_t(1, modalityNumber, target), quant_t(2, modalityNumber, target)]...
%               ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
%     end
%     % Figure config
%     xlabel("Target");
%     ylabel("Time");
%     title("Median & Quartiles: Task time");
%     xlim([0 5]);
%     xticks([0 1 2 3 4 5]);
%     xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
%     
%     % Upper arm data
%     figure(22)
%     hold on
%     p2{modalityNumber} = bar(x, median_d_UA(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
% %     er = errorbar(x, median_d_UA(modalityNumber,:), std_d_UA(modalityNumber,:), 'k' , 'LineWidth', 0.8);                   
% %     er.LineStyle = 'none';  
%     for target = 1:targetNum
%         plot([x(target) x(target)], [quant_d_UA(1, modalityNumber, target), quant_d_UA(2, modalityNumber, target)]...
%               ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
%     end
%     % Figure config
%     xlabel("Target");
%     ylabel("Distance");
%     title("Median & Quartiles: Upper Arm Displacement");
%     xlim([0 5]);
%     xticks([0 1 2 3 4 5]);
%     xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
%     
%     % Shoulder data
%     figure(23)
%     hold on
%     x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
%     p3{modalityNumber} = bar(x, median_d_SH(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
% %     er = errorbar(x, median_d_SH(modalityNumber,:), std_d_SH(modalityNumber,:), 'k' , 'LineWidth', 0.8);                   
% %     er.LineStyle = 'none';  
%     for target = 1:targetNum
%         plot([x(target) x(target)], [quant_d_SH(1, modalityNumber, target), quant_d_SH(2, modalityNumber, target)]...
%               ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
%     end
%     % Figure config
%     xlabel("Target");
%     ylabel("Distance");
%     title("Median & Quartiles: Shoulder Displacement");
%     xlim([0 5]);
%     xticks([0 1 2 3 4 5]);
%     xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
%     
%     % Upper body data
%     figure(24)
%     hold on
%     x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
%     p4{modalityNumber} = bar(x, median_d_UB(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
% %     er = errorbar(x, median_d_UB(modalityNumber,:), std_d_UB(modalityNumber,:), 'k' , 'LineWidth', 0.8);                   
% %     er.LineStyle = 'none';  
%     for target = 1:targetNum
%         plot([x(target) x(target)], [quant_d_UB(1, modalityNumber, target), quant_d_UB(2, modalityNumber, target)]...
%               ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
%     end
%     % Figure config
%     xlabel("Target");
%     ylabel("Distance");
%     title("Median & Quartiles: Upper Body Displacement");
%     xlim([0 5]);
%     xticks([0 1 2 3 4 5]);
%     xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
%     
%     if (modalityNumber > 1)
%         % Prosthesis activation data
%         figure(25)
%         hold on
%         x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
%         p5{modalityNumber} = bar(x, median_pa(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
%     %     er = errorbar(x, median_pa(modalityNumber,:), std_pa(modalityNumber,:), 'k' , 'LineWidth', 0.8);                   
%     %     er.LineStyle = 'none';  
%         for target = 1:targetNum
%             plot([x(target) x(target)], [quant_pa(1, modalityNumber, target), quant_pa(2, modalityNumber, target)]...
%                   ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
%         end
%         % Figure config
%         xlabel("Target");
%         ylabel("% of reach time");
%         title("Median & Quartiles: Prosthesis Utilization");
%         xlim([0 5]);
%         xticks([0 1 2 3 4 5]);
%         xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
%     end
%     
%     % Hand smoothness
%     % Upper body data
%     figure(26)
%     hold on
%     x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
%     p6{modalityNumber} = bar(x, median_S_Hand(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
% %     er = errorbar(x, median_d_UB(modalityNumber,:), std_d_UB(modalityNumber,:), 'k' , 'LineWidth', 0.8);                   
% %     er.LineStyle = 'none';  
%     for target = 1:targetNum
%         plot([x(target) x(target)], [quant_S_Hand(1, modalityNumber, target), quant_S_Hand(2, modalityNumber, target)]...
%               ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
%     end
%     % Figure config
%     xlabel("Target");
%     ylabel("Distance");
%     title("Median & Quartiles: Hand Smoothness");
%     xlim([0 5]);
%     xticks([0 1 2 3 4 5]);
%     xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
end

% figure(21)
% legend([p1{1} p1{2} p1{3} p1{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
% figure(22)
% legend([p2{1} p2{2} p2{3} p2{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
% figure(23)
% legend([p3{1} p3{2} p3{3} p3{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
% figure(24)
% legend([p4{1} p4{2} p4{3} p4{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
% figure(25)
% legend([p5{2} p5{3} p5{4}],{'EMG','Task-space Synergy','Joint-space Synergy'});
% clear p1 p2 p3 p4 p5