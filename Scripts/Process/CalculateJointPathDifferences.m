clear gS_mean_diff_new qE_mean_diff_new
clear gS_std_diff_new qE_std_diff_new
%
% Calculate normalised hand path differences
%
for modalityNumber = 2:4
    for target = 1:4
        for k = 1:length(gSData_mean_new{modalityNumber,target})
            % Calculate the difference between able and modalities
            if (k > length(gSData_mean_new{1,target}))
                % Joint mean
                gS_mean_diff_new{modalityNumber,target}(k) = abs(gSData_mean_new{1,target}(end) - gSData_mean_new{modalityNumber,target}(k));
                qE_mean_diff_new{modalityNumber,target}(k) = abs(qEData_mean_new{1,target}(end) - qEData_mean_new{modalityNumber,target}(k));
                % Joint std
                gS_std_diff_new{modalityNumber,target}(k) = abs(gSData_std_new{1,target}(end) - gSData_std_new{modalityNumber,target}(k));
                qE_std_diff_new{modalityNumber,target}(k) = abs(qEData_std_new{1,target}(end) - qEData_std_new{modalityNumber,target}(k));
            else
                % Joint mean
                gS_mean_diff_new{modalityNumber,target}(k) = abs(gSData_mean_new{1,target}(k) - gSData_mean_new{modalityNumber,target}(k));
                qE_mean_diff_new{modalityNumber,target}(k) = abs(qEData_mean_new{1,target}(k) - qEData_mean_new{modalityNumber,target}(k));
                % Joint std
                gS_std_diff_new{modalityNumber,target}(k) = abs(gSData_std_new{1,target}(k) - gSData_std_new{modalityNumber,target}(k));
                qE_std_diff_new{modalityNumber,target}(k) = abs(qEData_std_new{1,target}(k) - qEData_std_new{modalityNumber,target}(k));
            end
            % mean
            gS_diff_mean_new_total{modalityNumber,target} = sum(gS_mean_diff_new{modalityNumber,target});
            qE_diff_mean_new_total{modalityNumber,target} = sum(qE_mean_diff_new{modalityNumber,target});
            gS_diff_mean_new_avg{modalityNumber,target} = mean(gS_mean_diff_new{modalityNumber,target});
            qE_diff_mean_new_avg{modalityNumber,target} = mean(qE_mean_diff_new{modalityNumber,target});
            % std
            gS_diff_std_new_total{modalityNumber,target} = sum(gS_std_diff_new{modalityNumber,target});
            qE_diff_std_new_total{modalityNumber,target} = sum(qE_std_diff_new{modalityNumber,target});
            gS_diff_std_new_avg{modalityNumber,target} = mean(gS_std_diff_new{modalityNumber,target});
            qE_diff_std_new_avg{modalityNumber,target} = mean(qE_std_diff_new{modalityNumber,target});
        end
    end
end 