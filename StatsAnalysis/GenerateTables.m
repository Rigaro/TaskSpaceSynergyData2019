%
% Load subject list%
% clear all
modalities = {'Able', 'EMG', 'Jac', 'Lin'};
targetNum = 4;
sessionNumber = 3;
%
% Data directory
dataDir = strcat('C:\Users\ricardog\Dropbox\Research\Development\Workspace\OSI Matlab\Results\Jacobian\Data_s', num2str(sessionNumber), '\');
% Get all available subject info
subjectsAvailable = dir(strcat(dataDir, '\*.mat'));

% Create array of data
array_d_sh = [];
array_d_c7 = [];
array_s_hand = [];
array_s_joint = [];
array_var_hand = [];
array_var_joint = [];
array_time_full = [];
array_hdiff_full = [];

% Loop through the 15 subjects
% for subjectNumber = 1:(length(subjectsAvailable)-1)
for subjectNumber = 16:16
%for subjectNumber = 1:1
    % Load subject
    load(strcat(subjectsAvailable(subjectNumber).folder, '\', subjectsAvailable(subjectNumber).name))
    
    % Create subject number and case columns
    sub_col = subjectNumber*ones(40,1);
%     case_col = [1*ones(10,1); 2*ones(10,1); 3*ones(10,1); 4*ones(10,1)];
    case_col = ["AB";"AB";"AB";"AB";"AB";"AB";"AB";"AB";"AB";"AB"; 
                "EP";"EP";"EP";"EP";"EP";"EP";"EP";"EP";"EP";"EP";
                "TS";"TS";"TS";"TS";"TS";"TS";"TS";"TS";"TS";"TS";
                "JS";"JS";"JS";"JS";"JS";"JS";"JS";"JS";"JS";"JS";];
    
    % Calculate smoothness and create columns
    CalculateSmoothnessPerIteration    
    % Hand
    s_hand_close = [S_Hand_new_pi(1, :, 1)'; S_Hand_new_pi(1, :, 2)'; S_Hand_new_pi(1, :, 3)'; S_Hand_new_pi(1, :, 4)';];
    s_hand_mid = [S_Hand_new_pi(2, :, 1)'; S_Hand_new_pi(2, :, 2)'; S_Hand_new_pi(2, :, 3)'; S_Hand_new_pi(2, :, 4)';];
    s_hand_far = [S_Hand_new_pi(3, :, 1)'; S_Hand_new_pi(3, :, 2)'; S_Hand_new_pi(3, :, 3)'; S_Hand_new_pi(3, :, 4)';];
    s_hand_high = [S_Hand_new_pi(4, :, 1)'; S_Hand_new_pi(4, :, 2)'; S_Hand_new_pi(4, :, 3)'; S_Hand_new_pi(4, :, 4)';];
    % Joint
    s_joint_close = [S_qSE_new_pi(1, :, 1)'; S_qSE_new_pi(1, :, 2)'; S_qSE_new_pi(1, :, 3)'; S_qSE_new_pi(1, :, 4)';];
    s_joint_mid = [S_qSE_new_pi(2, :, 1)'; S_qSE_new_pi(2, :, 2)'; S_qSE_new_pi(2, :, 3)'; S_qSE_new_pi(2, :, 4)';];
    s_joint_far = [S_qSE_new_pi(3, :, 1)'; S_qSE_new_pi(3, :, 2)'; S_qSE_new_pi(3, :, 3)'; S_qSE_new_pi(3, :, 4)';];
    s_joint_high = [S_qSE_new_pi(4, :, 1)'; S_qSE_new_pi(4, :, 2)'; S_qSE_new_pi(4, :, 3)'; S_qSE_new_pi(4, :, 4)';];
            
    % Displacement columns
    % Shoulder
    d_sh_close = [d_SH(1, :, 1)'; d_SH(1, :, 2)'; d_SH(1, :, 3)'; d_SH(1, :, 4)';];
    d_sh_mid = [d_SH(2, :, 1)'; d_SH(2, :, 2)'; d_SH(2, :, 3)'; d_SH(2, :, 4)';];
    d_sh_far = [d_SH(3, :, 1)'; d_SH(3, :, 2)'; d_SH(3, :, 3)'; d_SH(3, :, 4)';];
    d_sh_high = [d_SH(4, :, 1)'; d_SH(4, :, 2)'; d_SH(4, :, 3)'; d_SH(4, :, 4)';];    
    % C7
    d_c7_close = [d_UB(1, :, 1)'; d_UB(1, :, 2)'; d_UB(1, :, 3)'; d_UB(1, :, 4)';];
    d_c7_mid = [d_UB(2, :, 1)'; d_UB(2, :, 2)'; d_UB(2, :, 3)'; d_UB(2, :, 4)';];
    d_c7_far = [d_UB(3, :, 1)'; d_UB(3, :, 2)'; d_UB(3, :, 3)'; d_UB(3, :, 4)';];
    d_c7_high = [d_UB(4, :, 1)'; d_UB(4, :, 2)'; d_UB(4, :, 3)'; d_UB(4, :, 4)';];
    
    % Variance
    for modalityNumber = 1:4
        for targetNum = 1:4
            hand_var(modalityNumber, targetNum) = norm([mean(xData_std_Hand_new{modalityNumber,targetNum}), mean(yData_std_Hand_new{modalityNumber,targetNum})]);
            joint_var(modalityNumber, targetNum) = norm([mean(gSData_std_new{modalityNumber,targetNum}), mean(qEData_std_new{modalityNumber,targetNum})]);
        end
    end
    
    % Hand path difference
%     CalculateDifferencePerIteration
    h_diff_close = [handPathDiffTotalNorm{1}(subjectNumber, 21:30,1)'; handPathDiffTotalNorm{1}(subjectNumber, 21:30,2)'; handPathDiffTotalNorm{1}(subjectNumber, 21:30,3)'; handPathDiffTotalNorm{1}(subjectNumber, 21:30,4)'];
    h_diff_mid = [handPathDiffTotalNorm{2}(subjectNumber, 21:30,1)'; handPathDiffTotalNorm{2}(subjectNumber, 21:30,2)'; handPathDiffTotalNorm{2}(subjectNumber, 21:30,3)'; handPathDiffTotalNorm{2}(subjectNumber, 21:30,4)'];
    h_diff_far = [handPathDiffTotalNorm{3}(subjectNumber, 21:30,1)'; handPathDiffTotalNorm{3}(subjectNumber, 21:30,2)'; handPathDiffTotalNorm{3}(subjectNumber, 21:30,3)'; handPathDiffTotalNorm{3}(subjectNumber, 21:30,4)'];
    h_diff_high = [handPathDiffTotalNorm{4}(subjectNumber, 21:30,1)'; handPathDiffTotalNorm{4}(subjectNumber, 21:30,2)'; handPathDiffTotalNorm{4}(subjectNumber, 21:30,3)'; handPathDiffTotalNorm{4}(subjectNumber, 21:30,4)'];
    
    % Time
    time_close = [tFinalCat{1}(subjectNumber, 21:30,1)'; tFinalCat{1}(subjectNumber, 21:30,2)'; tFinalCat{1}(subjectNumber, 21:30,3)'; tFinalCat{1}(subjectNumber, 21:30,4)'];
    time_mid = [tFinalCat{2}(subjectNumber, 21:30,1)'; tFinalCat{2}(subjectNumber, 21:30,2)'; tFinalCat{2}(subjectNumber, 21:30,3)'; tFinalCat{2}(subjectNumber, 21:30,4)'];
    time_far = [tFinalCat{3}(subjectNumber, 21:30,1)'; tFinalCat{3}(subjectNumber, 21:30,2)'; tFinalCat{3}(subjectNumber, 21:30,3)'; tFinalCat{3}(subjectNumber, 21:30,4)'];
    time_high = [tFinalCat{4}(subjectNumber, 21:30,1)'; tFinalCat{4}(subjectNumber, 21:30,2)'; tFinalCat{4}(subjectNumber, 21:30,3)'; tFinalCat{4}(subjectNumber, 21:30,4)'];

    % Append to list
    array_d_sh = [array_d_sh; [sub_col, case_col, d_sh_close, d_sh_mid, d_sh_far, d_sh_high]];
    array_d_c7 = [array_d_c7; [sub_col, case_col, d_c7_close, d_c7_mid, d_c7_far, d_c7_high]];
    array_s_hand = [array_s_hand; [sub_col, case_col, s_hand_close, s_hand_mid, s_hand_far, s_hand_high]];
    array_s_joint = [array_s_joint; [sub_col, case_col, s_joint_close, s_joint_mid, s_joint_far, s_joint_high]];
    array_var_hand = [array_var_hand; [subjectNumber; subjectNumber; subjectNumber; subjectNumber], ["AB";"EP";"TS";"JS"], hand_var];
    array_var_joint = [array_var_joint; [subjectNumber; subjectNumber; subjectNumber; subjectNumber], ["AB";"EP";"TS";"JS"], joint_var];
    array_time_full = [array_time_full; [sub_col, case_col, time_close, time_mid, time_far, time_high]];
    array_hdiff_full = [array_hdiff_full; [sub_col, case_col, h_diff_close, h_diff_mid, h_diff_far, h_diff_high]];
end

% Create tables
% Displacement
d_col_names = {'sub_num', 'case_nm', 'd_sh_close', 'd_sh_mid', 'd_sh_far', 'd_sh_high'};
d_sh_table = array2table(array_d_sh, 'VariableNames', d_col_names);
d_col_names = {'sub_num', 'case_nm', 'd_c7_close', 'd_c7_mid', 'd_c7_far', 'd_c7_high'};
d_c7_table = array2table(array_d_c7, 'VariableNames', d_col_names);
% Smoothness
s_h_col_names = {'sub_num', 'case_nm', 's_h_close', 's_h_mid', 's_h_far', 's_h_high'};
s_h_table = array2table(array_s_hand, 'VariableNames', s_h_col_names);
s_j_col_names = {'sub_num', 'case_nm', 's_j_close', 's_j_mid', 's_j_far', 's_j_high'};
s_j_table = array2table(array_s_joint, 'VariableNames', s_j_col_names);
% Variance
v_h_col_names = {'sub_num', 'case_nm', 'v_h_close', 'v_h_mid', 'v_h_far', 'v_h_high'};
v_h_table = array2table(array_var_hand, 'VariableNames', v_h_col_names);
v_j_col_names = {'sub_num', 'case_nm', 'v_j_close', 'v_j_mid', 'v_j_far', 'v_j_high'};
v_j_table = array2table(array_var_joint, 'VariableNames', v_j_col_names);
% Hand diff
h_diff_col_names = {'sub_num', 'case_nm', 'h_diff_close', 'h_diff_mid', 'h_diff_far', 'h_diff_high'};
h_diff_full_table = array2table(array_hdiff_full, 'VariableNames', h_diff_col_names);
% Variance
time_col_names = {'sub_num', 'case_nm', 'time_close', 'time_mid', 'time_far', 'time_high'};
time_full_table = array2table(array_time_full, 'VariableNames', time_col_names);

% Slopes and intercepts
target_col = ["Close";"Mid";"Far";"High"];
% Hand diff
hdiff_col_names = {'target','ep_slope','ts_slope','js_slope','ep_inter','ts_inter','js_inter'};
array_hdiff = [target_col, slope_hdiff(:,2:4), inter_hdiff(:,2:4)];
hdiff_table = array2table(array_hdiff, 'VariableNames', hdiff_col_names);
% Time diff
time_col_names = {'target','ab_slope','ep_slope','ts_slope','js_slope','ab_inter','ep_inter','ts_inter','js_inter'};
array_time = [target_col, slope_time, inter_time];
time_table = array2table(array_time, 'VariableNames', time_col_names);

% Save tables
% Displacement
writetable(d_sh_table,'d_sh_table.csv','Delimiter',',')
writetable(d_c7_table,'d_c7_table.csv','Delimiter',',')
% Smoothness
writetable(s_h_table,'s_h_table.csv','Delimiter',',')
writetable(s_j_table,'s_j_table.csv','Delimiter',',')
% Variance
writetable(v_h_table,'v_h_table.csv','Delimiter',',')
writetable(v_j_table,'v_j_table.csv','Delimiter',',')
% S and I
writetable(hdiff_table,'hdiff_table.csv','Delimiter',',')
writetable(time_table,'time_table.csv','Delimiter',',')
% S and I Full
writetable(h_diff_full_table,'hdiff_full_table.csv','Delimiter',',')
writetable(time_full_table,'time_full_table.csv','Delimiter',',')