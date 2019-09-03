%
% Calculates and plots hand path difference over iterations
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
        for modalityNumber = 2:4
            % Through all targets
            for currentTarget = 1:4
                % And all iterations
                for currentTargetIteration = 1:10
                    % To calcualte the difference
                    clear xHand_diff_new_temp yHand_diff_new_temp
                    for k = 1:length(xData_Hand_new{currentTarget, currentTargetIteration, modalityNumber})                        
                        % Calculate the difference between able and
                        % modalities
                        if (k > length(xData_Hand_new{currentTarget, currentTargetIteration, 1}))
                            % When the prosthetic modality is longer than
                            % able.
                            xHand_diff_new_temp{modalityNumber,currentTarget}(k) = abs(xData_Hand_new{currentTarget, currentTargetIteration, 1}(end) - xData_Hand_new{currentTarget, currentTargetIteration, modalityNumber}(k));
                            yHand_diff_new_temp{modalityNumber,currentTarget}(k) = abs(yData_Hand_new{currentTarget, currentTargetIteration, 1}(end) - yData_Hand_new{currentTarget, currentTargetIteration, modalityNumber}(k));
                        else
                            xHand_diff_new_temp{modalityNumber,currentTarget}(k) = abs(xData_Hand_new{currentTarget, currentTargetIteration, 1}(k) - xData_Hand_new{currentTarget, currentTargetIteration, modalityNumber}(k));
                            yHand_diff_new_temp{modalityNumber,currentTarget}(k) = abs(yData_Hand_new{currentTarget, currentTargetIteration, 1}(k) - yData_Hand_new{currentTarget, currentTargetIteration, modalityNumber}(k));
                        end
                    end
                    % Sort out cumulative iteration 
                    iterationCumulative = 10*(sessionNum - 1) + currentTargetIteration;
                    % Now get the total for the current iteration as the
                    % result
                    xHand_diff_new_total{currentTarget}(subjectNumber, iterationCumulative,modalityNumber) = sum(xHand_diff_new_temp{modalityNumber,currentTarget});
                    yHand_diff_new_total{currentTarget}(subjectNumber, iterationCumulative,modalityNumber) = sum(yHand_diff_new_temp{modalityNumber,currentTarget});
                    %
                    % Get norm
                    handPathDiffTotalNorm{currentTarget}(subjectNumber, iterationCumulative,modalityNumber) = norm(xHand_diff_new_total{currentTarget}(subjectNumber, iterationCumulative,modalityNumber),yHand_diff_new_total{currentTarget}(subjectNumber, iterationCumulative,modalityNumber));
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
        for modalityNumber = 2:4
            handPathDiffTotalNormMean{currentTarget}(modalityNumber,:) = mean(handPathDiffTotalNorm{currentTarget}(:, :, modalityNumber),1);
            handPathDiffTotalNormMedian{currentTarget}(modalityNumber,:) = median(handPathDiffTotalNorm{currentTarget}(:, :, modalityNumber),1);
            figure(1)
            subplot(2,2,currentTarget)
            hold on
            plot(handPathDiffTotalNormMean{currentTarget}(modalityNumber,:), markers{currentTarget},...
                 'MarkerFaceColor', markerColours{modalityNumber},...
                 'MarkerEdgeColor', markerColours{modalityNumber},...
                 'MarkerSize', 8);
            grid on;
            xlim([0 31]);
            ylim([0 150]);
            xlabel('iteration');
            ylabel('Total difference');
            title("Mean hand path difference. Target: " + targetNames(currentTarget));
            set(gca,'FontSize',20);
        end
end