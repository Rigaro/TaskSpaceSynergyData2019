modalitiesModified = {'Able', 'EMG', 'Task', 'Joint'};
targetNames = {'Close', 'Mid', 'Far', 'High'};
for modalityNumber = 1:length(modalitiesModified)   
    %
    % Loop through all experiment iterations
    % 
    for i=1:maxIterations
        
        %
        % Plot angular velocities
        %
        % Upper arm
        figure(1)
        hold on
        subplot(length(modalitiesModified), targetNum, targetNum*(modalityNumber-1) + loc(modalityNumber, i) + 1);
        plot(t{modalityNumber, i}, aDotUA{modalityNumber, i}, "b");
        plot(t{modalityNumber, i}, bDotUA{modalityNumber, i}, "r");
        plot(t{modalityNumber, i}, gDotUA{modalityNumber, i}, "g");
        title("Upper arm angular velocity. Modality: " + modalitiesModified(modalityNumber) + ". Target: " + targetNames(loc(modalityNumber, i) + 1));
        xlabel('Time (s)');
        ylabel('Angular velocity (rad/s)');
        grid on
        % Shoulder
        figure(2)
        hold on
        subplot(length(modalitiesModified), targetNum, targetNum*(modalityNumber-1) + loc(modalityNumber, i) + 1);
        plot(t{modalityNumber, i}, aDotSH{modalityNumber, i}, "b");
        plot(t{modalityNumber, i}, bDotSH{modalityNumber, i}, "r");
        plot(t{modalityNumber, i}, gDotSH{modalityNumber, i}, "g");
        title("Shoulder angular velocity. Modality: " + modalitiesModified(modalityNumber) + ". Target: " + targetNames(loc(modalityNumber, i) + 1));
        xlabel('Time (s)');
        ylabel('Angular velocity (rad/s)');
        grid on
        % Upper body
        figure(3)
        hold on
        subplot(length(modalitiesModified), targetNum, targetNum*(modalityNumber-1) + loc(modalityNumber, i) + 1);
        plot(t{modalityNumber, i}, aDotUB{modalityNumber, i}, "b");
        plot(t{modalityNumber, i}, bDotUB{modalityNumber, i}, "r");
        plot(t{modalityNumber, i}, gDotUB{modalityNumber, i}, "g");
        title("Upper body angular velocity. Modality: " + modalitiesModified(modalityNumber) + ". Target: " + targetNames(loc(modalityNumber, i) + 1));
        xlabel('Time (s)');
        ylabel('Angular velocity (rad/s)');
        grid on
        % Elbow
        figure(4)
        hold on
        subplot(length(modalitiesModified), targetNum, targetNum*(modalityNumber-1) + loc(modalityNumber, i) + 1);
        plot(t{modalityNumber, i}, qDotE{modalityNumber, i}, "b");
        title("Elbow angular velocity. Modality: " + modalitiesModified(modalityNumber) + ". Target: " + targetNames(loc(modalityNumber, i) + 1));
        xlabel('Time (s)');
        ylabel('Angular velocity (rad/s)');
        grid on
        
        
        %
        % Plot angular displacements
        %
        % Upper arm
        figure(5)
        hold on
        subplot(length(modalitiesModified), targetNum, targetNum*(modalityNumber-1) + loc(modalityNumber, i) + 1);
        plot(t{modalityNumber, i}, aUA{modalityNumber, i}, "b");
        plot(t{modalityNumber, i}, bUA{modalityNumber, i}, "r");
        plot(t{modalityNumber, i}, gUA{modalityNumber, i}, "g");
        title("Upper arm angular displacement. Modality: " + modalitiesModified(modalityNumber) + ". Target: " + targetNames(loc(modalityNumber, i) + 1));
        xlabel('Time (s)');
        ylabel('Angle (rad)');
        grid on
        % Shoulder
        figure(6)
        hold on
        subplot(length(modalitiesModified), targetNum, targetNum*(modalityNumber-1) + loc(modalityNumber, i) + 1);
        plot(t{modalityNumber, i}, aSH{modalityNumber, i}, "b");
        plot(t{modalityNumber, i}, bSH{modalityNumber, i}, "r");
        plot(t{modalityNumber, i}, gSH{modalityNumber, i}, "g");
        title("Shoulder angular displacement. Modality: " + modalitiesModified(modalityNumber) + ". Target: " + targetNames(loc(modalityNumber, i) + 1));
        xlabel('Time (s)');
        ylabel('Angle (rad)');
        grid on
        % Upper body
        figure(7)
        hold on
        subplot(length(modalitiesModified), targetNum, targetNum*(modalityNumber-1) + loc(modalityNumber, i) + 1);
        plot(t{modalityNumber, i}, aUB{modalityNumber, i}, "b");
        plot(t{modalityNumber, i}, bUB{modalityNumber, i}, "r");
        plot(t{modalityNumber, i}, gUB{modalityNumber, i}, "g");
        title("Upper body angular displacement. Modality: " + modalitiesModified(modalityNumber) + ". Target: " + targetNames(loc(modalityNumber, i) + 1));
        xlabel('Time (s)');
        ylabel('Angle (rad)');
        grid on
        % Elbow
        figure(8)
        hold on
        subplot(length(modalitiesModified), targetNum, targetNum*(modalityNumber-1) + loc(modalityNumber, i) + 1);
        plot(t{modalityNumber, i}, qE{modalityNumber, i}, "b");
        title("Elbow angular displacement. Modality: " + modalitiesModified(modalityNumber) + ". Target: " + targetNames(loc(modalityNumber, i) + 1));
        xlabel('Time (s)');
        ylabel('Angle (rad)');
        ylim([-2 0]);
        grid on
        
        
        %
        % Plot displacements
        %
        % Upper arm
        figure(9)
        hold on
        subplot(length(modalitiesModified), targetNum, targetNum*(modalityNumber-1) + loc(modalityNumber, i) + 1);
        plot(t{modalityNumber, i}, xUA{modalityNumber, i}, "b");
        plot(t{modalityNumber, i}, yUA{modalityNumber, i}, "r");
        plot(t{modalityNumber, i}, zUA{modalityNumber, i}, "g");
        title("Upper arm displacement. Modality: " + modalitiesModified(modalityNumber) + ". Target: " + targetNames(loc(modalityNumber, i) + 1));
        xlabel('Time (s)');
        ylabel('Displacement (m)');
        grid on
        % Shoulder
        figure(10)
        hold on
        subplot(length(modalitiesModified), targetNum, targetNum*(modalityNumber-1) + loc(modalityNumber, i) + 1);
        plot(t{modalityNumber, i}, xSH{modalityNumber, i}, "b");
        plot(t{modalityNumber, i}, ySH{modalityNumber, i}, "r");
        plot(t{modalityNumber, i}, zSH{modalityNumber, i}, "g");
        title("Shoulder displacement. Modality: " + modalitiesModified(modalityNumber) + ". Target: " + targetNames(loc(modalityNumber, i) + 1));
        xlabel('Time (s)');
        ylabel('Displacement (m)');
        grid on
        % Upper body
        figure(11)
        hold on
        subplot(length(modalitiesModified), targetNum, targetNum*(modalityNumber-1) + loc(modalityNumber, i) + 1);
        plot(t{modalityNumber, i}, xUB{modalityNumber, i}, "b");
        plot(t{modalityNumber, i}, yUB{modalityNumber, i}, "r");
        plot(t{modalityNumber, i}, zUB{modalityNumber, i}, "g");
        title("Upper body displacement. Modality: " + modalitiesModified(modalityNumber) + ". Target: " + targetNames(loc(modalityNumber, i) + 1));
        xlabel('Time (s)');
        ylabel('Displacement (m)');
        grid on
        
        %
        % Plot hand path 3D
        %
        figure(12)
        hold on
        if (loc(modalityNumber, i) == 0)
            colour = 'k';
        elseif (loc(modalityNumber, i) == 1)
            colour = 'b';
        elseif (loc(modalityNumber, i) == 2)
            colour = 'r';
        elseif (loc(modalityNumber, i) == 3)
            colour = 'g';
        elseif (loc(modalityNumber, i) == 4)
            colour = 'y';
        elseif (loc(modalityNumber, i) == 5)
            colour = 'm';
        elseif (loc(modalityNumber, i) == 6)
            colour = 'c';
        elseif (loc(modalityNumber, i) == 7)
            colour = [0.87 0.49 0];
        end
        subplot(length(modalitiesModified), targetNum, targetNum*(modalityNumber-1) + loc(modalityNumber, i) + 1);
        plot3(xHand{modalityNumber, i}, zHand{modalityNumber, i}, yHand{modalityNumber, i},'Color', colour);
        title("Hand trajectory. Modality: " + modalitiesModified(modalityNumber) + ". Target: " + targetNames(loc(modalityNumber, i) + 1));
%         xlabel('x');
%         xlim([0.5 1.2])
%         ylabel('z');
%         ylim([-0.6 0.2])
%         zlabel('y');
%         zlim([1 2])
        grid on
        
        % Plot x,y,z hand path
        figure(13)
        hold on
        subplot(length(modalitiesModified), targetNum, targetNum*(modalityNumber-1) + loc(modalityNumber, i) + 1);
        plot(t{modalityNumber, i}, xHand{modalityNumber, i}, "b");
        plot(t{modalityNumber, i}, yHand{modalityNumber, i}, "r");
        plot(t{modalityNumber, i}, zHand{modalityNumber, i}, "g");
        title("Hand displacement. Modality: " + modalitiesModified(modalityNumber) + ". Target: " + targetNames(loc(modalityNumber, i) + 1));
        xlabel('Time (s)');
        ylabel('Displacement (m)');
        grid on           
     
        %
        % Plot synergy value for Jacobian case
        %
        if (modalityNumber == 3 && length(synergy{i}) > 1)       
            figure(14)
            hold on
            plot(synergy{i}(synergy{i}~=0),'k');
        end  
    end  
end