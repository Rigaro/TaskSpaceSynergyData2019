%
clear all
modalities = {'Able', 'EMG', 'Jac', 'Lin'};
colours = {[0.8 0.8 0.8], 'b', 'r', 'g'};
targetNum = 4;
%
sessionNumber = 3;
%
% Get all available subject info
subjectsAvailable = dir(strcat('...\Processed\Data_s', num2str(sessionNumber) , '\*.mat'));

%
% Populate data matrices
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    % copy data matrices
    population_median_t_data(:, :, subjectNumber) = median_t;
    population_median_d_UA_data(:, :, subjectNumber) = median_d_UA;
    population_median_d_SH_data(:, :, subjectNumber) = median_d_SH;
    population_median_d_UB_data(:, :, subjectNumber) = median_d_UB;
    population_median_pa_data(:, :, subjectNumber) = median_pa;
    population_median_S_xHand_data(:, :, subjectNumber) = median_S_xHand;
end

clearvars -except subjectsAvailable modalities colours targetNum population_median_t_data population_median_d_UA_data ...
           population_median_d_SH_data population_median_d_UB_data population_median_pa_data population_median_S_xHand_data

%      
% Calculate statistical data
%
population_median_t = median(population_median_t_data, 3);
population_median_d_UA = median(population_median_d_UA_data, 3);
population_median_d_SH = median(population_median_d_SH_data, 3);
population_median_d_UB = median(population_median_d_UB_data, 3);
population_median_pa = median(population_median_pa_data, 3);
population_median_S_xHand = median(population_median_S_xHand_data, 3);

% Quantiles
population_quant_t = quantile(population_median_t_data, [0.25 0.75],3);
population_quant_d_UA = quantile(population_median_d_UA_data, [0.25 0.75],3);
population_quant_d_SH = quantile(population_median_d_SH_data, [0.25 0.75],3);
population_quant_d_UB = quantile(population_median_d_UB_data, [0.25 0.75],3);
population_quant_pa = quantile(population_median_pa_data, [0.25 0.75],3);
population_quant_S_xHand = quantile(population_median_S_xHand_data, [0.25 0.75],3);

%
% Plot
%
for modalityNumber = 1:length(modalities)  
    
    % Plot data
    x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
    % Time data
    figure(41)
    hold on
    p1{modalityNumber} = bar(x, population_median_t(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
    for target = 1:targetNum
        plot([x(target) x(target)], [population_quant_t(modalityNumber, target, 1), population_quant_t(modalityNumber, target, 2)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    xlabel("Target");
    ylabel("Time");
    title("Population Median & Quartiles: Task time");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
    
    % Upper arm data
    figure(42)
    hold on
    p2{modalityNumber} = bar(x, population_median_d_UA(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
    for target = 1:targetNum
        plot([x(target) x(target)], [population_quant_d_UA(modalityNumber, target, 1), population_quant_d_UA(modalityNumber, target, 2)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    xlabel("Target");
    ylabel("Distance");
    title("Population Median & Quartiles: Upper Arm Displacement");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
    
    % Shoulder data
    figure(43)
    hold on
    x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
    p3{modalityNumber} = bar(x, population_median_d_SH(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
    for target = 1:targetNum
        plot([x(target) x(target)], [population_quant_d_SH(modalityNumber, target, 1), population_quant_d_SH(modalityNumber, target, 2)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    xlabel("Target");
    ylabel("Distance");
    title("Population Median & Quartiles: Shoulder Displacement");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
    
    % Upper body data
    figure(44)
    hold on
    x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
    p4{modalityNumber} = bar(x, population_median_d_UB(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
    for target = 1:targetNum
        plot([x(target) x(target)], [population_quant_d_UB(modalityNumber, target, 1), population_quant_d_UB(modalityNumber, target, 2)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    xlabel("Target");
    ylabel("Distance");
    title("Population Median & Quartiles: Upper Body Displacement");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
    
    if (modalityNumber > 1)
        % Prosthesis activation data
        figure(45)
        hold on
        x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
        p5{modalityNumber} = bar(x, population_median_pa(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
        for target = 1:targetNum
            plot([x(target) x(target)], [population_quant_pa(modalityNumber, target, 1), population_quant_pa(modalityNumber, target, 2)]...
                  ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
        end
        % Figure config
        xlabel("Target");
        ylabel("% of reach time");
        title("Population Median & Quartiles: Prosthesis Utilization");
        xlim([0 5]);
        xticks([0 1 2 3 4 5]);
        xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
    end    
    
    % Hand smoothness
    figure(46)
    hold on
    x =  [0.7, 1.7, 2.7, 3.7] + (0.2*(modalityNumber - 1));
    p6{modalityNumber} = bar(x, population_median_S_xHand(modalityNumber,:), 0.2, 'FaceColor', colours{modalityNumber});
    for target = 1:targetNum
        plot([x(target) x(target)], [population_quant_S_xHand(modalityNumber, target, 1), population_quant_S_xHand(modalityNumber, target, 2)]...
              ,'Color', 'k', 'LineStyle', '-', 'LineWidth', 1, 'Marker', '+', 'MarkerSize', 10);
    end
    % Figure config
    xlabel("Target");
    ylabel("Smoothness");
    title("Population Median & Quartiles: Hand Smoothness");
    xlim([0 5]);
    xticks([0 1 2 3 4 5]);
    xticklabels({'', 'Close', 'Mid', 'Far', 'High', ''});
end

figure(41)
legend([p1{1} p1{2} p1{3} p1{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
figure(42)
legend([p2{1} p2{2} p2{3} p2{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
figure(43)
legend([p3{1} p3{2} p3{3} p3{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
figure(44)
legend([p4{1} p4{2} p4{3} p4{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
figure(45)
legend([p5{2} p5{3} p5{4}],{'EMG','Task-space Synergy','Joint-space Synergy'});
figure(46)
legend([p6{1} p6{2} p6{3} p6{4}],{'Able-bodied','EMG','Task-space Synergy','Joint-space Synergy'});
clear p1 p2 p3 p4 p5 p6