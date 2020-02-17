% Load the desired subject
% clear all
% load('C:\Users\ricardog\Dropbox\Research\Development\Workspace\OSI Matlab\Results\Jacobian\Data_s3\XV1997.mat');

% Calculate variance for each modality and target
for modalityNumber = 1:4
    for target = 1:4
        % Hand
        % Create a vector with both standard deviations and get the mean
        tempHandVarMean = mean([xData_std_Hand_new{modalityNumber,target}'; yData_std_Hand_new{modalityNumber,target}']);
        % Now take the mean and std of that movement
        handVarMean(modalityNumber,target) = mean(tempHandVarMean);
        handVarStd(modalityNumber,target) = std(tempHandVarMean);     
        clear tempHandVarMean
        
        % Joint
        % Create a vector with both standard deviations and get the mean
        tempJointVarMean = mean([gSData_std_new{modalityNumber,target}'; qEData_std_new{modalityNumber,target}']);
        % Now take the mean and std of that movement
        jointVarMean(modalityNumber,target) = mean(tempJointVarMean);
        jointVarStd(modalityNumber,target) = std(tempJointVarMean);     
        clear tempJointVarMean
    end
end


%%
% Plot
colours = {[0.8 0.8 0.8], 'b', 'r', 'g'};
    
% Hand
for modalityNumber = 1:4
    figure(1)
%     subplot(1,2,1);
    hold on
    x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1)); 
    p1{modalityNumber} = bar(x, handVarMean(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});       
    for target = 1:targetNum
        plot([x(target) x(target)], [handVarMean(modalityNumber,target) + handVarStd(modalityNumber, target), handVarMean(modalityNumber,target) - handVarStd(modalityNumber, target)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    title("Hand path variation")
    xlabel("Target");
    ylabel("Standard deviation");
    xlim([0 5]);
    ylim([0 0.2]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
end
legend([p1{1} p1{2} p1{3} p1{4}],{'AB','EP','TS','JS'});
set(gca,'FontSize',30)
grid on

% Joint
for modalityNumber = 1:4
    figure(2)
%     subplot(1,2,1);
    hold on
    x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1)); 
    p1{modalityNumber} = bar(x, jointVarMean(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});       
    for target = 1:targetNum
        plot([x(target) x(target)], [jointVarMean(modalityNumber,target) + jointVarStd(modalityNumber, target), jointVarMean(modalityNumber,target) - jointVarStd(modalityNumber, target)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    title("Joint path variation")
    xlabel("Target");
    ylabel("Standard deviation");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
end
legend([p1{1} p1{2} p1{3} p1{4}],{'AB','EP','TS','JS'});
set(gca,'FontSize',30)
grid on
