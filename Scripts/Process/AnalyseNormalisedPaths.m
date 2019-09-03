clear xData_mean_Hand_new yData_mean_Hand_new zData_mean_Hand_new
clear xData_std_Hand_new yData_std_Hand_new zData_std_Hand_new
clear xDataTemp_TarCom yDataTemp_TarCom zDataTemp_TarCom
%
colours = {'k', 'b', 'r', 'g'};
coloursFunnel = {[0.8 0.8 0.8], [0.7294 0.8314 0.9569], [1.0 0.6 0.6], [0.7569 0.8667 0.7765]};
iterationsPerTarget = 10;
modalitiesModified = {'Able', 'EMG', 'Task', 'Joint'};
targetNames = {'Close', 'Mid', 'Far', 'High'};
t_sampledDataDummy = 0:0.011111110000000:20;
%
% Initialize the iterations of each target
targetIteration = ones(targetNum); 
maxSamples = zeros(length(modalities),targetNum);
maxSamplesComb = zeros(length(modalities));

% Get the length of each dataset
for modalityNumber = 1:length(modalities)   
    % Get longest dataset
    for target = 1:targetNum
        for iteration = 1:iterationsPerTarget
           if(length(xData_Hand_new{target, iteration, modalityNumber}) > maxSamples(modalityNumber, target))
               maxSamples(modalityNumber, target) = length(xData_Hand_new{target, iteration, modalityNumber});
           end
           if(length(xData_Hand_new{target, iteration, modalityNumber}) > maxSamplesComb(modalityNumber))
               maxSamplesComb(modalityNumber) = length(xData_Hand_new{target, iteration, modalityNumber});
           end
        end
    end
end

% Extract statistical motor behaviour
% for each modality
for modalityNumber = 1:length(modalities)
    clear xDataTemp_TarCom yDataTemp_TarCom zDataTemp_TarCom
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
                if (j > length(xData_Hand_new{target, i, modalityNumber}))
                    % Upper arm trajectory
%                     xDataTemp_UA(j,i) = xData_UA_new{target, i, modalityNumber}(end);
%                     yDataTemp_UA(j,i) = yData_UA_new{target, i, modalityNumber}(end);
%                     zDataTemp_UA(j,i) = zData_UA_new{target, i, modalityNumber}(end);
%                     % Shoulder trajectory
%                     xDataTemp_SH(j,i) = xData_SH_new{target, i, modalityNumber}(end);
%                     yDataTemp_SH(j,i) = yData_SH_new{target, i, modalityNumber}(end);
%                     zDataTemp_SH(j,i) = zData_SH_new{target, i, modalityNumber}(end);
%                     % Upper body trajectory
%                     xDataTemp_UB(j,i) = xData_UB_new{target, i, modalityNumber}(end);
%                     yDataTemp_UB(j,i) = yData_UB_new{target, i, modalityNumber}(end);
%                     zDataTemp_UB(j,i) = zData_UB_new{target, i, modalityNumber}(end);
                    % Hand trajectory
                    xDataTemp_Hand(j,i) = xData_Hand_new{target, i, modalityNumber}(end);
                    yDataTemp_Hand(j,i) = yData_Hand_new{target, i, modalityNumber}(end);
                    zDataTemp_Hand(j,i) = zData_Hand_new{target, i, modalityNumber}(end);
%                     % Target combined
%                     xDataTemp_TarCom(j,(10*(target-1)) + i) = xData_Hand_new{target, i, modalityNumber}(end);
%                     yDataTemp_TarCom(j,(10*(target-1)) + i) = yData_Hand_new{target, i, modalityNumber}(end);
%                     zDataTemp_TarCom(j,(10*(target-1)) + i) = zData_Hand_new{target, i, modalityNumber}(end);
                    
                else
                    % Upper arm trajectory
%                     xDataTemp_UA(j,i) = xData_UA_new{target, i, modalityNumber}(j);
%                     yDataTemp_UA(j,i) = yData_UA_new{target, i, modalityNumber}(j);
%                     zDataTemp_UA(j,i) = zData_UA_new{target, i, modalityNumber}(j);
%                     % Shoulder trajectory
%                     xDataTemp_SH(j,i) = xData_SH_new{target, i, modalityNumber}(j);
%                     yDataTemp_SH(j,i) = yData_SH_new{target, i, modalityNumber}(j);
%                     zDataTemp_SH(j,i) = zData_SH_new{target, i, modalityNumber}(j);
%                     % Upper body trajectory
%                     xDataTemp_UB(j,i) = xData_UB_new{target, i, modalityNumber}(j);
%                     yDataTemp_UB(j,i) = yData_UB_new{target, i, modalityNumber}(j);
%                     zDataTemp_UB(j,i) = zData_UB_new{target, i, modalityNumber}(j);
                    % Hand trajectory
                    xDataTemp_Hand(j,i) = xData_Hand_new{target, i, modalityNumber}(j);
                    yDataTemp_Hand(j,i) = yData_Hand_new{target, i, modalityNumber}(j);
                    zDataTemp_Hand(j,i) = zData_Hand_new{target, i, modalityNumber}(j);
%                     % Target combined
%                     xDataTemp_TarCom(j,(10*(target-1)) + i) = xData_Hand_new{target, i, modalityNumber}(j);
%                     yDataTemp_TarCom(j,(10*(target-1)) + i) = yData_Hand_new{target, i, modalityNumber}(j);
%                     zDataTemp_TarCom(j,(10*(target-1)) + i) = zData_Hand_new{target, i, modalityNumber}(j);                  
                end
            end
            for j = 1:maxSamplesComb(modalityNumber)
                if (j > length(xData_Hand_new{target, i, modalityNumber}))
                    % Target combined
                    xDataTemp_TarCom(j,(10*(target-1)) + i) = xData_Hand_new{target, i, modalityNumber}(end);
                    yDataTemp_TarCom(j,(10*(target-1)) + i) = yData_Hand_new{target, i, modalityNumber}(end);
                    zDataTemp_TarCom(j,(10*(target-1)) + i) = zData_Hand_new{target, i, modalityNumber}(end);
                else
                    % Target combined
                    xDataTemp_TarCom(j,(10*(target-1)) + i) = xData_Hand_new{target, i, modalityNumber}(j);
                    yDataTemp_TarCom(j,(10*(target-1)) + i) = yData_Hand_new{target, i, modalityNumber}(j);
                    zDataTemp_TarCom(j,(10*(target-1)) + i) = zData_Hand_new{target, i, modalityNumber}(j);                  
                end
            end
        end
        
        % calculate mean
%         % Upper arm trajectory
%         xData_mean_UA_new{modalityNumber,target} = mean(xDataTemp_UA, 2);
%         yData_mean_UA_new{modalityNumber,target} = mean(yDataTemp_UA, 2);
%         zData_mean_UA_new{modalityNumber,target} = mean(zDataTemp_UA, 2);
%         % Shoulder trajectory
%         xData_mean_SH_new{modalityNumber,target} = mean(xDataTemp_SH, 2);
%         yData_mean_SH_new{modalityNumber,target} = mean(yDataTemp_SH, 2);
%         zData_mean_SH_new{modalityNumber,target} = mean(zDataTemp_SH, 2);
%         % Upper body trajectory
%         xData_mean_UB_new{modalityNumber,target} = mean(xDataTemp_UB, 2);
%         yData_mean_UB_new{modalityNumber,target} = mean(yDataTemp_UB, 2);
%         zData_mean_UB_new{modalityNumber,target} = mean(zDataTemp_UB, 2);
        % Hand trajectory
        xData_mean_Hand_new{modalityNumber,target} = mean(xDataTemp_Hand, 2);
        yData_mean_Hand_new{modalityNumber,target} = mean(yDataTemp_Hand, 2);
        zData_mean_Hand_new{modalityNumber,target} = mean(zDataTemp_Hand, 2);
        
        % calculate std
        % Upper arm trajectory
%         xData_std_UA_new{modalityNumber,target} = std(xDataTemp_UA);
%         yData_std_UA_new{modalityNumber,target} = std(yDataTemp_UA);
%         zData_std_UA_new{modalityNumber,target} = std(zDataTemp_UA);
%         % Shoulder trajectory
%         xData_std_SH_new{modalityNumber,target} = std(xDataTemp_SH);
%         yData_std_SH_new{modalityNumber,target} = std(yDataTemp_SH);
%         zData_std_SH_new{modalityNumber,target} = std(zDataTemp_SH);
%         % Upper body trajectory
%         xData_std_UB_new{modalityNumber,target} = std(xDataTemp_UB);
%         yData_std_UB_new{modalityNumber,target} = std(yDataTemp_UB);
%         zData_std_UB_new{modalityNumber,target} = std(zDataTemp_UB);
        % Hand trajectory
        xData_std_Hand_new{modalityNumber,target} = std(xDataTemp_Hand, 0, 2);
        yData_std_Hand_new{modalityNumber,target} = std(yDataTemp_Hand, 0, 2);
        zData_std_Hand_new{modalityNumber,target} = std(zDataTemp_Hand, 0, 2);
    end
    % Target combined
    % mean
    xData_mean_Hand_TarCom{modalityNumber} = mean(xDataTemp_TarCom, 2);
    yData_mean_Hand_TarCom{modalityNumber} = mean(yDataTemp_TarCom, 2);
    zData_mean_Hand_TarCom{modalityNumber} = mean(zDataTemp_TarCom, 2);
    % std    
    xData_std_Hand_TarCom{modalityNumber} = std(xDataTemp_TarCom, 0, 2);
    yData_std_Hand_TarCom{modalityNumber} = std(yDataTemp_TarCom, 0, 2);
    zData_std_Hand_TarCom{modalityNumber} = std(zDataTemp_TarCom, 0, 2);
end
% clear xDataTemp_UA yDataTemp_UA zDataTemp_UA xDataTemp_SH ...
%       yDataTemp_SH zDataTemp_SH xDataTemp_UB yDataTemp_UB ...
%       zDataTemp_UB 
clear xDataTemp_Hand yDataTemp_Hand zDataTemp_Hand
clear xDataTemp_TarCom yDataTemp_TarCom zDataTemp_TarCom
  
% %% Plot to verify
% % Plot the subject's hand path on the sagittal plane
% for modalityNumber = 1:length(modalities)
% %     for currentTarget = 1:targetNum
% %             figure((10*(currentTarget-1)) + modalityNumber)
%             figure(modalityNumber)
%             hold on
%             plot(xData_mean_Hand_TarCom{modalityNumber}, yData_mean_Hand_TarCom{modalityNumber},...
%             'Color', colours{modalityNumber}, 'LineWidth', 3)
%             plot(xData_mean_Hand_TarCom{modalityNumber} + xData_std_Hand_TarCom{modalityNumber}, yData_mean_Hand_TarCom{modalityNumber} + yData_mean_Hand_TarCom{modalityNumber},...
%             'Color', coloursFunnel{modalityNumber}, 'LineWidth', 3)
%             plot(xData_mean_Hand_TarCom{modalityNumber} - xData_std_Hand_TarCom{modalityNumber}, yData_mean_Hand_TarCom{modalityNumber} - yData_mean_Hand_TarCom{modalityNumber},...
%             'Color', coloursFunnel{modalityNumber}, 'LineWidth', 3)
% %             plot(xData_mean_Hand_new{modalityNumber, currentTarget}, yData_mean_Hand_new{modalityNumber, currentTarget},...
% %             'Color', colours{modalityNumber}, 'LineWidth', 3)
% %             plot(xData_mean_Hand_new{modalityNumber, currentTarget} + xData_std_Hand_new{modalityNumber, currentTarget}, yData_mean_Hand_new{modalityNumber, currentTarget} + yData_std_Hand_new{modalityNumber, currentTarget},...
% %             'Color', coloursFunnel{modalityNumber}, 'LineWidth', 3)
% %             plot(xData_mean_Hand_new{modalityNumber, currentTarget} - xData_std_Hand_new{modalityNumber, currentTarget}, yData_mean_Hand_new{modalityNumber, currentTarget} - yData_std_Hand_new{modalityNumber, currentTarget},...
% %             'Color', coloursFunnel{modalityNumber}, 'LineWidth', 3)
% %             plot(xData_mean_Hand_new{modalityNumber, currentTarget}, yData_mean_Hand_new{modalityNumber, currentTarget} + yData_std_Hand_new{modalityNumber, currentTarget},...
% %             'Color', coloursFunnel{modalityNumber}, 'LineWidth', 3)
% %             plot(xData_mean_Hand_new{modalityNumber, currentTarget}, yData_mean_Hand_new{modalityNumber, currentTarget} - yData_std_Hand_new{modalityNumber, currentTarget},...
% %             'Color', coloursFunnel{modalityNumber}, 'LineWidth', 3)
% %             title("Target: " + currentTarget + ", Modality: " + modalityNumber)
%             title("Modality: " + modalityNumber)
%             xlim([-0.2 1.2]);
%             ylim([-0.2 1.2]);
%             grid on
% %     end
% end