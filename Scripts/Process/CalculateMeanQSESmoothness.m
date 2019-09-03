%
% Mean Hand path on sagittal plane smoothness.
%
clear gSDot_mean_new qEDot_mean_new qSESpeedMag_temp S_qSE_new
DeltaT = t{1, 1}(2);
% Calculate mean hand path velocity
for modalityNumber = 1:length(modalities)
    for target = 1:targetNum
        for k = 2:length(xData_Hand_new{target, iteration, modalityNumber})
            gSDot_mean_new{modalityNumber,target}(k-1) = (gSData_mean_new{modalityNumber,target}(k) - gSData_mean_new{modalityNumber,target}(k-1))/DeltaT;
            qEDot_mean_new{modalityNumber,target}(k-1) = (qEData_mean_new{modalityNumber,target}(k) - qEData_mean_new{modalityNumber,target}(k-1))/DeltaT;
        end
    end
end
% Calculate spectral arc length
for modalityNumber = 1:length(modalities)   
    for target = 1:targetNum
        qSESpeedMag_temp = vecnorm([gSDot_mean_new{modalityNumber,target}; qEDot_mean_new{modalityNumber,target}]);
        S_qSE_new(modalityNumber,target) = SpectralArcLength(qSESpeedMag_temp', DeltaT);
        clear qSESpeedMag_temp
    end
end
% %%
% %
% % Plot to verify
% %
% % Get the length of each dataset
% for modalityNumber = 1:4  
%     for target = 1:targetNum    
%         % Plot data
%         x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));  
%         % Smoothness    
%         % Hand
%         figure(61)
%         hold on
%         p1{modalityNumber} = bar(x, S_qSE_new(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
%         % Figure config
%         xlabel("Target");
%         ylabel("Smoothnes");
%         title("Median & Quartiles: Hand Smoothness");
%         xlim([0 5]);
%         xticks([0 1 2 3 4 5]);
%         xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
%     end
% end