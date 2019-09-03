%
clear all
modalities = {'Able', 'EMG', 'Jac', 'Lin'};
modalityName = {'Able-bodied', 'EMG', 'Task-space', 'Joint-space'};
targetNum = 4;
%
sessionNumber = 3;
%
% Get all available subject info
subjectsAvailable = dir(strcat('...\Processed\Data_s', num2str(sessionNumber) , '\*.mat'));

%% QSE relationship funnels
% for subjectNumber = 1:length(subjectsAvailable)
for subjectNumber = 6:6
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {'k', 'b', 'r', 'g'};
    % Plot the subject's hand path on the sagittal plane
    for modalityNumber = 1:length(modalities)
%         for currentTarget = 1:targetNum
        for currentTarget = 3:3
%             figure((10*(currentTarget-1)) + modalityNumber)
            figure(10)
            hold on
%             subplot(3,5,subjectNumber)
            subplot(2,2,modalityNumber)
            hold on
            plot(gSData_mean_new{modalityNumber, currentTarget}+gSData_std_new{modalityNumber, currentTarget}, qEData_mean_new{modalityNumber, currentTarget}-qEData_std_new{modalityNumber, currentTarget},...
            'Color', coloursFunnel{modalityNumber}, 'LineWidth', 3)
            plot(gSData_mean_new{modalityNumber, currentTarget}-gSData_std_new{modalityNumber, currentTarget}, qEData_mean_new{modalityNumber, currentTarget}+qEData_std_new{modalityNumber, currentTarget},...
            'Color', coloursFunnel{modalityNumber}, 'LineWidth', 3)
            plot(gSData_mean_new{modalityNumber, currentTarget}, qEData_mean_new{modalityNumber, currentTarget},...
            'Color', colours{modalityNumber}, 'LineWidth', 3)
%             title("Target: " + currentTarget + ", Modality: " + modalityNumber)
            xlim([-2.0 0.5]);
            ylim([-2.0 0.5]);
            title(modalityName(modalityNumber) + " joint angles");
%             if(subjectNumber == 3)
%                 title("Shoulder-elbow joint phase plot. Modality: " + modalityName(modalityNumber));
%             end
%             if(subjectNumber == 6)
%                 ylabel("Elbow flexion (rad)");
%             end
%             if(subjectNumber == 13)
%                 xlabel("Shoulder flexion (rad)");
%             end
            grid on
            set(gca,'FontSize',30)
        end
    end
end

%% Joint path differences
%
% Population joint path differences
%
%
% Population mean differences
%
% Hand path
% Calculate the population differences
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name) 
    for modalityNumber = 2:4
        jointPath_diff_Cat(modalityNumber-1,subjectNumber,:) = [norm(gS_diff_mean_new_avg{modalityNumber,1}, qE_diff_mean_new_avg{modalityNumber,1}), norm(gS_diff_mean_new_avg{modalityNumber,2}, qE_diff_mean_new_avg{modalityNumber,2}),norm(gS_diff_mean_new_avg{modalityNumber,3}, qE_diff_mean_new_avg{modalityNumber,3}),norm(gS_diff_mean_new_avg{modalityNumber,4}, qE_diff_mean_new_avg{modalityNumber,4}) ];
        jointPath_std_Cat(modalityNumber-1,subjectNumber,:) = [norm(gS_diff_std_new_avg{modalityNumber,1}, qE_diff_std_new_avg{modalityNumber,1}), norm(gS_diff_std_new_avg{modalityNumber,2}, qE_diff_std_new_avg{modalityNumber,2}),norm(gS_diff_std_new_avg{modalityNumber,3}, qE_diff_std_new_avg{modalityNumber,3}),norm(gS_diff_std_new_avg{modalityNumber,4}, qE_diff_std_new_avg{modalityNumber,4}) ];
    end
end
%%
%
% Plot mean difference
%
for modalityNumber = 1:3
    mean_jointPath_diff(modalityNumber,:) = mean(jointPath_diff_Cat(modalityNumber,:,:)); 
    std_jointPath_diff(modalityNumber,:) = std(jointPath_diff_Cat(modalityNumber,:,:));
    figure(4)
    hold on
    colours = {[0.8 0.8 0.8], 'b', 'r', 'g'};    
    x =  [0.8, 1.8, 2.8, 3.8] + (0.2*(modalityNumber - 1));
    p1{modalityNumber} = bar(x, mean_jointPath_diff(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber+1});    
    for target = 1:targetNum
        plot([x(target) x(target)], [mean_jointPath_diff(modalityNumber,target)+std_jointPath_diff(modalityNumber, target), mean_jointPath_diff(modalityNumber,target)-std_jointPath_diff(modalityNumber, target)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    xlabel("Target");
    ylabel("Difference (m)");
%             title("Median & Quartiles: Shoulder Displacement");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
    ylim([0 0.5]);
end
%
title("Joint path mean difference");
legend([p1{1} p1{2} p1{3}],{'EMG','Task-space Synergy','Joint-space Synergy'});
set(gca,'FontSize',30)
grid on