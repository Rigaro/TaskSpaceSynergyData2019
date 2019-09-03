%%
% Differences!
%
%
clear all
%
sessionNumber = 3;
%
% Get all available subject info
subjectsAvailable = dir(strcat('...\Processed\Data_s', num2str(sessionNumber) , '\*.mat'));
%%
%
% Individual hand sagittal plane path differences norm of total
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {'k', 'b', 'r', 'g'};    
    for modalityNumber = 2:4
            figure(1)
            hold on
            subplot(3,5,subjectNumber)
            x =  [1.0, 2.0, 3.0, 4.0] + (0.2*(modalityNumber - 1));
            y = [norm(xHand_diff_mean_new_total{modalityNumber,1}, yHand_diff_mean_new_total{modalityNumber,1}), norm(xHand_diff_mean_new_total{modalityNumber,2}, yHand_diff_mean_new_total{modalityNumber,2}),norm(xHand_diff_mean_new_total{modalityNumber,3}, yHand_diff_mean_new_total{modalityNumber,3}),norm(xHand_diff_mean_new_total{modalityNumber,4}, yHand_diff_mean_new_total{modalityNumber,4}) ];
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
% Individual hand sagittal plane path variance norm of total
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {'k', 'b', 'r', 'g'};    
    for modalityNumber = 2:4
            figure(2)
            hold on
            subplot(3,5,subjectNumber)
            x =  [1.0, 2.0, 3.0, 4.0] + (0.2*(modalityNumber - 1));
            y = [norm(xHand_diff_std_new_total{modalityNumber,1}, yHand_diff_std_new_total{modalityNumber,1}), norm(xHand_diff_std_new_total{modalityNumber,2}, yHand_diff_std_new_total{modalityNumber,2}),norm(xHand_diff_std_new_total{modalityNumber,3}, yHand_diff_std_new_total{modalityNumber,3}),norm(xHand_diff_std_new_total{modalityNumber,4}, yHand_diff_std_new_total{modalityNumber,4}) ];
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
% Population hand sagittal plane path differences
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
%         handPath_diff_Cat(modalityNumber-1,subjectNumber,:) = [norm(xHand_diff_mean_new_avg{modalityNumber,1}, yHand_diff_mean_new_total{modalityNumber,1}), norm(xHand_diff_mean_new_total{modalityNumber,2}, yHand_diff_mean_new_total{modalityNumber,2}),norm(xHand_diff_mean_new_total{modalityNumber,3}, yHand_diff_mean_new_total{modalityNumber,3}),norm(xHand_diff_mean_new_total{modalityNumber,4}, yHand_diff_mean_new_total{modalityNumber,4}) ];
%         handPath_std_Cat(modalityNumber-1,subjectNumber,:) = [norm(xHand_diff_std_new_avg{modalityNumber,1}, yHand_diff_std_new_total{modalityNumber,1}), norm(xHand_diff_std_new_total{modalityNumber,2}, yHand_diff_std_new_total{modalityNumber,2}),norm(xHand_diff_std_new_total{modalityNumber,3}, yHand_diff_std_new_total{modalityNumber,3}),norm(xHand_diff_std_new_total{modalityNumber,4}, yHand_diff_std_new_total{modalityNumber,4}) ];
        handPath_diff_Cat(modalityNumber-1,subjectNumber,:) = [norm(xHand_diff_mean_new_avg{modalityNumber,1}, yHand_diff_mean_new_avg{modalityNumber,1}), norm(xHand_diff_mean_new_avg{modalityNumber,2}, yHand_diff_mean_new_avg{modalityNumber,2}),norm(xHand_diff_mean_new_avg{modalityNumber,3}, yHand_diff_mean_new_avg{modalityNumber,3}),norm(xHand_diff_mean_new_avg{modalityNumber,4}, yHand_diff_mean_new_avg{modalityNumber,4}) ];
        handPath_std_Cat(modalityNumber-1,subjectNumber,:) = [norm(xHand_diff_std_new_avg{modalityNumber,1}, yHand_diff_std_new_avg{modalityNumber,1}), norm(xHand_diff_std_new_avg{modalityNumber,2}, yHand_diff_std_new_avg{modalityNumber,2}),norm(xHand_diff_std_new_avg{modalityNumber,3}, yHand_diff_std_new_avg{modalityNumber,3}),norm(xHand_diff_std_new_avg{modalityNumber,4}, yHand_diff_std_new_avg{modalityNumber,4}) ];
    end
end
%%
%
% Plot mean difference
%
for modalityNumber = 1:3
    mean_handPath_diff(modalityNumber,:) = mean(handPath_diff_Cat(modalityNumber,:,:)); 
    std_handPath_diff(modalityNumber,:) = std(handPath_diff_Cat(modalityNumber,:,:));
    figure(7)
    subplot(1,2,2);
    hold on
    colours = {[0.8 0.8 0.8], 'b', 'r', 'g'};    
    x =  [0.8, 1.8, 2.8, 3.8] + (0.2*(modalityNumber - 1));
    p1{modalityNumber} = bar(x, mean_handPath_diff(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber+1});    
    for target = 1:targetNum
        plot([x(target) x(target)], [mean_handPath_diff(modalityNumber,target)+std_handPath_diff(modalityNumber, target), mean_handPath_diff(modalityNumber,target)-std_handPath_diff(modalityNumber, target)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    xlabel("Target");
    ylabel("Difference (m)");
%             title("Median & Quartiles: Shoulder Displacement");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
end
%
title("Hand path mean difference");
legend([p1{1} p1{2} p1{3}],{'EMG','Task-space Synergy','Joint-space Synergy'});
set(gca,'FontSize',30)
grid on
%%
%
% Plot variation
%
for modalityNumber = 2:4
    mean_handPath_std(modalityNumber,:) = mean(handPath_std_Cat(modalityNumber,:,:)); 
    std_handPath_std(modalityNumber,:) = std(handPath_std_Cat(modalityNumber,:,:));
    figure(4)
    hold on
    x =  [1.0, 2.0, 3.0, 4.0] + (0.2*(modalityNumber - 1));
    p1{modalityNumber} = bar(x, mean_handPath_std(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber+1});    
%     for target = 1:targetNum
%         plot([x(target) x(target)], [mean_handPath_std(modalityNumber,target)+std_handPath_std(modalityNumber, target), mean_handPath_std(modalityNumber,target)-std_handPath_std(modalityNumber, target)]...
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
%% Path Combined
%
% Individual hand sagittal plane path differences norm of total
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {'k', 'b', 'r', 'g'};    
    for modalityNumber = 2:4
            figure(5)
            hold on
            subplot(3,5,subjectNumber)
            x = modalityNumber;
            y = norm([xHand_diff_mean_TarCom_total{modalityNumber},yHand_diff_mean_TarCom_total{modalityNumber}]);
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
%
% Population mean differences Target Combined
%
% Hand path
% Calculate the population differences
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name) 
    for modalityNumber = 2:4
        handPath_diff_Cat_TarCom(modalityNumber-1,subjectNumber) = norm([xHand_diff_mean_TarCom_total{modalityNumber},yHand_diff_mean_TarCom_total{modalityNumber}]);
        handPath_std_Cat_TarCom(modalityNumber-1,subjectNumber) = norm([xHand_diff_std_TarCom_total{modalityNumber},yHand_diff_std_TarCom_total{modalityNumber}]);
    end
end
%
% Plot mean difference
%
for modalityNumber = 1:3
    mean_handPath_diff_TarCom(modalityNumber,:) = mean(handPath_diff_Cat_TarCom(modalityNumber,:)); 
    std_handPath_diff_TarCom(modalityNumber,:) = std(handPath_std_Cat_TarCom(modalityNumber,:));
    figure(6)
    hold on
            x = modalityNumber;
    p1{modalityNumber} = bar(x, mean_handPath_diff_TarCom(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber+1});    
%     for target = 1:targetNum
%         plot([x(target) x(target)], [mean_handPath_diff(modalityNumber,target)+std_handPath_diff(modalityNumber, target), mean_handPath_diff(modalityNumber,target)-std_handPath_diff(modalityNumber, target)]...
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