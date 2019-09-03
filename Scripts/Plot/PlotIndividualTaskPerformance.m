%
% Plots the metrics for each individual against iteration for the given
% session data.
%
%%
%
clear all
%
%
markerColours = {'k', 'b', 'r', 'g'};
markers = {'o', 'o', 'o', 'o'};
for sessionNum = 1:3
    % Get all available subject info
    subjectsAvailable = dir(strcat('...\Processed\Data_s', num2str(sessionNum) , '\*.mat'));
    % Set iterations
    iterations = 10*(sessionNum - 1) + 1 : 10*(sessionNum - 1) + 10;
    % Completion time
    for subjectNumber = 1:length(subjectsAvailable)
    %     subjectsAvailable(subjectNumber).name
        % Load data
        load(strcat(subjectsAvailable(subjectNumber).folder, '\' , subjectsAvailable(subjectNumber).name));
        subjectsAvailable = dir(strcat('...\Processed\Data_s', num2str(sessionNum) , '\*.mat'));
        % Plot modality as colours, targets as marker
        for currentTarget = 1:4
            for modalityNumber = 1:4
    %             figure(currentTarget);
    %             subplot(3,5,subjectNumber);
    %             hold on;
    %             plot(tFinal(currentTarget, :, modalityNumber), markers{currentTarget},...
    %                  'MarkerFaceColor', markerColours{modalityNumber},...
    %                  'MarkerEdgeColor', markerColours{modalityNumber});
                % Completion time
                tFinalCat{currentTarget}(subjectNumber, iterations,modalityNumber) = tFinal(currentTarget, :, modalityNumber);
            end
        end
    end
end   
% Calculate mean/median and plot
%%
modalitiesModified = {'Able', 'EMG', 'Task', 'Joint'};
targetNames = {'Close', 'Mid', 'Far', 'High'};
% Completion time
for currentTarget = 1:4
        for modalityNumber = 1:4
            tFinalMean{currentTarget}(modalityNumber,:) = mean(tFinalCat{currentTarget}(:, :, modalityNumber),1);
            tFinalMedian{currentTarget}(modalityNumber,:) = median(tFinalCat{currentTarget}(:, :, modalityNumber),1);
            figure(2)
            subplot(2,2,currentTarget)
            hold on
            plot(tFinalMean{currentTarget}(modalityNumber,:), markers{currentTarget},...
                 'MarkerFaceColor', markerColours{modalityNumber},...
                 'MarkerEdgeColor', markerColours{modalityNumber},...
                 'MarkerSize', 8);
            grid on;
            xlim([0 31]);
            ylim([0 7]);
            xlabel('iteration');
            ylabel('Time (s)');
            title("Completion time. Target: " + targetNames(currentTarget));
            set(gca,'FontSize',20);
        end
end