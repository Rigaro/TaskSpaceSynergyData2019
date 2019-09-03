clear gSData_mean_new qEData_mean_new
clear gSData_std_new qEData_std_new
%
colours = {'k', 'b', 'r', 'g'};
iterationsPerTarget = 10;
modalitiesModified = {'Able', 'EMG', 'Task', 'Joint'};
targetNames = {'Close', 'Mid', 'Far', 'High'};
t_sampledDataDummy = 0:0.011111110000000:20;
%
% Initialize the iterations of each target
maxSamples = zeros(length(modalities),targetNum);

% Get the length of each dataset
for modalityNumber = 1:length(modalities)   
    % Get longest dataset
    for target = 1:targetNum
        for iteration = 1:iterationsPerTarget
           if(length(gData_UA{target, iteration, modalityNumber}) > maxSamples(modalityNumber, target))
               maxSamples(modalityNumber, target) = length(gData_UA{target, iteration, modalityNumber});
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
        clear gSDataTemp qEDataTemp
        for i = 1:iterationsPerTarget 
            for j = 1:maxSamples(modalityNumber, target)
                if (j > length(xData_Hand_new{target, i, modalityNumber}))
                    % Hand trajectory
                    gSDataTemp(j,i) = gData_UA{target, i, modalityNumber}(end);
                    qEDataTemp(j,i) = qData_E{target, i, modalityNumber}(end);
                else
                    % Hand trajectory
                    gSDataTemp(j,i) = gData_UA{target, i, modalityNumber}(j);
                    qEDataTemp(j,i) = qData_E{target, i, modalityNumber}(j);
                end
            end
        end
        
        % calculate mean
        % Hand trajectory
        gSData_mean_new{modalityNumber,target} = mean(gSDataTemp, 2);
        qEData_mean_new{modalityNumber,target} = mean(qEDataTemp, 2);
        
        % calculate std
        % Hand trajectory
        gSData_std_new{modalityNumber,target} = std(gSDataTemp, 0, 2);
        qEData_std_new{modalityNumber,target} = std(qEDataTemp, 0, 2);
    end
end
clear gSDataTemp qEDataTemp
  
% %% Plot to verify
% % Plot the subject's hand path on the sagittal plane
% for modalityNumber = 1:length(modalities)
%     for currentTarget = 1:targetNum
%             figure((10*(currentTarget-1)) + modalityNumber)
%             hold on
%             plot(gSData_mean_new{modalityNumber, currentTarget}, qEData_mean_new{modalityNumber, currentTarget},...
%             'Color', colours{modalityNumber}, 'LineWidth', 3)
%             plot(gSData_mean_new{modalityNumber, currentTarget}+gSData_std_new{modalityNumber, currentTarget}, qEData_mean_new{modalityNumber, currentTarget}-qEData_std_new{modalityNumber, currentTarget},...
%             'Color', coloursFunnel{modalityNumber}, 'LineWidth', 3)
%             plot(gSData_mean_new{modalityNumber, currentTarget}-gSData_std_new{modalityNumber, currentTarget}, qEData_mean_new{modalityNumber, currentTarget}+qEData_std_new{modalityNumber, currentTarget},...
%             'Color', coloursFunnel{modalityNumber}, 'LineWidth', 3)
%             title("Target: " + currentTarget + ", Modality: " + modalityNumber)
%             xlim([-2 1]);
%             ylim([-3 0]);
%             grid on
%     end
% end