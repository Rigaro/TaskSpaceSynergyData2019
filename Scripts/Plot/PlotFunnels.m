%
clear all
modalities = {'Able', 'EMG', 'Jac', 'Lin'};
modalityName = {'Able-bodied', 'EMG', 'Task-space', 'Joint-space'};
targetNum = 4;
sessionNumber = 3;
%
% Get all available subject info
subjectsAvailable = dir(strcat('...\Processed\Data_s', num2str(sessionNumber) , '\*.mat'));
%%
%
% Subject's hand path on sagittal plane
% %
% for subjectNumber = 1:length(subjectsAvailable)
for subjectNumber = 6:6
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {'k', 'b', 'r', 'g'};
    % Plot the subject's hand path on the sagittal plane
    for modalityNumber = 1:length(modalities)
%         for currentTarget = 1:targetNum
        for currentTarget = 3:3
%                 figure((10*(currentTarget-1)) + modalityNumber)
                figure(6)
                hold on
%                 subplot(3,5,subjectNumber)
                subplot(2,2,modalityNumber)
                hold on
                plot(xData_mean_Hand_new{modalityNumber, currentTarget} + xData_std_Hand_new{modalityNumber, currentTarget}, yData_mean_Hand_new{modalityNumber, currentTarget} + yData_std_Hand_new{modalityNumber, currentTarget},...
                'Color', coloursFunnel{modalityNumber}, 'LineWidth', 3)
                plot(xData_mean_Hand_new{modalityNumber, currentTarget} - xData_std_Hand_new{modalityNumber, currentTarget}, yData_mean_Hand_new{modalityNumber, currentTarget} - yData_std_Hand_new{modalityNumber, currentTarget},...
                'Color', coloursFunnel{modalityNumber}, 'LineWidth', 3)
%                 plot(xData_mean_Hand_new{modalityNumber, currentTarget}, yData_mean_Hand_new{modalityNumber, currentTarget} + yData_std_Hand_new{modalityNumber, currentTarget},...
%                 'Color', colours{modalityNumber}, 'LineWidth', 3)
%                 plot(xData_mean_Hand_new{modalityNumber, currentTarget}, yData_mean_Hand_new{modalityNumber, currentTarget} - yData_std_Hand_new{modalityNumber, currentTarget},...
%                 'Color', colours{modalityNumber}, 'LineWidth', 3)

                plot(xData_mean_Hand_new{modalityNumber, currentTarget}, yData_mean_Hand_new{modalityNumber, currentTarget},...
                'Color', colours{modalityNumber}, 'LineWidth', 3)
%                 title("Target: " + currentTarget + ", Modality: " + modalityNumber)
                xlim([-0.2 1.2]);
                ylim([-0.1 0.4]);
%                 if(subjectNumber == 3)
%                     title("Normalised Hand displacement. Modality: " + modalityName(modalityNumber));
                    title(modalityName(modalityNumber) + " hand path");
%                 end
%                 if(subjectNumber == 6 && modalityNumber == 2)
%                     ylabel("y (m)");
%                 end
%                 if(subjectNumber == 13 && modalityNumber == 4)
%                     xlabel("x (m)");
%                 end
                grid on
                set(gca,'FontSize',30)
        end
    end
end
%% Target Combined
%
% Subject's hand path on sagittal plane
% %
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    colours = {'k', 'b', 'r', 'g'};
    % Plot the subject's hand path on the sagittal plane
    for modalityNumber = 1:length(modalities)
            figure(modalityNumber)
            hold on
            subplot(3,5,subjectNumber)
            hold on
            plot(xData_mean_Hand_TarCom{modalityNumber} + xData_std_Hand_TarCom{modalityNumber}, yData_mean_Hand_TarCom{modalityNumber} + yData_mean_Hand_TarCom{modalityNumber},...
            'Color', coloursFunnel{modalityNumber}, 'LineWidth', 3)
            plot(xData_mean_Hand_TarCom{modalityNumber} - xData_std_Hand_TarCom{modalityNumber}, yData_mean_Hand_TarCom{modalityNumber} - yData_mean_Hand_TarCom{modalityNumber},...
            'Color', coloursFunnel{modalityNumber}, 'LineWidth', 3)
            plot(xData_mean_Hand_TarCom{modalityNumber}, yData_mean_Hand_TarCom{modalityNumber},...
            'Color', colours{modalityNumber}, 'LineWidth', 3)
            title("Modality: " + modalityNumber)
            xlim([-0.2 1.2]);
            ylim([-0.7 0.7]);
            grid on
    end
end