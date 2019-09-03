%%
% Smoothness!
%
%
clear all
%
sessionNumber = 3;
%
% Get all available subject info
subjectsAvailable = dir(strcat('...\Processed\Data_s', num2str(sessionNumber) , '\*.mat'));
%
%%
%
% Individual hand smoothness
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {'k', 'b', 'r', 'g'};    
    for modalityNumber = 1:4
            figure(1)
            hold on
            subplot(3,5,subjectNumber)
            x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1)); 
            p1{modalityNumber} = bar(x, S_Hand_new(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
            % Figure config
            xlabel("Target");
            ylabel("Path difference metric thing");
%             title("Median & Quartiles: Shoulder Displacement");
            xlim([0 5]);
            xticks([0 1 2 3 4 5]);
            xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
    end
end
legend([p1{1} p1{2} p1{3} p1{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
%
%% Population smoothness
%
% Population mean smoothness
%
% Hand path
% Calculate the population smoothness
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name) 
    for modalityNumber = 1:4
        hand_S_Cat(modalityNumber,subjectNumber,:) = [S_Hand_new(modalityNumber,1), S_Hand_new(modalityNumber,2),S_Hand_new(modalityNumber,3),S_Hand_new(modalityNumber,4)];
    end
end

%
% Plot mean smoothness
%
for modalityNumber = 1:4
    mean_hand_S(modalityNumber,:) = mean(hand_S_Cat(modalityNumber,:,:)); 
    std_hand_S(modalityNumber,:) = std(hand_S_Cat(modalityNumber,:,:));
    figure(5)
    subplot(1,2,2);
    hold on
    colours = {[0.8 0.8 0.8], 'b', 'r', 'g'};
    x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1)); 
    p1{modalityNumber} = bar(x, mean_hand_S(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});       
    for target = 1:targetNum
        plot([x(target) x(target)], [mean_hand_S(modalityNumber,target) + std_hand_S(modalityNumber, target), mean_hand_S(modalityNumber,target) - std_hand_S(modalityNumber, target)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    xlabel("Target");
    ylabel("Spectral arc length");
%             title("Median & Quartiles: Shoulder Displacement");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
end
legend([p1{1} p1{2} p1{3} p1{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
set(gca,'FontSize',30)
grid on
%
%%
%
% Individual QSE smoothness
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {'k', 'b', 'r', 'g'};    
    for modalityNumber = 1:4
            figure(3)
            hold on
            subplot(3,5,subjectNumber)
            x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1)); 
            p1{modalityNumber} = bar(x, S_qSE_new(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
            % Figure config
            xlabel("Target");
            ylabel("Path difference metric thing");
%             title("Median & Quartiles: Shoulder Displacement");
            xlim([0 5]);
            xticks([0 1 2 3 4 5]);
            xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
    end
end
legend([p1{1} p1{2} p1{3} p1{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
%
%% Population smoothness
%
% Population mean qSE smoothness
%
% Hand path
% Calculate the population smoothness
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name) 
    for modalityNumber = 1:4
        qSE_S_Cat(modalityNumber,subjectNumber,:) = [S_qSE_new(modalityNumber,1), S_qSE_new(modalityNumber,2),S_qSE_new(modalityNumber,3),S_qSE_new(modalityNumber,4)];
    end
end

%
% Plot mean smoothness
%
for modalityNumber = 1:4
    mean_qSE_S(modalityNumber,:) = mean(qSE_S_Cat(modalityNumber,:,:)); 
    std_qSE_S(modalityNumber,:) = std(qSE_S_Cat(modalityNumber,:,:)); 
    figure(4)
    hold on
    colours = {[0.8 0.8 0.8], 'b', 'r', 'g'};
    x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1)); 
    p1{modalityNumber} = bar(x, mean_qSE_S(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});         
    for target = 1:targetNum
        plot([x(target) x(target)], [mean_qSE_S(modalityNumber,target) + std_qSE_S(modalityNumber, target), mean_qSE_S(modalityNumber,target) - std_qSE_S(modalityNumber, target)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    xlabel("Target");
    ylabel("Spectral arc length");
%             title("Median & Quartiles: Shoulder Displacement");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
end
title("Joint-space smoothness");
legend([p1{1} p1{2} p1{3} p1{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
set(gca,'FontSize',30)
grid on
%% Variance

%% Individual variance
%
% Individual hand path variance
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {'k', 'b', 'r', 'g'};    
    for modalityNumber = 1:4
            figure(3)
            hold on
            subplot(3,5,subjectNumber)
            x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1)); 
            for targetNum = 1:4
                y(targetNum) = norm([mean(xData_std_Hand_new{modalityNumber,targetNum}), mean(yData_std_Hand_new{modalityNumber,targetNum})]);
            end
            p1{modalityNumber} = bar(x, y, 0.2, 'FaceColor', colours{modalityNumber});
            % Figure config
            xlabel("Target");
            ylabel("Standard deviation");
%             title("Median & Quartiles: Shoulder Displacement");
            xlim([0 5]);
            xticks([0 1 2 3 4 5]);
            xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
    end
end
legend([p1{1} p1{2} p1{3} p1{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
%
%% Population variance
%
% Population mean variance
%
% Calculate the population variance
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name) 
    for modalityNumber = 1:4
        for targetNum = 1:4
            y(targetNum) = norm([mean(xData_std_Hand_new{modalityNumber,targetNum}), mean(yData_std_Hand_new{modalityNumber,targetNum})]);
        end
        std_hand_Cat(modalityNumber,subjectNumber,:) = y;
    end
end

%
% Plot mean smoothness
%
for modalityNumber = 1:4
    mean_std_hand(modalityNumber,:) = mean(std_hand_Cat(modalityNumber,:,:)); 
    std_std_hand(modalityNumber,:) = std(std_hand_Cat(modalityNumber,:,:)); 
    figure(4)
    hold on
    colours = {[0.8 0.8 0.8], 'b', 'r', 'g'};
    x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1)); 
    p1{modalityNumber} = bar(x, mean_std_hand(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});         
    for target = 1:targetNum
        plot([x(target) x(target)], [mean_std_hand(modalityNumber,target) + std_std_hand(modalityNumber, target), mean_std_hand(modalityNumber,target) - std_std_hand(modalityNumber, target)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    xlabel("Target");
    ylabel("Standard deviation");
%             title("Median & Quartiles: Shoulder Displacement");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
end
title("Hand path variation");
legend([p1{1} p1{2} p1{3} p1{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
set(gca,'FontSize',30)
grid on
%% Population joint variance
%
% Population mean joint variance
%
% Calculate the population variance
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name) 
    for modalityNumber = 1:4
        for targetNum = 1:4
            y(targetNum) = norm([mean(gSData_std_new{modalityNumber,targetNum}), mean(qEData_std_new{modalityNumber,targetNum})]);
        end
        std_joint_Cat(modalityNumber,subjectNumber,:) = y;
    end
end

%
% Plot mean smoothness
%
for modalityNumber = 1:4
    mean_std_joint(modalityNumber,:) = mean(std_joint_Cat(modalityNumber,:,:)); 
    std_std_joint(modalityNumber,:) = std(std_joint_Cat(modalityNumber,:,:)); 
    figure(3)
    hold on
    colours = {[0.8 0.8 0.8], 'b', 'r', 'g'};
    x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1)); 
    p1{modalityNumber} = bar(x, mean_std_joint(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});         
    for target = 1:targetNum
        plot([x(target) x(target)], [mean_std_joint(modalityNumber,target) + std_std_joint(modalityNumber, target), mean_std_joint(modalityNumber,target) - std_std_joint(modalityNumber, target)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    xlabel("Target");
    ylabel("Standard deviation");
%             title("Median & Quartiles: Shoulder Displacement");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
end
title("Hand path variation");
legend([p1{1} p1{2} p1{3} p1{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
set(gca,'FontSize',30)
grid on