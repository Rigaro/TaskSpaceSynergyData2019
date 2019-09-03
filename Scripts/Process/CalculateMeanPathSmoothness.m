%
% Mean Hand path on sagittal plane smoothness.
%
clear xDotHand_mean_new yDotHand_mean_new handSpeedMag_temp S_Hand_new
DeltaT = t{1, 1}(2);
% Calculate mean hand path velocity
for modalityNumber = 1:length(modalities)
    for target = 1:targetNum
        for k = 2:length(xData_Hand_new{target, iteration, modalityNumber})
            xDotHand_mean_new{modalityNumber,target}(k-1) = (xData_mean_Hand_new{modalityNumber,target}(k) - xData_mean_Hand_new{modalityNumber,target}(k-1))/DeltaT;
            yDotHand_mean_new{modalityNumber,target}(k-1) = (yData_mean_Hand_new{modalityNumber,target}(k) - yData_mean_Hand_new{modalityNumber,target}(k-1))/DeltaT;
        end
    end
end
% Calculate spectral arc length
for modalityNumber = 1:length(modalities)   
    for target = 1:targetNum
        handSpeedMag_temp = vecnorm([xDotHand_mean_new{modalityNumber,target}; yDotHand_mean_new{modalityNumber,target}]);
        S_Hand_new(modalityNumber,target) = SpectralArcLength(handSpeedMag_temp', DeltaT);
        clear handSpeedMag_temp
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
%         p1{modalityNumber} = bar(x, S_Hand_new(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
%         % Figure config
%         xlabel("Target");
%         ylabel("Smoothnes");
%         title("Median & Quartiles: Hand Smoothness");
%         xlim([0 5]);
%         xticks([0 1 2 3 4 5]);
%         xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
%     end
% end