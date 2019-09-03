clear xHand_mean_diff_new yHand_mean_diff_new zHand_mean_diff_new
clear xHand_std_diff_new yHand_std_diff_new zHand_std_diff_new
clear xHand_mean_diff_TarCom yHand_mean_diff_TarCom zHand_mean_diff_TarCom
clear xHand_std_diff_TarCom yHand_std_diff_TarCom zHand_std_diff_TarCom
%
% Calculate normalised hand path differences
%
for modalityNumber = 2:4
    for target = 1:4
        for k = 1:length(xData_mean_Hand_new{modalityNumber,target})
            % Calculate the difference between able and modalities
            if (k > length(xData_mean_Hand_new{1,target}))
                % Hand mean
                xHand_mean_diff_new{modalityNumber,target}(k) = abs(xData_mean_Hand_new{1,target}(end) - xData_mean_Hand_new{modalityNumber,target}(k));
                yHand_mean_diff_new{modalityNumber,target}(k) = abs(yData_mean_Hand_new{1,target}(end) - yData_mean_Hand_new{modalityNumber,target}(k));
                zHand_mean_diff_new{modalityNumber,target}(k) = abs(zData_mean_Hand_new{1,target}(end) - zData_mean_Hand_new{modalityNumber,target}(k));
                % Hand std
                xHand_std_diff_new{modalityNumber,target}(k) = abs(xData_std_Hand_new{1,target}(end) - xData_std_Hand_new{modalityNumber,target}(k));
                yHand_std_diff_new{modalityNumber,target}(k) = abs(yData_std_Hand_new{1,target}(end) - yData_std_Hand_new{modalityNumber,target}(k));
                zHand_std_diff_new{modalityNumber,target}(k) = abs(zData_std_Hand_new{1,target}(end) - zData_std_Hand_new{modalityNumber,target}(k));
            else
                % Hand mean
                xHand_mean_diff_new{modalityNumber,target}(k) = abs(xData_mean_Hand_new{1,target}(k) - xData_mean_Hand_new{modalityNumber,target}(k));
                yHand_mean_diff_new{modalityNumber,target}(k) = abs(yData_mean_Hand_new{1,target}(k) - yData_mean_Hand_new{modalityNumber,target}(k));
                zHand_mean_diff_new{modalityNumber,target}(k) = abs(xData_mean_Hand_new{1,target}(k) - zData_mean_Hand_new{modalityNumber,target}(k));
                % Hand std
                xHand_std_diff_new{modalityNumber,target}(k) = abs(xData_std_Hand_new{1,target}(k) - xData_std_Hand_new{modalityNumber,target}(k));
                yHand_std_diff_new{modalityNumber,target}(k) = abs(yData_std_Hand_new{1,target}(k) - yData_std_Hand_new{modalityNumber,target}(k));
                zHand_std_diff_new{modalityNumber,target}(k) = abs(xData_std_Hand_new{1,target}(k) - zData_std_Hand_new{modalityNumber,target}(k));
            end
            % mean
            xHand_diff_mean_new_total{modalityNumber,target} = sum(xHand_mean_diff_new{modalityNumber,target});
            yHand_diff_mean_new_total{modalityNumber,target} = sum(yHand_mean_diff_new{modalityNumber,target});
            zHand_diff_mean_new_total{modalityNumber,target} = sum(zHand_mean_diff_new{modalityNumber,target});
            xHand_diff_mean_new_avg{modalityNumber,target} = mean(xHand_mean_diff_new{modalityNumber,target});
            yHand_diff_mean_new_avg{modalityNumber,target} = mean(yHand_mean_diff_new{modalityNumber,target});
            zHand_diff_mean_new_avg{modalityNumber,target} = mean(zHand_mean_diff_new{modalityNumber,target});
            % std
            xHand_diff_std_new_total{modalityNumber,target} = sum(xHand_std_diff_new{modalityNumber,target});
            yHand_diff_std_new_total{modalityNumber,target} = sum(yHand_std_diff_new{modalityNumber,target});
            zHand_diff_std_new_total{modalityNumber,target} = sum(zHand_std_diff_new{modalityNumber,target});
            xHand_diff_std_new_avg{modalityNumber,target} = mean(xHand_std_diff_new{modalityNumber,target});
            yHand_diff_std_new_avg{modalityNumber,target} = mean(yHand_std_diff_new{modalityNumber,target});
            zHand_diff_std_new_avg{modalityNumber,target} = mean(zHand_std_diff_new{modalityNumber,target});
        end
    end
    %
    % Target Combined
    %    
    for k = 1:length(xData_mean_Hand_TarCom{modalityNumber})
        % Calculate the difference between able and modalities
        if (k > length(xData_mean_Hand_TarCom{1}))
            % Hand mean
            xHand_mean_diff_TarCom{modalityNumber}(k) = abs(xData_mean_Hand_TarCom{1}(end) - xData_mean_Hand_TarCom{modalityNumber}(k));
            yHand_mean_diff_TarCom{modalityNumber}(k) = abs(yData_mean_Hand_TarCom{1}(end) - yData_mean_Hand_TarCom{modalityNumber}(k));
            zHand_mean_diff_TarCom{modalityNumber}(k) = abs(zData_mean_Hand_TarCom{1}(end) - zData_mean_Hand_TarCom{modalityNumber}(k));
            % Hand std
            xHand_std_diff_TarCom{modalityNumber}(k) = abs(xData_std_Hand_TarCom{1}(end) - xData_std_Hand_TarCom{modalityNumber}(k));
            yHand_std_diff_TarCom{modalityNumber}(k) = abs(yData_std_Hand_TarCom{1}(end) - yData_std_Hand_TarCom{modalityNumber}(k));
            zHand_std_diff_TarCom{modalityNumber}(k) = abs(zData_std_Hand_TarCom{1}(end) - zData_std_Hand_TarCom{modalityNumber}(k));
        else
            % Hand mean
            xHand_mean_diff_TarCom{modalityNumber}(k) = abs(xData_mean_Hand_TarCom{1}(k) - xData_mean_Hand_TarCom{modalityNumber}(k));
            yHand_mean_diff_TarCom{modalityNumber}(k) = abs(yData_mean_Hand_TarCom{1}(k) - yData_mean_Hand_TarCom{modalityNumber}(k));
            zHand_mean_diff_TarCom{modalityNumber}(k) = abs(xData_mean_Hand_TarCom{1}(k) - zData_mean_Hand_TarCom{modalityNumber}(k));
            % Hand std
            xHand_std_diff_TarCom{modalityNumber}(k) = abs(xData_std_Hand_TarCom{1}(k) - xData_std_Hand_TarCom{modalityNumber}(k));
            yHand_std_diff_TarCom{modalityNumber}(k) = abs(yData_std_Hand_TarCom{1}(k) - yData_std_Hand_TarCom{modalityNumber}(k));
            zHand_std_diff_TarCom{modalityNumber}(k) = abs(xData_std_Hand_TarCom{1}(k) - zData_std_Hand_TarCom{modalityNumber}(k));
        end
        % mean
        xHand_diff_mean_TarCom_total{modalityNumber} = sum(xHand_mean_diff_TarCom{modalityNumber});
        yHand_diff_mean_TarCom_total{modalityNumber} = sum(yHand_mean_diff_TarCom{modalityNumber});
        zHand_diff_mean_TarCom_total{modalityNumber} = sum(zHand_mean_diff_TarCom{modalityNumber});
        xHand_diff_mean_TarCom_avg{modalityNumber} = mean(xHand_mean_diff_TarCom{modalityNumber});
        yHand_diff_mean_TarCom_avg{modalityNumber} = mean(yHand_mean_diff_TarCom{modalityNumber});
        zHand_diff_mean_TarCom_avg{modalityNumber} = mean(zHand_mean_diff_TarCom{modalityNumber});
        % std
        xHand_diff_std_TarCom_total{modalityNumber} = sum(xHand_std_diff_TarCom{modalityNumber});
        yHand_diff_std_TarCom_total{modalityNumber} = sum(yHand_std_diff_TarCom{modalityNumber});
        zHand_diff_std_TarCom_total{modalityNumber} = sum(zHand_std_diff_TarCom{modalityNumber});
        xHand_diff_std_TarCom_avg{modalityNumber} = mean(xHand_std_diff_TarCom{modalityNumber});
        yHand_diff_std_TarCom_avg{modalityNumber} = mean(yHand_std_diff_TarCom{modalityNumber});
        zHand_diff_std_TarCom_avg{modalityNumber} = mean(zHand_std_diff_TarCom{modalityNumber});
    end
end 