%%
%
% Hand path difference
%
modalitiesModified = {'Able', 'EMG', 'Task', 'Joint'};
targetNames = {'Close', 'Mid', 'Far', 'High'};
markerColours = {'k', 'b', 'r', 'g'};
markers = {'o', 'o', 'o', 'o'};
% Calculate mean/median and plot
for currentTarget = 1:4
        for modalityNumber = 2:4
            handPathDiffTotalNormMean{currentTarget}(modalityNumber,:) = mean(handPathDiffTotalNorm{currentTarget}(:, :, modalityNumber),1);
            handPathDiffTotalNormMedian{currentTarget}(modalityNumber,:) = median(handPathDiffTotalNorm{currentTarget}(:, :, modalityNumber),1);
            figure(1)
%             figure(currentTarget)
            subplot(2,2,currentTarget)
            hold on
            plot(handPathDiffTotalNormMedian{currentTarget}(modalityNumber,:), markers{currentTarget},...
                 'MarkerFaceColor', markerColours{modalityNumber},...
                 'MarkerEdgeColor', markerColours{modalityNumber},...
                 'MarkerSize', 16);
            grid on;
            box on;
            xlim([0 31]);
            ylim([0 150]);
            xlabel('iteration');
            ylabel('Cumulative difference from AB path');
            title("Target: " + targetNames(currentTarget));
            set(gca,'FontSize',30);
        end
end

%%
% target = 1;
for target=1:4
    % modality = 4;
    for modality=2:4
        lineColours = {'k', [0, 0, 100/255], [100/255, 0, 0], [0, 100/255, 0]};
        markers = {'o', 'o', 'o', 'o'};

        % Only means
%         x = 21:30;
%         x = 1:10;
        x = 1:30;
%         x = [1:10, 21:30];
        % y = handPathDiffTotalNormMean{target}(modality,21:30)
%         y = handPathDiffTotalNormMean{target}(modality,21:30);
        y = handPathDiffTotalNormMedian{target}(modality,x);
        p_d_1 = polyfit(x,y,1);
        p_d_2 = polyfit(x,y,2);
        p_d_3 = polyfit(x,y,3);
        p_d_4 = polyfit(x,y,4);
        slope_hdiff(target,modality) = p_d_1(1);
        inter_hdiff(target,modality) = p_d_1(2);
        grad_hdiff(target,modality,1) = (2*p_d_2(1)*1)+p_d_2(2);
        grad_hdiff(target,modality,2) = (2*p_d_2(1)*30)+p_d_2(2);
%         figure(target)
        figure(1)
        subplot(2,2,target)
        hold on
        x = 1:30;
%         plot(x,p_d_1(1)*x+p_d_1(2),...
%                          'Color', lineColours{modality}, 'LineWidth', 10);
        plot(x,p_d_2(1)*(x.^2)+p_d_2(2)*x+p_d_2(3),...
                         'Color', lineColours{modality}, 'LineWidth', 10);
%         plot(x,p_d_3(1)*(x.^3)+p_d_3(2)*(x.^2)+p_d_3(3)*x+p_d_3(4),...
%                          'Color', lineColours{modality}, 'LineWidth', 10);
%         plot(x,p_d_4(1)*(x.^4)+p_d_4(2)*(x.^3)+p_d_4(3)*(x.^2)+p_d_4(4)*x+p_d_4(5),...
%                          'Color', lineColours{modality}, 'LineWidth', 10);
%         plot(x,y, markers{currentTarget},...
%                          'MarkerFaceColor', markerColours{modality},...
%                          'MarkerEdgeColor', markerColours{modality},...
%                          'MarkerSize', 8);
%         ylim([0,150])

%         %% All subject data
%         %
%         x = 21:30;
%         x_base = 21:30;
%         for i=2:15
%             x = [x, x_base];
%         end
%         % handPathDiffTotalNorm{target}(subject, 21:30,modality)
%         y = handPathDiffTotalNorm{target}(1, 21:30, modality);
%         % y_m = handPathDiffTotalNorm{2}(1, 21:30, modality);
%         % y_f = handPathDiffTotalNorm{3}(1, 21:30, modality);
%         % y_h = handPathDiffTotalNorm{4}(1, 21:30, modality);
%         for s=2:15
%             y = [y, handPathDiffTotalNorm{target}(s, 21:30, modality)];
%         %     y_m = [y_m, handPathDiffTotalNorm{2}(s, 21:30, modality)];
%         %     y_f = [y_f, handPathDiffTotalNorm{3}(s, 21:30, modality)];
%         %     y_h = [y_h, handPathDiffTotalNorm{4}(s, 21:30, modality)];
%         end
%         % % y = handPathDiffTotalNormMean{1}(2,21:30);
%         p = polyfit(x,y,1)
%         figure(target)
%         hold on
%         plot(x,p(1)*x+p(2),...
%                          'Color', markerColours{modality});
%         plot(x,y, markers{currentTarget},...
%                          'MarkerFaceColor', markerColours{modality},...
%                          'MarkerEdgeColor', markerColours{modality},...
%                          'MarkerSize', 8);
%         ylim([0,150])
    end
end

%%
%
% Completion time
%
for currentTarget = 1:4
        for modalityNumber = 1:4
            tFinalMean{currentTarget}(modalityNumber,:) = mean(tFinalCat{currentTarget}(:, :, modalityNumber),1);
            tFinalMedian{currentTarget}(modalityNumber,:) = median(tFinalCat{currentTarget}(:, :, modalityNumber),1);
%             figure(10+currentTarget)
            figure(2)
            subplot(2,2,currentTarget)
            hold on
            plot(tFinalMedian{currentTarget}(modalityNumber,:), markers{currentTarget},...
                 'MarkerFaceColor', markerColours{modalityNumber},...
                 'MarkerEdgeColor', markerColours{modalityNumber},...
                 'MarkerSize', 16);
            grid on;
            box on;
            xlim([0 31]);
            ylim([0 7]);
            xlabel('iteration');
            ylabel('Completion time (s)');
            title("Target: " + targetNames(currentTarget));
            set(gca,'FontSize',30);
        end
end

%%
% target = 1;
for target=1:4
    % modality = 4;
    for modality=1:4
        lineColours = {[0.5, 0.5, 0.5], [0, 0, 100/255], [100/255, 0, 0], [0, 100/255, 0]};
        markers = {'o', 'o', 'o', 'o'};

        % Only means
%         x = 21:30;
%         x = 1:10;
%         x = 1:30;
        x = [1:10, 21:30];
        % y = handPathDiffTotalNormMean{target}(modality,21:30)
%         y = tFinalMean{target}(modality,1:10);
        y = tFinalMedian{target}(modality,x);
        p_t_1 = polyfit(x,y,1);
        p_t_2 = polyfit(x,y,2);
        p_t_3 = polyfit(x,y,3);
        p_t_4 = polyfit(x,y,4);
        slope_time(target,modality) = p_t_1(1);
        inter_time(target,modality) = p_t_1(2);
        grad_time(target,modality,1) = (2*p_t_2(1)*1)+p_t_2(2);
        grad_time(target,modality,2) = (2*p_t_2(1)*30)+p_t_2(2);
        zero_grad(target,modality) = -p_t_2(2)/(2*p_t_2(1));
%         figure(10+target)
        figure(2)
        subplot(2,2,target)
        hold on
        x = 1:30;
        plot(x,p_t_1(1)*x+p_t_1(2),...
                         'Color', lineColours{modality}, 'LineWidth', 10);
%         plot(x,p_t_2(1)*(x.^2)+p_t_2(2)*x+p_t_2(3),...
%                          'Color', lineColours{modality}, 'LineWidth', 10);
%         plot(x,p_t_3(1)*(x.^3)+p_t_3(2)*(x.^2)+p_t_3(3)*x+p_t_3(4),...
%                          'Color', lineColours{modality}, 'LineWidth', 10);
%         plot(x,p_t_4(1)*(x.^4)+p_t_4(2)*(x.^3)+p_t_4(3)*(x.^2)+p_t_4(4)*x+p_t_4(5),...
%                          'Color', lineColours{modality}, 'LineWidth', 10);
    end
end