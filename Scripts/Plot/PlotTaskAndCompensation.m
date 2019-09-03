%%
% Task and compensation
%
%
clear all
%
barColours = {[0.8 0.8 0.8], 'b', 'r', 'g'};
%
sessionNumber = 3;
%
% Get all available subject info
subjectsAvailable = dir(strcat('...\Processed\Data_s', num2str(sessionNumber) , '\*.mat'));
%
%%
%
% Individual completion time 
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {[0.8 0.8 0.8], 'b', 'r', 'g'};    
    for modalityNumber = 1:4
            figure(1)
            hold on
            subplot(3,5,subjectNumber)
            x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1)); 
            p1{modalityNumber} = bar(x, mean_t(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
            % Figure config
            xlabel("Target");
            ylabel("Task Time (s)");
%             title("Median & Quartiles: Shoulder Displacement");
            xlim([0 5]);
            xticks([0 1 2 3 4 5]);
            xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
    end
end
legend([p1{1} p1{2} p1{3} p1{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
%
%% Population task time
%
% Population mean task time
%
% Hand path
% Calculate the population task time
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name) 
    for modalityNumber = 1:4
        mean_t_Cat(modalityNumber,subjectNumber,:) = [mean_t(modalityNumber,1), mean_t(modalityNumber,2),mean_t(modalityNumber,3),mean_t(modalityNumber,4)];
        for i=1:iterationsPerTarget
            mean_t_Cat_all(modalityNumber,(10*(subjectNumber-1))+i,:) = tFinal(:, currentTargetIteration, modalityNumber)';
        end
    end
end
%
% Plot mean task time
%
for modalityNumber = 1:4
    mean_t_Pop(modalityNumber,:) = mean(mean_t_Cat(modalityNumber,:,:)); 
    std_t_Pop(modalityNumber,:) = std(mean_t_Cat(modalityNumber,:,:)); 
%     mean_t_Pop(modalityNumber,:) = mean(mean_t_Cat_all(modalityNumber,:,:)); 
%     std_t_Pop(modalityNumber,:) = std(mean_t_Cat_all(modalityNumber,:,:)); 
    figure(2)
    subplot(1,2,2);
    hold on
    colours = {[0.8 0.8 0.8], 'b', 'r', 'g'};    
    x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1)); 
    p1{modalityNumber} = bar(x, mean_t_Pop(modalityNumber,:), 0.2, 'FaceColor', barColours{modalityNumber});    
    for target = 1:targetNum
        plot([x(target) x(target)], [mean_t_Pop(modalityNumber,target) + std_t_Pop(modalityNumber, target), mean_t_Pop(modalityNumber,target) - std_t_Pop(modalityNumber, target)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    xlabel("Target");
    ylabel("Time (s)");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
end
title("Task time");
legend([p1{1} p1{2} p1{3} p1{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
set(gca,'FontSize',30)
grid on
%
%% Accuracy
%
% Individual Accuracy 
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {[0.8 0.8 0.8], 'b', 'r', 'g'};    
    for modalityNumber = 1:4
            figure(1)
            hold on
            subplot(3,5,subjectNumber)
            x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1)); 
            p1{modalityNumber} = bar(x, [mean_accuracy_new{modalityNumber,:}], 0.2, 'FaceColor', colours{modalityNumber});
            % Figure config
            xlabel("Target");
            ylabel("Task Time (s)");
%             title("Median & Quartiles: Shoulder Displacement");
            xlim([0 5]);
            xticks([0 1 2 3 4 5]);
            xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
    end
end
legend([p1{1} p1{2} p1{3} p1{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
%
%% Population accuracy
%
% Population mean accuracy
%
% Calculate the population accuracy
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name) 
    for modalityNumber = 1:4
        mean_accuracy_Cat(modalityNumber,subjectNumber,:) = [mean_accuracy_new{modalityNumber,1}, mean_accuracy_new{modalityNumber,2},mean_accuracy_new{modalityNumber,3},mean_accuracy_new{modalityNumber,4}];
    end
end
%
% Plot mean accuracy
%
for modalityNumber = 1:4
    mean_accuracy_Pop(modalityNumber,:) = mean(mean_accuracy_Cat(modalityNumber,:,:)); 
    std_accuracy_Pop(modalityNumber,:) = std(mean_accuracy_Cat(modalityNumber,:,:)); 
    figure(2)
    colours = {[0.8 0.8 0.8], 'b', 'r', 'g'};    
    hold on
    x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1)); 
    p1{modalityNumber} = bar(x, mean_accuracy_Pop(modalityNumber,:), 0.2, 'FaceColor', barColours{modalityNumber});    
    for target = 1:targetNum
        plot([x(target) x(target)], [mean_accuracy_Pop(modalityNumber,target) + std_accuracy_Pop(modalityNumber, target), mean_accuracy_Pop(modalityNumber,target) - std_accuracy_Pop(modalityNumber, target)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    xlabel("Target");
    ylabel("Accuracy");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
end
title("Reach accuracy");
legend([p1{1} p1{2} p1{3} p1{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
set(gca,'FontSize',30)
grid on
%
%%
%
% Individual UB compensation
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {[0.8 0.8 0.8], 'b', 'r', 'g'};    
    for modalityNumber = 1:4
            figure(3)
            hold on
            subplot(3,5,subjectNumber)
            x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1)); 
            p1{modalityNumber} = bar(x, mean_d_UB(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
            % Figure config
            xlabel("Target");
            ylabel("Displacement (m)");
            xlim([0 5]);
            xticks([0 1 2 3 4 5]);
            xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
    end
end
legend([p1{1} p1{2} p1{3} p1{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
%
%% Population UB compensation
%
% Population mean UB compensation
%
% Hand path
% Calculate the population UB compensation
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name) 
    for modalityNumber = 1:4
        meat_d_UB_Cat(modalityNumber,subjectNumber,:) = [mean_d_UB(modalityNumber,1), mean_d_UB(modalityNumber,2),mean_d_UB(modalityNumber,3),mean_d_UB(modalityNumber,4)];
    end
end

%
% Plot mean UB
%
for modalityNumber = 1:4
    mean_d_UB_Pop(modalityNumber,:) = mean(meat_d_UB_Cat(modalityNumber,:,:)); 
    std_d_UB_Pop(modalityNumber,:) = std(meat_d_UB_Cat(modalityNumber,:,:)); 
    figure(4)
    subplot(1,2,2)
    hold on
    colours = {[0.8 0.8 0.8], 'b', 'r', 'g'};     
    x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1)); 
    p1{modalityNumber} = bar(x, mean_d_UB_Pop(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});    
    for target = 1:targetNum
        plot([x(target) x(target)], [mean_d_UB_Pop(modalityNumber,target) + std_d_UB_Pop(modalityNumber, target), mean_d_UB_Pop(modalityNumber,target) - std_d_UB_Pop(modalityNumber, target)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    xlabel("Target");
    ylabel("Displacement (m)");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
end
title("C7 mean displacement");
legend([p1{1} p1{2} p1{3} p1{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
set(gca,'FontSize',30)
grid on
%
%%
%
% Individual SH compensation
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {[0.8 0.8 0.8], 'b', 'r', 'g'};    
    for modalityNumber = 1:4
            figure(5)
            hold on
            subplot(3,5,subjectNumber)
            x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1)); 
            p1{modalityNumber} = bar(x, mean_d_SH(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
            % Figure config
            xlabel("Target");
            ylabel("Displacement (m)");
            xlim([0 5]);
            xticks([0 1 2 3 4 5]);
            xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
    end
end
legend([p1{1} p1{2} p1{3} p1{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
%
%% Population SH compensation
%
% Population mean SH compensation
%
% Hand path
% Calculate the population SH compensation
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name) 
    for modalityNumber = 1:4
        meat_d_SH_Cat(modalityNumber,subjectNumber,:) = [mean_d_SH(modalityNumber,1), mean_d_SH(modalityNumber,2),mean_d_SH(modalityNumber,3),mean_d_SH(modalityNumber,4)];
    end
end

%
% Plot mean SH compensation
%
for modalityNumber = 1:4
    mean_d_SH_Pop(modalityNumber,:) = mean(meat_d_SH_Cat(modalityNumber,:,:)); 
    std_d_SH_Pop(modalityNumber,:) = std(meat_d_SH_Cat(modalityNumber,:,:)); 
    figure(11)
%     subplot(1,2,2);
    hold on
    colours = {[0.8 0.8 0.8], 'b', 'r', 'g'};    
    x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1)); 
    p1{modalityNumber} = bar(x, mean_d_SH_Pop(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});    
    for target = 1:targetNum
        plot([x(target) x(target)], [mean_d_SH_Pop(modalityNumber,target) + std_d_SH_Pop(modalityNumber, target), mean_d_SH_Pop(modalityNumber,target) - std_d_SH_Pop(modalityNumber, target)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    xlabel("Target");
    ylabel("Displacement (m)");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
end
%
title("Shoulder acromion mean displacement");
legend([p1{1} p1{2} p1{3} p1{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
set(gca,'FontSize',30)
grid on