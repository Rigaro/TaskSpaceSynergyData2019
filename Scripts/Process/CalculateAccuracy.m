%
% CalculateAccuracy
%
%
% for each modality
for modalityNumber = 1:length(modalities)
    % each target
    for currentTarget = 1:targetNum
        % and each iteration        
        for currentTargetIteration = 1:iterationsPerTarget
            xError_temp = abs(xData_Hand_new{currentTarget, currentTargetIteration, modalityNumber}(end) - 1);
            yError_temp = abs(yData_Hand_new{currentTarget, currentTargetIteration, modalityNumber}(end) - 0);
            accuracy_new{currentTarget, currentTargetIteration, modalityNumber} = norm([xError_temp, yError_temp]);
        end
        % Calculate mean target accuracy
        mean_accuracy_new{modalityNumber, currentTarget} = mean([accuracy_new{currentTarget, :, modalityNumber}]);
        std_accuracy_new{modalityNumber, currentTarget} = std([accuracy_new{currentTarget, :, modalityNumber}]);
    end
end
clear xError_temp yError_temp zError_temp
        