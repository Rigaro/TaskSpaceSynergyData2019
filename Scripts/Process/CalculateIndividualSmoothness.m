% Load the desired subject
clear all
load('C:\Users\ricardog\Dropbox\Research\Development\Workspace\OSI Matlab\Results\Jacobian\Data_s3\XV1997.mat');

% Define sample time
DeltaT = t{1, 1}(2);

% Calculate spectral arc length for each modality, target and iteration
for modalityNumber = 1:4
    for target = 1:4
        for i = 1:10
            % Hand
            handSpeedMag_temp = vecnorm([xData_Hand_new{target, i, modalityNumber}; yData_Hand_new{target, i, modalityNumber}]);
            S_Hand_PI{target, i, modalityNumber} = SpectralArcLength(handSpeedMag_temp', DeltaT);
            clear handSpeedMag_temp
            % Joint
            qSESpeedMag_temp = vecnorm([gData_UA{target, i, modalityNumber}'; qData_E{target, i, modalityNumber}']);
            S_qSE_PI{target, i, modalityNumber} = SpectralArcLength(qSESpeedMag_temp', DeltaT);
            clear qSESpeedMag_temp
        end
        % Calculate means and stds.
        S_Hand_mean(modalityNumber,target) = mean([S_Hand_PI{target, :, modalityNumber}],2);
        S_qSE_mean(modalityNumber,target) = mean([S_qSE_PI{target, :, modalityNumber}],2);
        S_Hand_std(modalityNumber,target) = std([S_Hand_PI{target, :, modalityNumber}]);
        S_qSE_std(modalityNumber,target) = std([S_qSE_PI{target, :, modalityNumber}]);
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
    p1{modalityNumber} = bar(x, S_Hand_mean(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});       
    for target = 1:targetNum
        plot([x(target) x(target)], [S_Hand_mean(modalityNumber,target) + S_Hand_std(modalityNumber, target), S_Hand_mean(modalityNumber,target) - S_Hand_std(modalityNumber, target)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    title("Hand path smoothness")
    xlabel("Target");
    ylabel("Spectral arc length");
    xlim([0 5]);
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
    p1{modalityNumber} = bar(x, S_qSE_mean(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});       
    for target = 1:targetNum
        plot([x(target) x(target)], [S_qSE_mean(modalityNumber,target) + S_qSE_std(modalityNumber, target), S_qSE_mean(modalityNumber,target) - S_qSE_std(modalityNumber, target)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    title("Joint-space smoothness")
    xlabel("Target");
    ylabel("Spectral arc length");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
end
legend([p1{1} p1{2} p1{3} p1{4}],{'AB','EP','TS','JS'});
set(gca,'FontSize',30)
grid on

