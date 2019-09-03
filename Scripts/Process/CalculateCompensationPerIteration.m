%
% Calculates and plots trunk displacement over iterations
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
    % Completion time
    for subjectNumber = 1:length(subjectsAvailable)
    %     subjectsAvailable(subjectNumber).name
        % Load data
        load(strcat(subjectsAvailable(subjectNumber).folder, '\' , subjectsAvailable(subjectNumber).name));
        subjectsAvailable = dir(strcat('...\Processed\Data_s', num2str(sessionNum) , '\*.mat'));
        % Plot modality as colours, targets as marker
        
        % Loop through all modalities
        for modalityNumber = 1:4
            % Through all targets
            for currentTarget = 1:4
                % And all iterations
                for currentTargetIteration = 1:10
                    % To calcualte the displacement                    
                    % Sort out cumulative iteration 
                    iterationCumulative = 10*(sessionNum - 1) + currentTargetIteration;
                    % Now get the total for the current iteration as the
                    % result
                    compensation_UB{currentTarget}(subjectNumber, iterationCumulative,modalityNumber) = d_UB(currentTarget, currentTargetIteration, modalityNumber);
                    compensation_SH{currentTarget}(subjectNumber, iterationCumulative,modalityNumber) = d_SH(currentTarget, currentTargetIteration, modalityNumber);
                end
            end
        end
    end
end
%%
modalitiesModified = {'Able', 'EMG', 'Task', 'Joint'};
targetNames = {'Close', 'Mid', 'Far', 'High'};
% Calculate mean/median and plot
for currentTarget = 1:4
        for modalityNumber = 1:4
            compensation_UB_Mean{currentTarget}(modalityNumber,:) = mean(compensation_UB{currentTarget}(:, :, modalityNumber),1);
            compensation_UB_Median{currentTarget}(modalityNumber,:) = median(compensation_UB{currentTarget}(:, :, modalityNumber),1);
            compensation_SH_Mean{currentTarget}(modalityNumber,:) = mean(compensation_SH{currentTarget}(:, :, modalityNumber),1);
            compensation_SH_Median{currentTarget}(modalityNumber,:) = median(compensation_SH{currentTarget}(:, :, modalityNumber),1);
            %
            % UA
            figure(3)
            subplot(2,2,currentTarget)
            hold on
            plot(compensation_UB_Mean{currentTarget}(modalityNumber,:), markers{currentTarget},...
                 'MarkerFaceColor', markerColours{modalityNumber},...
                 'MarkerEdgeColor', markerColours{modalityNumber},...
                 'MarkerSize', 8);
            grid on;
            xlim([0 31]);
%             ylim([0 0.4]);
            xlabel('iteration');
            ylabel('Displacement (m)');
            title("C7 displacement. Target: " + targetNames(currentTarget));
            set(gca,'FontSize',20);
            %
            % SH
            figure(4)
            subplot(2,2,currentTarget)
            hold on
            plot(compensation_SH_Mean{currentTarget}(modalityNumber,:), markers{currentTarget},...
                 'MarkerFaceColor', markerColours{modalityNumber},...
                 'MarkerEdgeColor', markerColours{modalityNumber},...
                 'MarkerSize', 8);
            grid on;
            xlim([0 31]);
%             ylim([0 0.1]);
            xlabel('iteration');
            ylabel('Displacement (m)');
            title("SH displacement. Target: " + targetNames(currentTarget));
            set(gca,'FontSize',20);
        end
end