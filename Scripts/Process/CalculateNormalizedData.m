%
colours = {[0.8 0.8 0.8], 'b', 'r', 'g'};
armLength = subjectData.upperArmLength + subjectData.forearmLength + (subjectData.handLength/2);
%
d_UA_normalized = d_UA/armLength;
d_SH_normalized = d_SH/armLength;
d_UB_normalized = d_UB/armLength;

% Normalize the path
for modalityNumber = 1:4
    for currentTarget = 1:4
        for currentTargetIteration = 1:10
            % Hand
            xData_Hand_normalized{currentTarget, currentTargetIteration, modalityNumber} = -(xData_Hand{currentTarget, currentTargetIteration, modalityNumber} - xData_Hand{currentTarget, currentTargetIteration, modalityNumber}(1));
            yData_Hand_normalized{currentTarget, currentTargetIteration, modalityNumber} = (yData_Hand{currentTarget, currentTargetIteration, modalityNumber} - yData_Hand{currentTarget, currentTargetIteration, modalityNumber}(1));
            zData_Hand_normalized{currentTarget, currentTargetIteration, modalityNumber} = (zData_Hand{currentTarget, currentTargetIteration, modalityNumber} - zData_Hand{currentTarget, currentTargetIteration, modalityNumber}(1));
            % UB
            xData_UB_normalized{currentTarget, currentTargetIteration, modalityNumber} = -(xData_UB{currentTarget, currentTargetIteration, modalityNumber} - xData_UB{currentTarget, currentTargetIteration, modalityNumber}(1));
            yData_UB_normalized{currentTarget, currentTargetIteration, modalityNumber} = (yData_UB{currentTarget, currentTargetIteration, modalityNumber} - yData_UB{currentTarget, currentTargetIteration, modalityNumber}(1));
            zData_UB_normalized{currentTarget, currentTargetIteration, modalityNumber} = (zData_UB{currentTarget, currentTargetIteration, modalityNumber} - zData_UB{currentTarget, currentTargetIteration, modalityNumber}(1));
            % SH
            xData_SH_normalized{currentTarget, currentTargetIteration, modalityNumber} = -(xData_SH{currentTarget, currentTargetIteration, modalityNumber} - xData_SH{currentTarget, currentTargetIteration, modalityNumber}(1));
            yData_SH_normalized{currentTarget, currentTargetIteration, modalityNumber} = (yData_SH{currentTarget, currentTargetIteration, modalityNumber} - yData_SH{currentTarget, currentTargetIteration, modalityNumber}(1));
            zData_SH_normalized{currentTarget, currentTargetIteration, modalityNumber} = (zData_SH{currentTarget, currentTargetIteration, modalityNumber} - zData_SH{currentTarget, currentTargetIteration, modalityNumber}(1));
            % UA
            xData_UA_normalized{currentTarget, currentTargetIteration, modalityNumber} = -(xData_UA{currentTarget, currentTargetIteration, modalityNumber} - xData_UA{currentTarget, currentTargetIteration, modalityNumber}(1));
            yData_UA_normalized{currentTarget, currentTargetIteration, modalityNumber} = (yData_UA{currentTarget, currentTargetIteration, modalityNumber} - yData_UA{currentTarget, currentTargetIteration, modalityNumber}(1));
            zData_UA_normalized{currentTarget, currentTargetIteration, modalityNumber} = (zData_UA{currentTarget, currentTargetIteration, modalityNumber} - zData_UA{currentTarget, currentTargetIteration, modalityNumber}(1));
            
            % Angular
            % UB
%             aData_UB_normalized{currentTarget, currentTargetIteration, modalityNumber} = (aData_UB{currentTarget, currentTargetIteration, modalityNumber} - aData_UB{currentTarget, currentTargetIteration, modalityNumber}(1));
%             bData_UB_normalized{currentTarget, currentTargetIteration, modalityNumber} = (bData_UB{currentTarget, currentTargetIteration, modalityNumber} - bData_UB{currentTarget, currentTargetIteration, modalityNumber}(1));
%             gData_UB_normalized{currentTarget, currentTargetIteration, modalityNumber} = (gData_UB{currentTarget, currentTargetIteration, modalityNumber} - gData_UB{currentTarget, currentTargetIteration, modalityNumber}(1));
%             % SH
%             aData_SH_normalized{currentTarget, currentTargetIteration, modalityNumber} = (aData_SH{currentTarget, currentTargetIteration, modalityNumber} - aData_SH{currentTarget, currentTargetIteration, modalityNumber}(1));
%             bData_SH_normalized{currentTarget, currentTargetIteration, modalityNumber} = (bData_SH{currentTarget, currentTargetIteration, modalityNumber} - bData_SH{currentTarget, currentTargetIteration, modalityNumber}(1));
%             gData_SH_normalized{currentTarget, currentTargetIteration, modalityNumber} = (gData_SH{currentTarget, currentTargetIteration, modalityNumber} - gData_SH{currentTarget, currentTargetIteration, modalityNumber}(1));
            % UA
            aData_UA_normalized{currentTarget, currentTargetIteration, modalityNumber} = (aData_UA{currentTarget, currentTargetIteration, modalityNumber} - aData_UA{currentTarget, currentTargetIteration, modalityNumber}(1));
            bData_UA_normalized{currentTarget, currentTargetIteration, modalityNumber} = (bData_UA{currentTarget, currentTargetIteration, modalityNumber} - bData_UA{currentTarget, currentTargetIteration, modalityNumber}(1));
            gData_UA_normalized{currentTarget, currentTargetIteration, modalityNumber} = (gData_UA{currentTarget, currentTargetIteration, modalityNumber} - gData_UA{currentTarget, currentTargetIteration, modalityNumber}(1));
        end
    end
end


%%
% Statistical data
% Extract statistical motor behaviour
% for each modality
for modalityNumber = 1:length(modalities)   
    % and each target
    for target = 1:targetNum
        % dump the data into a new temporary array
        clear xDataTemp_UA yDataTemp_UA zDataTemp_UA ...
              aDataTemp_UA bDataTemp_UA gDataTemp_UA ...
              xDataTemp_SH yDataTemp_SH zDataTemp_SH ...
              xDataTemp_UB yDataTemp_UB zDataTemp_UB ...
              xDataTemp_Hand yDataTemp_Hand zDataTemp_Hand
        for i = 1:iterationsPerTarget 
            for j = 1:maxSamples(modalityNumber, target)
                if (j > length(xData_UA_normalized{target, i, modalityNumber}))
                    % Upper arm trajectory
                    xDataTemp_UA(j,i) = xData_UA_normalized{target, i, modalityNumber}(end);
                    yDataTemp_UA(j,i) = yData_UA_normalized{target, i, modalityNumber}(end);
                    zDataTemp_UA(j,i) = zData_UA_normalized{target, i, modalityNumber}(end);
                    % Upper arm angular trajectory
                    aDataTemp_UA(j,i) = aData_UA_normalized{target, i, modalityNumber}(end);
                    bDataTemp_UA(j,i) = bData_UA_normalized{target, i, modalityNumber}(end);
                    gDataTemp_UA(j,i) = gData_UA_normalized{target, i, modalityNumber}(end);
                    % Shoulder trajectory
                    xDataTemp_SH(j,i) = xData_SH_normalized{target, i, modalityNumber}(end);
                    yDataTemp_SH(j,i) = yData_SH_normalized{target, i, modalityNumber}(end);
                    zDataTemp_SH(j,i) = zData_SH_normalized{target, i, modalityNumber}(end);
                    % Upper body trajectory
                    xDataTemp_UB(j,i) = xData_UB_normalized{target, i, modalityNumber}(end);
                    yDataTemp_UB(j,i) = yData_UB_normalized{target, i, modalityNumber}(end);
                    zDataTemp_UB(j,i) = zData_UB_normalized{target, i, modalityNumber}(end);
                    % Hand trajectory
                    xDataTemp_Hand(j,i) = xData_Hand_normalized{target, i, modalityNumber}(end);
                    yDataTemp_Hand(j,i) = yData_Hand_normalized{target, i, modalityNumber}(end);
                    zDataTemp_Hand(j,i) = zData_Hand_normalized{target, i, modalityNumber}(end);
                else
                    % Upper arm trajectory
                    xDataTemp_UA(j,i) = xData_UA_normalized{target, i, modalityNumber}(j);
                    yDataTemp_UA(j,i) = yData_UA_normalized{target, i, modalityNumber}(j);
                    zDataTemp_UA(j,i) = zData_UA_normalized{target, i, modalityNumber}(j);
                    % Upper arm angular trajectory
                    aDataTemp_UA(j,i) = aData_UA_normalized{target, i, modalityNumber}(j);
                    bDataTemp_UA(j,i) = bData_UA_normalized{target, i, modalityNumber}(j);
                    gDataTemp_UA(j,i) = gData_UA_normalized{target, i, modalityNumber}(j);
                    % Shoulder trajectory
                    xDataTemp_SH(j,i) = xData_SH_normalized{target, i, modalityNumber}(j);
                    yDataTemp_SH(j,i) = yData_SH_normalized{target, i, modalityNumber}(j);
                    zDataTemp_SH(j,i) = zData_SH_normalized{target, i, modalityNumber}(j);
                    % Upper body trajectory
                    xDataTemp_UB(j,i) = xData_UB_normalized{target, i, modalityNumber}(j);
                    yDataTemp_UB(j,i) = yData_UB_normalized{target, i, modalityNumber}(j);
                    zDataTemp_UB(j,i) = zData_UB_normalized{target, i, modalityNumber}(j);
                    % Hand trajectory
                    xDataTemp_Hand(j,i) = xData_Hand_normalized{target, i, modalityNumber}(j);
                    yDataTemp_Hand(j,i) = yData_Hand_normalized{target, i, modalityNumber}(j);
                    zDataTemp_Hand(j,i) = zData_Hand_normalized{target, i, modalityNumber}(j);
                end
            end
        end
        
        % calculate mean/median
        % Upper arm trajectory
        xData_mean_UA_N{modalityNumber,target} = mean(xDataTemp_UA, 2);
        yData_mean_UA_N{modalityNumber,target} = mean(yDataTemp_UA, 2);
        zData_mean_UA_N{modalityNumber,target} = mean(zDataTemp_UA, 2);
        % Upper arm angular trajectory
        aData_mean_UA_N{modalityNumber,target} = mean(aDataTemp_UA, 2);
        bData_mean_UA_N{modalityNumber,target} = mean(bDataTemp_UA, 2);
        gData_mean_UA_N{modalityNumber,target} = mean(gDataTemp_UA, 2);
        % Shoulder trajectory
        xData_mean_SH_N{modalityNumber,target} = mean(xDataTemp_SH, 2);
        yData_mean_SH_N{modalityNumber,target} = mean(yDataTemp_SH, 2);
        zData_mean_SH_N{modalityNumber,target} = mean(zDataTemp_SH, 2);
        % Upper body trajectory
        xData_mean_UB_N{modalityNumber,target} = mean(xDataTemp_UB, 2);
        yData_mean_UB_N{modalityNumber,target} = mean(yDataTemp_UB, 2);
        zData_mean_UB_N{modalityNumber,target} = mean(zDataTemp_UB, 2);
        % Hand trajectory
        xData_mean_Hand_N{modalityNumber,target} = mean(xDataTemp_Hand, 2);
        yData_mean_Hand_N{modalityNumber,target} = mean(yDataTemp_Hand, 2);
        zData_mean_Hand_N{modalityNumber,target} = mean(zDataTemp_Hand, 2);
        
        % calculate std
        % Upper arm trajectory
%         xData_std_UA{modalityNumber,target} = std(xDataTemp_UA);
%         yData_std_UA{modalityNumber,target} = std(yDataTemp_UA);
%         zData_std_UA{modalityNumber,target} = std(zDataTemp_UA);
    end
end
clear xDataTemp_UA yDataTemp_UA zDataTemp_UA xDataTemp_SH ...
      yDataTemp_SH zDataTemp_SH xDataTemp_UB yDataTemp_UB ...
      zDataTemp_UB xDataTemp_Hand yDataTemp_Hand zDataTemp_Hand

%
% Calculate mean hand path difference
%
% Plot the subject's hand path on the sagittal plane
for modalityNumber = 2:4
    for target = 1:4
        for k = 1:length(xData_mean_Hand_N{modalityNumber,target})
            % Calculate the difference between able and modalities
            if (k > length(xData_mean_Hand_N{1,target}))
                % Hand
                xHand_mean_diff_N{modalityNumber,target}(k) = abs(xData_mean_Hand_N{1,target}(end) - xData_mean_Hand_N{modalityNumber,target}(k));
                yHand_mean_diff_N{modalityNumber,target}(k) = abs(yData_mean_Hand_N{1,target}(end) - yData_mean_Hand_N{modalityNumber,target}(k));
                zHand_mean_diff_N{modalityNumber,target}(k) = abs(zData_mean_Hand_N{1,target}(end) - zData_mean_Hand_N{modalityNumber,target}(k));
                % UB
                xUB_mean_diff_N{modalityNumber,target}(k) = abs(xData_mean_UB_N{1,target}(end) - xData_mean_UB_N{modalityNumber,target}(k));
                yUB_mean_diff_N{modalityNumber,target}(k) = abs(yData_mean_UB_N{1,target}(end) - yData_mean_UB_N{modalityNumber,target}(k));
                zUB_mean_diff_N{modalityNumber,target}(k) = abs(zData_mean_UB_N{1,target}(end) - zData_mean_UB_N{modalityNumber,target}(k));
                % SH
                xSH_mean_diff_N{modalityNumber,target}(k) = abs(xData_mean_SH_N{1,target}(end) - xData_mean_SH_N{modalityNumber,target}(k));
                ySH_mean_diff_N{modalityNumber,target}(k) = abs(yData_mean_SH_N{1,target}(end) - yData_mean_SH_N{modalityNumber,target}(k));
                zSH_mean_diff_N{modalityNumber,target}(k) = abs(zData_mean_SH_N{1,target}(end) - zData_mean_SH_N{modalityNumber,target}(k));
                % UA
                xUA_mean_diff_N{modalityNumber,target}(k) = abs(xData_mean_UA_N{1,target}(end) - xData_mean_UA_N{modalityNumber,target}(k));
                yUA_mean_diff_N{modalityNumber,target}(k) = abs(yData_mean_UA_N{1,target}(end) - yData_mean_UA_N{modalityNumber,target}(k));
                zUA_mean_diff_N{modalityNumber,target}(k) = abs(zData_mean_UA_N{1,target}(end) - zData_mean_UA_N{modalityNumber,target}(k));
                aUA_mean_diff_N{modalityNumber,target}(k) = abs(aData_mean_UA_N{1,target}(end) - aData_mean_UA_N{modalityNumber,target}(k));
                bUA_mean_diff_N{modalityNumber,target}(k) = abs(bData_mean_UA_N{1,target}(end) - bData_mean_UA_N{modalityNumber,target}(k));
                gUA_mean_diff_N{modalityNumber,target}(k) = abs(gData_mean_UA_N{1,target}(end) - gData_mean_UA_N{modalityNumber,target}(k));
            else
                % Hand
                xHand_mean_diff_N{modalityNumber,target}(k) = abs(xData_mean_Hand_N{1,target}(k) - xData_mean_Hand_N{modalityNumber,target}(k));
                yHand_mean_diff_N{modalityNumber,target}(k) = abs(yData_mean_Hand_N{1,target}(k) - yData_mean_Hand_N{modalityNumber,target}(k));
                zHand_mean_diff_N{modalityNumber,target}(k) = abs(xData_mean_Hand_N{1,target}(k) - zData_mean_Hand_N{modalityNumber,target}(k));
                % UB
                xUB_mean_diff_N{modalityNumber,target}(k) = abs(xData_mean_UB_N{1,target}(k) - xData_mean_UB_N{modalityNumber,target}(k));
                yUB_mean_diff_N{modalityNumber,target}(k) = abs(yData_mean_UB_N{1,target}(k) - yData_mean_UB_N{modalityNumber,target}(k));
                zUB_mean_diff_N{modalityNumber,target}(k) = abs(xData_mean_UB_N{1,target}(k) - zData_mean_UB_N{modalityNumber,target}(k));
                % SH
                xSH_mean_diff_N{modalityNumber,target}(k) = abs(xData_mean_SH_N{1,target}(k) - xData_mean_SH_N{modalityNumber,target}(k));
                ySH_mean_diff_N{modalityNumber,target}(k) = abs(yData_mean_SH_N{1,target}(k) - yData_mean_SH_N{modalityNumber,target}(k));
                zSH_mean_diff_N{modalityNumber,target}(k) = abs(xData_mean_SH_N{1,target}(k) - zData_mean_SH_N{modalityNumber,target}(k));
                % UA
                xUA_mean_diff_N{modalityNumber,target}(k) = abs(xData_mean_UA_N{1,target}(k) - xData_mean_UA_N{modalityNumber,target}(k));
                yUA_mean_diff_N{modalityNumber,target}(k) = abs(yData_mean_UA_N{1,target}(k) - yData_mean_UA_N{modalityNumber,target}(k));
                zUA_mean_diff_N{modalityNumber,target}(k) = abs(xData_mean_UA_N{1,target}(k) - zData_mean_UA_N{modalityNumber,target}(k));
                aUA_mean_diff_N{modalityNumber,target}(k) = abs(aData_mean_UA_N{1,target}(k) - aData_mean_UA_N{modalityNumber,target}(k));
                bUA_mean_diff_N{modalityNumber,target}(k) = abs(bData_mean_UA_N{1,target}(k) - bData_mean_UA_N{modalityNumber,target}(k));
                gUA_mean_diff_N{modalityNumber,target}(k) = abs(gData_mean_UA_N{1,target}(k) - gData_mean_UA_N{modalityNumber,target}(k));
            end
            % Hand
            xHand_diff_total_N{modalityNumber,target} = sum(xHand_mean_diff_N{modalityNumber,target});
            yHand_diff_total_N{modalityNumber,target} = sum(yHand_mean_diff_N{modalityNumber,target});
            zHand_diff_total_N{modalityNumber,target} = sum(zHand_mean_diff_N{modalityNumber,target});
            xHand_diff_avg_N{modalityNumber,target} = mean(xHand_mean_diff_N{modalityNumber,target});
            yHand_diff_avg_N{modalityNumber,target} = mean(yHand_mean_diff_N{modalityNumber,target});
            zHand_diff_avg_N{modalityNumber,target} = mean(zHand_mean_diff_N{modalityNumber,target});
            % UB
            xUB_diff_total_N{modalityNumber,target} = sum(xUB_mean_diff_N{modalityNumber,target});
            yUB_diff_total_N{modalityNumber,target} = sum(yUB_mean_diff_N{modalityNumber,target});
            zUB_diff_total_N{modalityNumber,target} = sum(zUB_mean_diff_N{modalityNumber,target});
            xUB_diff_avg_N{modalityNumber,target} = mean(xUB_mean_diff_N{modalityNumber,target});
            yUB_diff_avg_N{modalityNumber,target} = mean(yUB_mean_diff_N{modalityNumber,target});
            zUB_diff_avg_N{modalityNumber,target} = mean(zUB_mean_diff_N{modalityNumber,target});
            % SH
            xSH_diff_total_N{modalityNumber,target} = sum(xSH_mean_diff_N{modalityNumber,target});
            ySH_diff_total_N{modalityNumber,target} = sum(ySH_mean_diff_N{modalityNumber,target});
            zSH_diff_total_N{modalityNumber,target} = sum(zSH_mean_diff_N{modalityNumber,target});
            xSH_diff_avg_N{modalityNumber,target} = mean(xSH_mean_diff_N{modalityNumber,target});
            ySH_diff_avg_N{modalityNumber,target} = mean(ySH_mean_diff_N{modalityNumber,target});
            zSH_diff_avg_N{modalityNumber,target} = mean(zSH_mean_diff_N{modalityNumber,target});
            % UA
            xUA_diff_total_N{modalityNumber,target} = sum(xUA_mean_diff_N{modalityNumber,target});
            yUA_diff_total_N{modalityNumber,target} = sum(yUA_mean_diff_N{modalityNumber,target});
            zUA_diff_total_N{modalityNumber,target} = sum(zUA_mean_diff_N{modalityNumber,target});
            xUA_diff_avg_N{modalityNumber,target} = mean(xUA_mean_diff_N{modalityNumber,target});
            yUA_diff_avg_N{modalityNumber,target} = mean(yUA_mean_diff_N{modalityNumber,target});
            zUA_diff_avg_N{modalityNumber,target} = mean(zUA_mean_diff_N{modalityNumber,target});
            aUA_diff_total_N{modalityNumber,target} = sum(aUA_mean_diff_N{modalityNumber,target});
            bUA_diff_total_N{modalityNumber,target} = sum(bUA_mean_diff_N{modalityNumber,target});
            gUA_diff_total_N{modalityNumber,target} = sum(gUA_mean_diff_N{modalityNumber,target});
            aUA_diff_avg_N{modalityNumber,target} = mean(aUA_mean_diff_N{modalityNumber,target});
            bUA_diff_avg_N{modalityNumber,target} = mean(bUA_mean_diff_N{modalityNumber,target});
            gUA_diff_avg_N{modalityNumber,target} = mean(gUA_mean_diff_N{modalityNumber,target});
        end
    end
end 

% %% Plot
for modalityNumber = 1:length(modalities)  
    for target = 1:targetNum
        % Mean
        mean_d_UA_normalized(modalityNumber, target) = mean(d_UA_normalized(target, :, modalityNumber));
        mean_d_SH_normalized(modalityNumber, target) = mean(d_SH_normalized(target, :, modalityNumber));
        mean_d_UB_normalized(modalityNumber, target) = mean(d_UB_normalized(target, :, modalityNumber));
        % Median
        median_d_UA_normalized(modalityNumber, target) = median(d_UA_normalized(target, :, modalityNumber));
        median_d_SH_normalized(modalityNumber, target) = median(d_SH_normalized(target, :, modalityNumber));
        median_d_UB_normalized(modalityNumber, target) = median(d_UB_normalized(target, :, modalityNumber));
        % Standard deviation
        std_d_UA_normalized(modalityNumber, target) = std(d_UA_normalized(target, :, modalityNumber));
        std_d_SH_normalized(modalityNumber, target) = std(d_SH_normalized(target, :, modalityNumber));
        std_d_UB_normalized(modalityNumber, target) = std(d_UB_normalized(target, :, modalityNumber));
        % Quantiles
        quant_d_UA_normalized(:, modalityNumber, target) = quantile(d_UA_normalized(target, :, modalityNumber), [0.25 0.75]);
        quant_d_SH_normalized(:, modalityNumber, target) = quantile(d_SH_normalized(target, :, modalityNumber), [0.25 0.75]);
        quant_d_UB_normalized(:, modalityNumber, target) = quantile(d_UB_normalized(target, :, modalityNumber), [0.25 0.75]);
    end
end
% 
%     % Plot data
%     x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
%     % Upper arm data
%     figure(31)
%     hold on
%     p1{modalityNumber} = bar(x, median_d_UA_normalized(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
% %     er = errorbar(x, median_d_UA(modalityNumber,:), std_d_UA(modalityNumber,:), 'k' , 'LineWidth', 0.8);                   
% %     er.LineStyle = 'none';  
%     for target = 1:targetNum
%         plot([x(target) x(target)], [quant_d_UA_normalized(1, modalityNumber, target), quant_d_UA_normalized(2, modalityNumber, target)]...
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
%     figure(32)
%     hold on
%     x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
%     p2{modalityNumber} = bar(x, median_d_SH_normalized(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
% %     er = errorbar(x, median_d_SH(modalityNumber,:), std_d_SH(modalityNumber,:), 'k' , 'LineWidth', 0.8);                   
% %     er.LineStyle = 'none';  
%     for target = 1:targetNum
%         plot([x(target) x(target)], [quant_d_SH_normalized(1, modalityNumber, target), quant_d_SH_normalized(2, modalityNumber, target)]...
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
%     figure(33)
%     hold on
%     x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
%     p3{modalityNumber} = bar(x, median_d_UB_normalized(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
% %     er = errorbar(x, median_d_UB(modalityNumber,:), std_d_UB(modalityNumber,:), 'k' , 'LineWidth', 0.8);                   
% %     er.LineStyle = 'none';  
%     for target = 1:targetNum
%         plot([x(target) x(target)], [quant_d_UB_normalized(1, modalityNumber, target), quant_d_UB_normalized(2, modalityNumber, target)]...
%               ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
%     end
%     % Figure config
%     xlabel("Target");
%     ylabel("Distance");
%     title("Median & Quartiles: Upper Body Displacement");
%     xlim([0 5]);
%     xticks([0 1 2 3 4 5]);
%     xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
% end
% 
% figure(31)
% legend([p1{1} p1{2} p1{3} p1{4}],{'Able-bodied','EMG','Proposed','Constant Synergy'});
% figure(32)
% legend([p2{1} p2{2} p2{3} p2{4}],{'Able-bodied','EMG','Proposed','Constant Synergy'});
% figure(33)
% legend([p3{1} p3{2} p3{3} p3{4}],{'Able-bodied','EMG','Proposed','Constant Synergy'});