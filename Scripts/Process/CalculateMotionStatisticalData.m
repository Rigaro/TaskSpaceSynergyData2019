%
colours = {'k', 'b', 'r', 'g'};
iterationsPerTarget = 10;
modalitiesModified = {'Able', 'EMG', 'Task', 'Joint'};
targetNames = {'Close', 'Mid', 'Far', 'High'};
t_sampledDataDummy = 0:0.011111110000000:20;
%
% Initialize the iterations of each target
targetIteration = ones(targetNum); 
maxSamples = zeros(length(modalities),targetNum);
for modalityNumber = 1:length(modalities)   
    %
    % Extract data
    % 
    for i=1:maxIterations
        currentTarget = loc(modalityNumber,i) + 1;
        currentTargetIteration = targetIteration(modalityNumber, currentTarget);
        
        % Upper arm trajectory
        xData_UA{currentTarget, currentTargetIteration, modalityNumber} = xUA{modalityNumber, i};
        yData_UA{currentTarget, currentTargetIteration, modalityNumber} = yUA{modalityNumber, i};    
        zData_UA{currentTarget, currentTargetIteration, modalityNumber} = zUA{modalityNumber, i};
        
        % Upper arm angular trajectory
        aData_UA{currentTarget, currentTargetIteration, modalityNumber} = aUA{modalityNumber, i};
        bData_UA{currentTarget, currentTargetIteration, modalityNumber} = bUA{modalityNumber, i};    
        gData_UA{currentTarget, currentTargetIteration, modalityNumber} = gUA{modalityNumber, i};
        
        % Elbow angular trajectory
        qData_E{currentTarget, currentTargetIteration, modalityNumber} = qE{modalityNumber, i};
                
        % Shoulder trajectory
        xData_SH{currentTarget, currentTargetIteration, modalityNumber} = xSH{modalityNumber, i};
        yData_SH{currentTarget, currentTargetIteration, modalityNumber} = ySH{modalityNumber, i};    
        zData_SH{currentTarget, currentTargetIteration, modalityNumber} = zSH{modalityNumber, i};    
                
        % Upper body trajectory
        xData_UB{currentTarget, currentTargetIteration, modalityNumber} = xUB{modalityNumber, i};
        yData_UB{currentTarget, currentTargetIteration, modalityNumber} = yUB{modalityNumber, i};    
        zData_UB{currentTarget, currentTargetIteration, modalityNumber} = zUB{modalityNumber, i};
        
        % Hand trajectory
        xData_Hand{currentTarget, currentTargetIteration, modalityNumber} = xHand{modalityNumber, i};
        yData_Hand{currentTarget, currentTargetIteration, modalityNumber} = yHand{modalityNumber, i};    
        zData_Hand{currentTarget, currentTargetIteration, modalityNumber} = zHand{modalityNumber, i};
        
        % Update iterator
        targetIteration(modalityNumber, currentTarget) = targetIteration(modalityNumber, currentTarget) + 1;
    end
    
    % Get shortest dataset
    for target = 1:targetNum
        for iteration = 1:iterationsPerTarget
           if(length(xData_UA{target, iteration, modalityNumber}) > maxSamples(modalityNumber, target))
               maxSamples(modalityNumber, target) = length(xData_UA{target, iteration, modalityNumber});
           end
        end
    end
end

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
                if (j > length(xData_UA{target, i, modalityNumber}))
                    % Upper arm trajectory
                    xDataTemp_UA(j,i) = xData_UA{target, i, modalityNumber}(end);
                    yDataTemp_UA(j,i) = yData_UA{target, i, modalityNumber}(end);
                    zDataTemp_UA(j,i) = zData_UA{target, i, modalityNumber}(end);
                    % Upper arm angular trajectory
                    aDataTemp_UA(j,i) = aData_UA{target, i, modalityNumber}(end);
                    bDataTemp_UA(j,i) = bData_UA{target, i, modalityNumber}(end);
                    gDataTemp_UA(j,i) = gData_UA{target, i, modalityNumber}(end);
                    % Shoulder trajectory
                    xDataTemp_SH(j,i) = xData_SH{target, i, modalityNumber}(end);
                    yDataTemp_SH(j,i) = yData_SH{target, i, modalityNumber}(end);
                    zDataTemp_SH(j,i) = zData_SH{target, i, modalityNumber}(end);
                    % Upper body trajectory
                    xDataTemp_UB(j,i) = xData_UB{target, i, modalityNumber}(end);
                    yDataTemp_UB(j,i) = yData_UB{target, i, modalityNumber}(end);
                    zDataTemp_UB(j,i) = zData_UB{target, i, modalityNumber}(end);
                    % Hand trajectory
                    xDataTemp_Hand(j,i) = xData_Hand{target, i, modalityNumber}(end);
                    yDataTemp_Hand(j,i) = yData_Hand{target, i, modalityNumber}(end);
                    zDataTemp_Hand(j,i) = zData_Hand{target, i, modalityNumber}(end);
                else
                    % Upper arm trajectory
                    xDataTemp_UA(j,i) = xData_UA{target, i, modalityNumber}(j);
                    yDataTemp_UA(j,i) = yData_UA{target, i, modalityNumber}(j);
                    zDataTemp_UA(j,i) = zData_UA{target, i, modalityNumber}(j);
                    % Upper arm angular trajectory
                    aDataTemp_UA(j,i) = aData_UA{target, i, modalityNumber}(j);
                    bDataTemp_UA(j,i) = bData_UA{target, i, modalityNumber}(j);
                    gDataTemp_UA(j,i) = gData_UA{target, i, modalityNumber}(j);
                    % Shoulder trajectory
                    xDataTemp_SH(j,i) = xData_SH{target, i, modalityNumber}(j);
                    yDataTemp_SH(j,i) = yData_SH{target, i, modalityNumber}(j);
                    zDataTemp_SH(j,i) = zData_SH{target, i, modalityNumber}(j);
                    % Upper body trajectory
                    xDataTemp_UB(j,i) = xData_UB{target, i, modalityNumber}(j);
                    yDataTemp_UB(j,i) = yData_UB{target, i, modalityNumber}(j);
                    zDataTemp_UB(j,i) = zData_UB{target, i, modalityNumber}(j);
                    % Hand trajectory
                    xDataTemp_Hand(j,i) = xData_Hand{target, i, modalityNumber}(j);
                    yDataTemp_Hand(j,i) = yData_Hand{target, i, modalityNumber}(j);
                    zDataTemp_Hand(j,i) = zData_Hand{target, i, modalityNumber}(j);
                end
            end
        end
        
        % calculate mean/median
        % Upper arm trajectory
        xData_mean_UA{modalityNumber,target} = mean(xDataTemp_UA, 2);
        yData_mean_UA{modalityNumber,target} = mean(yDataTemp_UA, 2);
        zData_mean_UA{modalityNumber,target} = mean(zDataTemp_UA, 2);
        % Upper arm angular trajectory
        aData_mean_UA{modalityNumber,target} = mean(aDataTemp_UA, 2);
        bData_mean_UA{modalityNumber,target} = mean(bDataTemp_UA, 2);
        gData_mean_UA{modalityNumber,target} = mean(gDataTemp_UA, 2);
        % Shoulder trajectory
        xData_mean_SH{modalityNumber,target} = mean(xDataTemp_SH, 2);
        yData_mean_SH{modalityNumber,target} = mean(yDataTemp_SH, 2);
        zData_mean_SH{modalityNumber,target} = mean(zDataTemp_SH, 2);
        % Upper body trajectory
        xData_mean_UB{modalityNumber,target} = mean(xDataTemp_UB, 2);
        yData_mean_UB{modalityNumber,target} = mean(yDataTemp_UB, 2);
        zData_mean_UB{modalityNumber,target} = mean(zDataTemp_UB, 2);
        % Hand trajectory
        xData_mean_Hand{modalityNumber,target} = mean(xDataTemp_Hand, 2);
        yData_mean_Hand{modalityNumber,target} = mean(yDataTemp_Hand, 2);
        zData_mean_Hand{modalityNumber,target} = mean(zDataTemp_Hand, 2);
        
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
        for k = 1:length(xData_mean_Hand{modalityNumber,target})
            % Calculate the difference between able and modalities
            if (k > length(xData_mean_Hand{1,target}))
                % Hand
                xHand_mean_diff{modalityNumber,target}(k) = abs(xData_mean_Hand{1,target}(end) - xData_mean_Hand{modalityNumber,target}(k));
                yHand_mean_diff{modalityNumber,target}(k) = abs(yData_mean_Hand{1,target}(end) - yData_mean_Hand{modalityNumber,target}(k));
                zHand_mean_diff{modalityNumber,target}(k) = abs(zData_mean_Hand{1,target}(end) - zData_mean_Hand{modalityNumber,target}(k));
                % UB
                xUB_mean_diff{modalityNumber,target}(k) = abs(xData_mean_UB{1,target}(end) - xData_mean_UB{modalityNumber,target}(k));
                yUB_mean_diff{modalityNumber,target}(k) = abs(yData_mean_UB{1,target}(end) - yData_mean_UB{modalityNumber,target}(k));
                zUB_mean_diff{modalityNumber,target}(k) = abs(zData_mean_UB{1,target}(end) - zData_mean_UB{modalityNumber,target}(k));
                % SH
                xSH_mean_diff{modalityNumber,target}(k) = abs(xData_mean_SH{1,target}(end) - xData_mean_SH{modalityNumber,target}(k));
                ySH_mean_diff{modalityNumber,target}(k) = abs(yData_mean_SH{1,target}(end) - yData_mean_SH{modalityNumber,target}(k));
                zSH_mean_diff{modalityNumber,target}(k) = abs(zData_mean_SH{1,target}(end) - zData_mean_SH{modalityNumber,target}(k));
                % UA
                aUA_mean_diff{modalityNumber,target}(k) = abs(aData_mean_UA{1,target}(end) - aData_mean_UA{modalityNumber,target}(k));
                bUA_mean_diff{modalityNumber,target}(k) = abs(bData_mean_UA{1,target}(end) - bData_mean_UA{modalityNumber,target}(k));
                gUA_mean_diff{modalityNumber,target}(k) = abs(gData_mean_UA{1,target}(end) - gData_mean_UA{modalityNumber,target}(k));
            else
                % Hand
                xHand_mean_diff{modalityNumber,target}(k) = abs(xData_mean_Hand{1,target}(k) - xData_mean_Hand{modalityNumber,target}(k));
                yHand_mean_diff{modalityNumber,target}(k) = abs(yData_mean_Hand{1,target}(k) - yData_mean_Hand{modalityNumber,target}(k));
                zHand_mean_diff{modalityNumber,target}(k) = abs(xData_mean_Hand{1,target}(k) - zData_mean_Hand{modalityNumber,target}(k));
                % UB
                xUB_mean_diff{modalityNumber,target}(k) = abs(xData_mean_UB{1,target}(k) - xData_mean_UB{modalityNumber,target}(k));
                yUB_mean_diff{modalityNumber,target}(k) = abs(yData_mean_UB{1,target}(k) - yData_mean_UB{modalityNumber,target}(k));
                zUB_mean_diff{modalityNumber,target}(k) = abs(xData_mean_UB{1,target}(k) - zData_mean_UB{modalityNumber,target}(k));
                % SH
                xSH_mean_diff{modalityNumber,target}(k) = abs(xData_mean_SH{1,target}(k) - xData_mean_SH{modalityNumber,target}(k));
                ySH_mean_diff{modalityNumber,target}(k) = abs(yData_mean_SH{1,target}(k) - yData_mean_SH{modalityNumber,target}(k));
                zSH_mean_diff{modalityNumber,target}(k) = abs(xData_mean_SH{1,target}(k) - zData_mean_SH{modalityNumber,target}(k));
                % UA
                aUA_mean_diff{modalityNumber,target}(k) = abs(aData_mean_UA{1,target}(k) - aData_mean_UA{modalityNumber,target}(k));
                bUA_mean_diff{modalityNumber,target}(k) = abs(bData_mean_UA{1,target}(k) - bData_mean_UA{modalityNumber,target}(k));
                gUA_mean_diff{modalityNumber,target}(k) = abs(gData_mean_UA{1,target}(k) - gData_mean_UA{modalityNumber,target}(k));
            end
            % Hand
            xHand_diff_total{modalityNumber,target} = sum(xHand_mean_diff{modalityNumber,target});
            yHand_diff_total{modalityNumber,target} = sum(yHand_mean_diff{modalityNumber,target});
            zHand_diff_total{modalityNumber,target} = sum(zHand_mean_diff{modalityNumber,target});
            xHand_diff_avg{modalityNumber,target} = mean(xHand_mean_diff{modalityNumber,target});
            yHand_diff_avg{modalityNumber,target} = mean(yHand_mean_diff{modalityNumber,target});
            zHand_diff_avg{modalityNumber,target} = mean(zHand_mean_diff{modalityNumber,target});
            % UB
            xUB_diff_total{modalityNumber,target} = sum(xUB_mean_diff{modalityNumber,target});
            yUB_diff_total{modalityNumber,target} = sum(yUB_mean_diff{modalityNumber,target});
            zUB_diff_total{modalityNumber,target} = sum(zUB_mean_diff{modalityNumber,target});
            xUB_diff_avg{modalityNumber,target} = mean(xUB_mean_diff{modalityNumber,target});
            yUB_diff_avg{modalityNumber,target} = mean(yUB_mean_diff{modalityNumber,target});
            zUB_diff_avg{modalityNumber,target} = mean(zUB_mean_diff{modalityNumber,target});
            % SH
            xSH_diff_total{modalityNumber,target} = sum(xSH_mean_diff{modalityNumber,target});
            ySH_diff_total{modalityNumber,target} = sum(ySH_mean_diff{modalityNumber,target});
            zSH_diff_total{modalityNumber,target} = sum(zSH_mean_diff{modalityNumber,target});
            xSH_diff_avg{modalityNumber,target} = mean(xSH_mean_diff{modalityNumber,target});
            ySH_diff_avg{modalityNumber,target} = mean(ySH_mean_diff{modalityNumber,target});
            zSH_diff_avg{modalityNumber,target} = mean(zSH_mean_diff{modalityNumber,target});
            % UA
            aUA_diff_total{modalityNumber,target} = sum(aUA_mean_diff{modalityNumber,target});
            bUA_diff_total{modalityNumber,target} = sum(bUA_mean_diff{modalityNumber,target});
            gUA_diff_total{modalityNumber,target} = sum(gUA_mean_diff{modalityNumber,target});
            aUA_diff_avg{modalityNumber,target} = mean(aUA_mean_diff{modalityNumber,target});
            bUA_diff_avg{modalityNumber,target} = mean(bUA_mean_diff{modalityNumber,target});
            gUA_diff_avg{modalityNumber,target} = mean(gUA_mean_diff{modalityNumber,target});
        end
    end
end 

% %%
% % Plot all data
% for modalityNumber = 1:length(modalities)   
%     % and each target
%     for target = 1:targetNum
%         currentDataLength = length(xData_mean_UA{modalityNumber,target});
%         %%%%%%%%%%%
%         % Upper arm
%         figure(51)
%         % x
%         subplot(3, targetNum, target);
%         hold on
%         plot(t_sampledDataDummy(1:currentDataLength), xData_mean_UA{modalityNumber,target} - xData_mean_UA{modalityNumber,target}(1), 'Color', string(colours(modalityNumber)));        
% %         xlim([0 max(quant_t(2, modalityNumber, target))]);
%         xlabel('Time (s)');
%         ylabel('Position (m)');
%         title("UA x trajectory. Target: " + targetNames(target));
%         % y
%         subplot(3, targetNum, 4 + target);
%         hold on
%         plot(t_sampledDataDummy(1:currentDataLength), yData_mean_UA{modalityNumber,target} - yData_mean_UA{modalityNumber,target}(1), 'Color', string(colours(modalityNumber)));    
% %         xlim([0 max(quant_t(2, modalityNumber, target))]);
%         xlabel('Time (s)');
%         ylabel('Position (m)');
%         title("UA y trajectory. Target: " + targetNames(target));
%         % z
%         subplot(3, targetNum, 8 + target);
%         hold on
%         plot(t_sampledDataDummy(1:currentDataLength), zData_mean_UA{modalityNumber,target} - zData_mean_UA{modalityNumber,target}(1), 'Color', string(colours(modalityNumber)));  
% %         xlim([0 max(quant_t(2, modalityNumber, target))]);
%         xlabel('Time (s)');
%         ylabel('Position (m)');
%         title("UA z trajectory. Target: " + targetNames(target));        
%         
%         %%%%%%%%%%%
%         % Shoulder
%         figure(52)
%         % x
%         subplot(3, targetNum, target);
%         hold on
%         plot(t_sampledDataDummy(1:currentDataLength), xData_mean_SH{modalityNumber,target} - xData_mean_SH{modalityNumber,target}(1), 'Color', string(colours(modalityNumber)));        
% %         xlim([0 max(quant_t(2, modalityNumber, target))]);
%         xlabel('Time (s)');
%         ylabel('Position (m)');
%         title("SH x trajectory. Target: " + targetNames(target));
%         % y
%         subplot(3, targetNum, 4 + target);
%         hold on
%         plot(t_sampledDataDummy(1:currentDataLength), yData_mean_SH{modalityNumber,target} - yData_mean_SH{modalityNumber,target}(1), 'Color', string(colours(modalityNumber)));    
% %         xlim([0 max(quant_t(2, modalityNumber, target))]);
%         xlabel('Time (s)');
%         ylabel('Position (m)');
%         title("SH y trajectory. Target: " + targetNames(target));
%         % z
%         subplot(3, targetNum, 8 + target);
%         hold on
%         plot(t_sampledDataDummy(1:currentDataLength), zData_mean_SH{modalityNumber,target} - zData_mean_SH{modalityNumber,target}(1), 'Color', string(colours(modalityNumber)));  
% %         xlim([0 max(quant_t(2, modalityNumber, target))]);
%         xlabel('Time (s)');
%         ylabel('Position (m)');
%         title("SH z trajectory. Target: " + targetNames(target));
%         
%         %%%%%%%%%%%
%         % Upper body
%         figure(53)
%         % x
%         subplot(3, targetNum, target);
%         hold on
%         plot(t_sampledDataDummy(1:currentDataLength), xData_mean_UB{modalityNumber,target} - xData_mean_UB{modalityNumber,target}(1), 'Color', string(colours(modalityNumber)));        
% %         xlim([0 max(quant_t(2, modalityNumber, target))]);
%         xlabel('Time (s)');
%         ylabel('Position (m)');
%         title("UB x trajectory. Target: " + targetNames(target));
%         % y
%         subplot(3, targetNum, 4 + target);
%         hold on
%         plot(t_sampledDataDummy(1:currentDataLength), yData_mean_UB{modalityNumber,target} - yData_mean_UB{modalityNumber,target}(1), 'Color', string(colours(modalityNumber)));    
% %         xlim([0 max(quant_t(2, modalityNumber, target))]);
%         xlabel('Time (s)');
%         ylabel('Position (m)');
%         title("UB y trajectory. Target: " + targetNames(target));
%         % z
%         subplot(3, targetNum, 8 + target);
%         hold on
%         plot(t_sampledDataDummy(1:currentDataLength), zData_mean_UB{modalityNumber,target} - zData_mean_UB{modalityNumber,target}(1), 'Color', string(colours(modalityNumber)));  
% %         xlim([0 max(quant_t(2, modalityNumber, target))]);
%         xlabel('Time (s)');
%         ylabel('Position (m)');
%         title("UB z trajectory. Target: " + targetNames(target));
%         
%         %%%%%%%%%%%
%         % Hand
%         figure(54)
%         % x
%         subplot(3, targetNum, target);
%         hold on
%         plot(t_sampledDataDummy(1:currentDataLength), xData_mean_Hand{modalityNumber,target} - xData_mean_Hand{modalityNumber,target}(1), 'Color', string(colours(modalityNumber)));        
% %         xlim([0 max(quant_t(2, modalityNumber, target))]);
%         xlabel('Time (s)');
%         ylabel('Position (m)');
%         title("Hand x trajectory. Target: " + targetNames(target));
%         % y
%         subplot(3, targetNum, 4 + target);
%         hold on
%         plot(t_sampledDataDummy(1:currentDataLength), yData_mean_Hand{modalityNumber,target} - yData_mean_Hand{modalityNumber,target}(1), 'Color', string(colours(modalityNumber)));    
% %         xlim([0 max(quant_t(2, modalityNumber, target))]);
%         xlabel('Time (s)');
%         ylabel('Position (m)');
%         title("Hand y trajectory. Target: " + targetNames(target));
%         % z
%         subplot(3, targetNum, 8 + target);
%         hold on
%         plot(t_sampledDataDummy(1:currentDataLength), zData_mean_Hand{modalityNumber,target} - zData_mean_Hand{modalityNumber,target}(1), 'Color', string(colours(modalityNumber)));  
% %         xlim([0 max(quant_t(2, modalityNumber, target))]);
%         xlabel('Time (s)');
%         ylabel('Position (m)');
%         title("Hand z trajectory. Target: " + targetNames(target));
%         
%         
%         %%%%%%%%%%%
%         % Upper arm Angular
%         figure(55)
%         % x
%         subplot(3, targetNum, target);
%         hold on
%         plot(t_sampledDataDummy(1:currentDataLength), aData_mean_UA{modalityNumber,target} - aData_mean_UA{modalityNumber,target}(1), 'Color', string(colours(modalityNumber)));        
% %         xlim([0 max(quant_t(2, modalityNumber, target))]);
%         xlabel('Time (s)');
%         ylabel('Angular Position (rad)');
%         title("UA a trajectory. Target: " + targetNames(target));
%         % y
%         subplot(3, targetNum, 4 + target);
%         hold on
%         plot(t_sampledDataDummy(1:currentDataLength), bData_mean_UA{modalityNumber,target} - bData_mean_UA{modalityNumber,target}(1), 'Color', string(colours(modalityNumber)));    
% %         xlim([0 max(quant_t(2, modalityNumber, target))]);
%         xlabel('Time (s)');
%         ylabel('Angular Position (rad)');
%         title("UA b trajectory. Target: " + targetNames(target));
%         % z
%         subplot(3, targetNum, 8 + target);
%         hold on
%         plot(t_sampledDataDummy(1:currentDataLength), gData_mean_UA{modalityNumber,target} - gData_mean_UA{modalityNumber,target}(1), 'Color', string(colours(modalityNumber)));  
% %         xlim([0 max(quant_t(2, modalityNumber, target))]);
%         xlabel('Time (s)');
%         ylabel('Angular Position (rad)');
%         title("UA g trajectory. Target: " + targetNames(target)); 
%         
%         %%%%%%%%
%         % Sagittal plane
%         %
%         % Hand
%         figure(56)
%         subplot(1, targetNum, target);
%         hold on
%         plot(-xData_mean_Hand{modalityNumber,target} + xData_mean_Hand{modalityNumber,target}(1), yData_mean_Hand{modalityNumber,target} - yData_mean_Hand{modalityNumber,target}(1), 'Color', string(colours(modalityNumber)));        
% %         xlim([0 max(quant_t(2, modalityNumber, target))]);
%         xlabel('Time (s)');
%         ylabel('Position (m)');
%         title("Hand trajectory on sagittal plane. Target: " + targetNames(target));
%         %
%         % UB
%         figure(57)
%         subplot(1, targetNum, target);
%         hold on
%         plot(-xData_mean_UB{modalityNumber,target} + xData_mean_UB{modalityNumber,target}(1), yData_mean_UB{modalityNumber,target} - yData_mean_UB{modalityNumber,target}(1), 'Color', string(colours(modalityNumber)));        
% %         xlim([0 max(quant_t(2, modalityNumber, target))]);
%         xlabel('Time (s)');
%         ylabel('Position (m)');
%         title("UB trajectory on sagittal plane. Target: " + targetNames(target));
%         %
%         % SH
%         figure(58)
%         subplot(1, targetNum, target);
%         hold on
%         plot(-xData_mean_SH{modalityNumber,target} + xData_mean_SH{modalityNumber,target}(1), yData_mean_SH{modalityNumber,target} - yData_mean_SH{modalityNumber,target}(1), 'Color', string(colours(modalityNumber)));        
% %         xlim([0 max(quant_t(2, modalityNumber, target))]);
%         xlabel('Time (s)');
%         ylabel('Position (m)');
%         title("SH trajectory on sagittal plane. Target: " + targetNames(target));
%     end
% end