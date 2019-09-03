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
% %
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
                hold on
                plot(xData_Hand_new{currentTarget, currentTargetIteration, modalityNumber}, yData_Hand_new{currentTarget, currentTargetIteration, modalityNumber},...
                'Color', colours{modalityNumber}, 'LineWidth', 1)
%                 plot(xData_Hand_normalized{currentTarget, currentTargetIteration, modalityNumber}, yData_Hand_normalized{currentTarget, currentTargetIteration, modalityNumber},...
%                 'Color', colours{modalityNumber}, 'LineWidth', 1)
                title("Target: " + currentTarget + ", Modality: " + modalityNumber)
                xlim([-0.2 1.2]);
                ylim([-0.2 1.2]);
                grid on
            end
        end
    end
end