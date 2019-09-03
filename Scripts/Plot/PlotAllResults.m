%
%
%
%
clear all
modalities = {'Able', 'EMG', 'Jac', 'Lin'};
targetNum = 4;
%
sessionNumber = 3;
%
% Get all available subject info
subjectsAvailable = dir(strcat('...\Processed\Data_s', num2str(sessionNumber) , '\*.mat'));

%%
%
% Subject's hand path on sagittal plane
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    % Get all available subject info
    subjectsAvailable = dir(strcat('...\Processed\Data_s', num2str(sessionNumber) , '\*.mat'));
    colours = {'k', 'b', 'r', 'g'};
    % Plot the subject's hand path on the sagittal plane
    for modalityNumber = 1:length(modalities)
        for currentTarget = 3:3
            for currentTargetIteration = 9:9
%                 figure((10*(currentTarget-1)) + modalityNumber)
                figure(6)
                hold on
                subplot(3,5,subjectNumber)
                hold on
                plot(xData_Hand_normalized{currentTarget, currentTargetIteration, modalityNumber}, yData_Hand_normalized{currentTarget, currentTargetIteration, modalityNumber},...
                'Color', colours{modalityNumber}, 'LineWidth', 1)
                title("Target: " + currentTarget + ", Modality: " + modalityNumber)
                xlim([-0.1 0.8]);
                ylim([-0.1 0.8]);
                grid on
            end
        end
    end
end

%%
%
% Subject's UB path on sagittal plane
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    % Get all available subject info
    subjectsAvailable = dir(strcat('...\Processed\Data_s', num2str(sessionNumber) , '\*.mat'));
    colours = {'k', 'b', 'r', 'g'};
    % Plot the subject's hand path on the sagittal plane
    for modalityNumber = 1:length(modalities)
        for currentTarget = 3:3
            for currentTargetIteration = 1:10
                figure((10*(currentTarget-1)) + modalityNumber)
                hold on
                subplot(3,5,subjectNumber)
                plot(xData_UB_normalized{currentTarget, currentTargetIteration, modalityNumber}, yData_UB_normalized{currentTarget, currentTargetIteration, modalityNumber},...
                'Color', colours{modalityNumber}, 'LineWidth', 1)
                title("Target: " + currentTarget + ", Modality: " + modalityNumber)         
                xlim([-0.3 0.5]);
                ylim([-0.4 0.4]);
                grid on
            end
        end
    end
end

%%
%
% Subject's SH path on sagittal plane
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {'k', 'b', 'r', 'g'};
    % Plot the subject's hand path on the sagittal plane
    for modalityNumber = 1:length(modalities)
        for currentTarget = 1:targetNum
            for currentTargetIteration = 1:10
                figure((10*(currentTarget-1)) + modalityNumber)
                hold on
                subplot(3,5,subjectNumber)
                plot(xData_SH_normalized{currentTarget, currentTargetIteration, modalityNumber}-xData_UB_normalized{currentTarget, currentTargetIteration, modalityNumber}, yData_SH_normalized{currentTarget, currentTargetIteration, modalityNumber}-yData_UB_normalized{currentTarget, currentTargetIteration, modalityNumber},...
                'Color', colours{modalityNumber}, 'LineWidth', 1)
                title("Target: " + currentTarget + ", Modality: " + modalityNumber)         
                xlim([-0.3 0.5]);
                ylim([-0.4 0.4]);
                grid on
            end
        end
    end
end
%%
%
% Subject's UA path on sagittal plane
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {'k', 'b', 'r', 'g'};
    % Plot the subject's hand path on the sagittal plane
    for modalityNumber = 1:length(modalities)
        for currentTarget = 1:targetNum
            for currentTargetIteration = 1:10
                figure((10*(currentTarget-1)) + modalityNumber)
                hold on
                subplot(3,5,subjectNumber)
                plot(xData_UA_normalized{currentTarget, currentTargetIteration, modalityNumber}-xData_SH_normalized{currentTarget, currentTargetIteration, modalityNumber}, yData_UA_normalized{currentTarget, currentTargetIteration, modalityNumber}-yData_SH_normalized{currentTarget, currentTargetIteration, modalityNumber},...
                'Color', colours{modalityNumber}, 'LineWidth', 1)
                title("Target: " + currentTarget + ", Modality: " + modalityNumber)         
                xlim([-0.3 0.5]);
                ylim([-0.4 0.4]);
                grid on
            end
        end
    end
end

%%
% Mean paths!
%
%%
%
% Mean hand path on the sagittal plane
%
% Get all available subject info
subjectsAvailable = dir(strcat('...\Processed\Data_s', num2str(sessionNumber) , '\*.mat'));
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    % Get all available subject info
    subjectsAvailable = dir(strcat('...\Processed\Data_s', num2str(sessionNumber) , '\*.mat'));
    colours = {'k', 'b', 'r', 'g'};
    xLimits = {[-0.1 0.2], [-0.1 0.4], [-0.1 0.8], [-0.1 0.4]};
    yLimits = {[-0.1 0.2], [-0.1 0.3], [-0.1 0.4], [-0.1 0.8]};
    % Plot the subject's mean hand path on the sagittal plane
    for modalityNumber = 1:length(modalities)
        for currentTarget = 1:targetNum
            figure(currentTarget)
            hold on
            subplot(3,5,subjectNumber)
            plot(-xData_mean_Hand{modalityNumber,currentTarget} + xData_mean_Hand{modalityNumber,currentTarget}(1), yData_mean_Hand{modalityNumber,currentTarget} - yData_mean_Hand{modalityNumber,currentTarget}(1),...
                'Color', colours{modalityNumber}, 'LineWidth', 2)
%             xlim(xLimits{currentTarget});
%             ylim(yLimits{currentTarget});
            xlim([-0.1 0.8]);
            ylim([-0.1 0.8]);
            grid on;
            %             title("Target: " + currentTarget + ", Modality: " + modalityNumber)
        end
    end
end
%%
%
% Mean UB path on the sagittal plane
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {'k', 'b', 'r', 'g'};
    xLimits = {[-0.1 0.2], [-0.1 0.2], [-0.1 0.4], [-0.2 0.06]};
    yLimits = {[-0.1 0.2], [-0.03 0.04], [-0.2 0.02], [-0.1 0.03]};
    % Plot the subject's mean hand path on the sagittal plane
    for modalityNumber = 1:length(modalities)
        for currentTarget = 3:3
%             figure(currentTarget)
            figure(1)
            hold on
            subplot(3,5,subjectNumber)
%             plot(xData_mean_UB_N{modalityNumber,currentTarget}, yData_mean_UB_N{modalityNumber,currentTarget},...
%                 'Color', colours{modalityNumber}, 'LineWidth', 2)   
            plot(xData_mean_UB_N{modalityNumber,currentTarget},...
                'Color', colours{modalityNumber}, 'LineWidth', 2)          
%             xlim([-0.2 0.4]);
%             ylim([-0.2 0.4]);
            grid on;
        end
    end
end

%%
%
% Mean SH path on the sagittal plane
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {'k', 'b', 'r', 'g'};
    xLimits = {[-0.1 0.2], [-0.1 0.2], [-0.1 0.4], [-0.2 0.06]};
    yLimits = {[-0.1 0.2], [-0.03 0.04], [-0.2 0.02], [-0.1 0.03]};
    % Plot the subject's mean hand path on the sagittal plane
    for modalityNumber = 1:length(modalities)
        for currentTarget = 3:3
            figure(2)
            hold on
            subplot(3,5,subjectNumber)
%             plot(xData_mean_SH_N{modalityNumber,currentTarget} - xData_mean_UB_N{modalityNumber,currentTarget}, yData_mean_SH_N{modalityNumber,currentTarget} - yData_mean_UB_N{modalityNumber,currentTarget},...
%                 'Color', colours{modalityNumber}, 'LineWidth', 2) 
            plot(xData_mean_SH_N{modalityNumber,currentTarget} - xData_mean_UB_N{modalityNumber,currentTarget},...
                'Color', colours{modalityNumber}, 'LineWidth', 2)            
%             xlim([-0.2 0.4]);
%             ylim([-0.2 0.4]);
            grid on;
            clear xUB_temp yUB_temp xSH_temp ySH_temp
        end
    end
end

%%
%
% Mean UA path on the sagittal plane
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {'k', 'b', 'r', 'g'};
    xLimits = {[-0.1 0.2], [-0.1 0.2], [-0.1 0.4], [-0.2 0.06]};
    yLimits = {[-0.1 0.2], [-0.03 0.04], [-0.2 0.02], [-0.1 0.03]};
    % Plot the subject's mean hand path on the sagittal plane
    for modalityNumber = 1:length(modalities)
        for currentTarget = 3:3
            figure(3)
            hold on
            subplot(3,5,subjectNumber)
%             plot(xData_mean_UA_N{modalityNumber,currentTarget} - xData_mean_SH_N{modalityNumber,currentTarget}(1), yData_mean_UA_N{modalityNumber,currentTarget} - yData_mean_SH_N{modalityNumber,currentTarget},...
%                 'Color', colours{modalityNumber}, 'LineWidth', 2)  
            plot(xData_mean_UA_N{modalityNumber,currentTarget} - xData_mean_SH_N{modalityNumber,currentTarget}(1),...
                'Color', colours{modalityNumber}, 'LineWidth', 2)            
%             xlim([-0.1 0.8]);
%             ylim([-0.1 0.8]);
            grid on;
        end
    end
end

%%
%
% Mean shoulder flexion over time (gUA)
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {'k', 'b', 'r', 'g'};
    xLimits = {[-0.1 0.2], [-0.1 0.2], [-0.1 0.4], [-0.2 0.06]};
    yLimits = {[-0.1 0.2], [-0.03 0.04], [-0.2 0.02], [-0.1 0.03]};
    % Plot the subject's mean hand path on the sagittal plane
    for modalityNumber = 1:length(modalities)
        for currentTarget = 3:3
            figure(currentTarget)
            hold on
            subplot(3,5,subjectNumber)
            plot(-gData_mean_UA{modalityNumber,currentTarget} + gData_mean_UA{modalityNumber,currentTarget}(1),...
                'Color', colours{modalityNumber}, 'LineWidth', 2)            
%             xlim([-0.1 0.8]);
%             ylim([-0.1 0.8]);
            grid on;
        end
    end
end
%%
% Differences!
%
% Get all available subject info
subjectsAvailable = dir(strcat('...\Processed\Data_s', num2str(sessionNumber) , '\*.mat'));
%
% Hand sagittal plane path differences
%
for subjectNumber = 1:length(subjectsAvailable)
    % Get all available subject info
    subjectsAvailable = dir(strcat('...\Processed\Data_s', num2str(sessionNumber) , '\*.mat'));
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    
    % Get all available subject info
    subjectsAvailable = dir(strcat('...\Processed\Data_s', num2str(sessionNumber) , '\*.mat'));
    colours = {'k', 'b', 'r', 'g'};    
    for modalityNumber = 2:4
            figure(1)
            hold on
            subplot(3,5,subjectNumber)
            x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
            y = [xHand_diff_avg_N{modalityNumber,1}+yHand_diff_avg_N{modalityNumber,1}, xHand_diff_avg_N{modalityNumber,2}+yHand_diff_avg_N{modalityNumber,2},xHand_diff_avg_N{modalityNumber,3}+yHand_diff_avg_N{modalityNumber,3},xHand_diff_avg_N{modalityNumber,4}+yHand_diff_avg_N{modalityNumber,4} ];
            p1{modalityNumber} = bar(x, y, 0.2, 'FaceColor', colours{modalityNumber});
            % Figure config
            xlabel("Target");
            ylabel("Path difference metric thing");
%             title("Median & Quartiles: Shoulder Displacement");
            xlim([0 5]);
            xticks([0 1 2 3 4 5]);
            xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
    end
end
%%
%
% UB sagittal plane path differences
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {'k', 'b', 'r', 'g'};    
    for modalityNumber = 2:4
            figure(2)
            hold on
            subplot(3,5,subjectNumber)
            x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
            y = [xUB_diff_avg_N{modalityNumber,1}+yUB_diff_avg_N{modalityNumber,1}, xUB_diff_avg_N{modalityNumber,2}+yUB_diff_avg_N{modalityNumber,2},xUB_diff_avg_N{modalityNumber,3}+yUB_diff_avg_N{modalityNumber,3},xUB_diff_avg_N{modalityNumber,4}+yUB_diff_avg_N{modalityNumber,4} ];
            p1{modalityNumber} = bar(x, y, 0.2, 'FaceColor', colours{modalityNumber});
            % Figure config
            xlabel("Target");
            ylabel("Path difference metric thing");
%             title("Median & Quartiles: Shoulder Displacement");
            xlim([0 5]);
            xticks([0 1 2 3 4 5]);
            xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
    end
end
%%
%
% SH sagittal plane path differences
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {'k', 'b', 'r', 'g'};    
    for modalityNumber = 2:4
            figure(3)
            hold on
            subplot(3,5,subjectNumber)
            x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
            y = [xSH_diff_avg_N{modalityNumber,1}+ySH_diff_avg_N{modalityNumber,1}, xSH_diff_avg_N{modalityNumber,2}+ySH_diff_avg_N{modalityNumber,2},xSH_diff_avg_N{modalityNumber,3}+ySH_diff_avg_N{modalityNumber,3},xSH_diff_avg_N{modalityNumber,4}+ySH_diff_avg_N{modalityNumber,4} ];
            p1{modalityNumber} = bar(x, y, 0.2, 'FaceColor', colours{modalityNumber});
            % Figure config
            xlabel("Target");
            ylabel("Path difference metric thing");
%             title("Median & Quartiles: Shoulder Displacement");
            xlim([0 5]);
            xticks([0 1 2 3 4 5]);
            xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
    end
end
%%
%
% UA sagittal plane path differences
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {'k', 'b', 'r', 'g'};    
    for modalityNumber = 2:4
            figure(4)
            hold on
            subplot(3,5,subjectNumber)
            x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
            y = [xUA_diff_avg_N{modalityNumber,1}+yUA_diff_avg_N{modalityNumber,1}, xUA_diff_avg_N{modalityNumber,2}+yUA_diff_avg_N{modalityNumber,2},xUA_diff_avg_N{modalityNumber,3}+yUA_diff_avg_N{modalityNumber,3},xUA_diff_avg_N{modalityNumber,4}+yUA_diff_avg_N{modalityNumber,4} ];
            p1{modalityNumber} = bar(x, y, 0.2, 'FaceColor', colours{modalityNumber});
            % Figure config
            xlabel("Target");
            ylabel("Path difference metric thing");
%             title("Median & Quartiles: Shoulder Displacement");
            xlim([0 5]);
            xticks([0 1 2 3 4 5]);
            xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
    end
end
%%
%
% Population mean differences
%
% Hand path
% Calculate the population differences
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name) 
    for modalityNumber = 2:4
        handPath_diff_Cat(modalityNumber-1,subjectNumber,:) = [xHand_diff_avg_N{modalityNumber,1}+yHand_diff_avg_N{modalityNumber,1}, xHand_diff_avg_N{modalityNumber,2}+yHand_diff_avg_N{modalityNumber,2},xHand_diff_avg_N{modalityNumber,3}+yHand_diff_avg_N{modalityNumber,3},xHand_diff_avg_N{modalityNumber,4}+yHand_diff_avg_N{modalityNumber,4} ];
    end
end
for modalityNumber = 1:3
    mean_handPath_diff(modalityNumber,:) = mean(handPath_diff_Cat(modalityNumber,:,:));
    median_handPath_diff(modalityNumber,:) = median(handPath_diff_Cat(modalityNumber,:,:));    
    std_handPath_diff(modalityNumber,:) = std(handPath_diff_Cat(modalityNumber,:,:));
    figure(1)
    hold on
    x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
    p1{modalityNumber} = bar(x, mean_handPath_diff(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber+1});    
    for target = 1:targetNum
        plot([x(target) x(target)], [mean_handPath_diff(modalityNumber,target)+std_handPath_diff(modalityNumber, target), mean_handPath_diff(modalityNumber,target)-std_handPath_diff(modalityNumber, target)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    xlabel("Target");
    ylabel("Mean path difference metric thing");
%             title("Median & Quartiles: Shoulder Displacement");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
end
%%
% UB
% Calculate the population differences
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name) 
    for modalityNumber = 2:4
        ubPath_diff_Cat(modalityNumber-1,subjectNumber,:) = [xUB_diff_avg_N{modalityNumber,1}+yUB_diff_avg_N{modalityNumber,1}, xUB_diff_avg_N{modalityNumber,2}+yUB_diff_avg_N{modalityNumber,2},xUB_diff_avg_N{modalityNumber,3}+yUB_diff_avg_N{modalityNumber,3},xUB_diff_avg_N{modalityNumber,4}+yUB_diff_avg_N{modalityNumber,4} ];
    end
end
for modalityNumber = 1:3
    mean_ubPath_diff(modalityNumber,:) = mean(ubPath_diff_Cat(modalityNumber,:,:));
    median_ubPath_diff(modalityNumber,:) = median(ubPath_diff_Cat(modalityNumber,:,:));    
    std_ubPath_diff(modalityNumber,:) = std(ubPath_diff_Cat(modalityNumber,:,:));
    figure(1)
    hold on
    x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
    p1{modalityNumber} = bar(x, mean_ubPath_diff(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber+1});    
    for target = 1:targetNum
        plot([x(target) x(target)], [mean_ubPath_diff(modalityNumber,target)+std_ubPath_diff(modalityNumber, target), mean_ubPath_diff(modalityNumber,target)-std_ubPath_diff(modalityNumber, target)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    xlabel("Target");
    ylabel("Mean path difference metric thing");
%             title("Median & Quartiles: Shoulder Displacement");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
end
%%
% SH
% Calculate the population differences
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name) 
    for modalityNumber = 2:4
        shPath_diff_Cat(modalityNumber-1,subjectNumber,:) = [xSH_diff_avg_N{modalityNumber,1}+ySH_diff_avg_N{modalityNumber,1}, xSH_diff_avg_N{modalityNumber,2}+ySH_diff_avg_N{modalityNumber,2},xSH_diff_avg_N{modalityNumber,3}+ySH_diff_avg_N{modalityNumber,3},xSH_diff_avg_N{modalityNumber,4}+ySH_diff_avg_N{modalityNumber,4} ];
    end
end
for modalityNumber = 1:3
    mean_shPath_diff(modalityNumber,:) = mean(shPath_diff_Cat(modalityNumber,:,:));
    median_shPath_diff(modalityNumber,:) = median(shPath_diff_Cat(modalityNumber,:,:));    
    std_shPath_diff(modalityNumber,:) = std(shPath_diff_Cat(modalityNumber,:,:));
    figure(1)
    hold on
    x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
    p1{modalityNumber} = bar(x, mean_shPath_diff(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber+1});    
    for target = 1:targetNum
        plot([x(target) x(target)], [mean_shPath_diff(modalityNumber,target)+std_shPath_diff(modalityNumber, target), mean_shPath_diff(modalityNumber,target)-std_shPath_diff(modalityNumber, target)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    xlabel("Target");
    ylabel("Mean path difference metric thing");
%             title("Median & Quartiles: Shoulder Displacement");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
end
%%
% UA
% Calculate the population differences
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name) 
    for modalityNumber = 2:4
        uaPath_diff_Cat(modalityNumber-1,subjectNumber,:) = [xUA_diff_avg_N{modalityNumber,1}+yUA_diff_avg_N{modalityNumber,1}, xUA_diff_avg_N{modalityNumber,2}+yUA_diff_avg_N{modalityNumber,2},xUA_diff_avg_N{modalityNumber,3}+yUA_diff_avg_N{modalityNumber,3},xUA_diff_avg_N{modalityNumber,4}+yUA_diff_avg_N{modalityNumber,4} ];
    end
end
for modalityNumber = 1:3
    mean_uaPath_diff(modalityNumber,:) = mean(uaPath_diff_Cat(modalityNumber,:,:));
    median_uaPath_diff(modalityNumber,:) = median(uaPath_diff_Cat(modalityNumber,:,:));    
    std_uaPath_diff(modalityNumber,:) = std(uaPath_diff_Cat(modalityNumber,:,:));
    figure(1)
    hold on
    x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
    p1{modalityNumber} = bar(x, mean_uaPath_diff(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber+1});    
%     for target = 1:targetNum
%         plot([x(target) x(target)], [mean_uaPath_diff(modalityNumber,target)+std_uaPath_diff(modalityNumber, target), mean_uaPath_diff(modalityNumber,target)-std_uaPath_diff(modalityNumber, target)]...
%               ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
%     end
    % Figure config
    xlabel("Target");
    ylabel("Mean path difference metric thing");
%             title("Median & Quartiles: Shoulder Displacement");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
end