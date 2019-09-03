% clear all
%
%
rootFolder = '...\Raw\';
%
%
% Read subject data
subjectData = jsondecode(fileread(strcat(rootFolder, subjectID, '\userInfo.json')));

%
% Read experiment data
modalitiesModified = {'Able', 'EMG', 'Task', 'Joint'};
modalities = {'Able', 'EMG', 'Jac', 'Lin'};
% sessionNumber = 1;
targetNum = 4;
%
targetIteration = ones(targetNum);
%
for modalityNumber = 1:length(modalitiesModified)
    % Get the number of files in directory to determine iterations
    filesInFolder = dir(strcat(rootFolder, subjectID, '\Data\', modalities{modalityNumber}, '\Motion\session_', num2str(sessionNumber) , '\*.csv'));
    maxIterations = size(filesInFolder,1);
    modalityIteration = 1;
    %
    % Process all files with data
    %
    for i=1:maxIterations
        % Read files
       eval(strcat('i', num2str(i), '= readtable("', rootFolder, subjectID, '\Jacobian\', modalities{modalityNumber}, '\Motion\session_', num2str(sessionNumber) , '\i_', num2str(i), '.csv","ReadVariableNames",true);'));

       % Organize data in cell arrays
       eval(strcat('loc(', num2str(modalityNumber), ',i) = i', num2str(i), '.loc(1);'));
       eval(strcat('t{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.t;'));
       eval(strcat('aDotUA{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.aDotUA;'));
       eval(strcat('bDotUA{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.bDotUA;'));
       eval(strcat('gDotUA{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.gDotUA;'));
       eval(strcat('aUA{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.aUA;'));
       eval(strcat('bUA{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.bUA;'));
       eval(strcat('gUA{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.gUA;'));
       eval(strcat('xUA{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.xUA;'));
       eval(strcat('yUA{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.yUA;'));
       eval(strcat('zUA{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.zUA;'));
       eval(strcat('aDotSH{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.aDotSH;'));
       eval(strcat('bDotSH{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.bDotSH;'));
       eval(strcat('gDotSH{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.gDotSH;'));
       eval(strcat('aSH{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.aSH;'));
       eval(strcat('bSH{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.bSH;'));
       eval(strcat('gSH{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.gSH;'));
       eval(strcat('xSH{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.xSH;'));
       eval(strcat('ySH{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.ySH;'));
       eval(strcat('zSH{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.zSH;'));
       eval(strcat('aDotUB{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.aDotUB;'));
       eval(strcat('bDotUB{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.bDotUB;'));
       eval(strcat('gDotUB{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.gDotUB;'));
       eval(strcat('aUB{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.aUB;'));
       eval(strcat('bUB{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.bUB;'));
       eval(strcat('gUB{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.gUB;'));
       eval(strcat('xUB{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.xUB;'));
       eval(strcat('yUB{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.yUB;'));
       eval(strcat('zUB{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.zUB;'));
       eval(strcat('xHand{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.xHand;'));
       eval(strcat('yHand{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.yHand;'));
       eval(strcat('zHand{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.zHand;'));
       eval(strcat('aHand{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.aHand;'));
       eval(strcat('bHand{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.bHand;'));
       eval(strcat('gHand{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.gHand;'));
       if (modalityNumber > 1)
        eval(strcat('enable{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.enable;'));
       end
       
           % Fix displacements
       for k = 1:length(t{modalityNumber,i})
           % Upper arm
           if (aUA{modalityNumber, i}(k) > 0)
               aUA{modalityNumber, i}(k) = aUA{modalityNumber, i}(k) - 2*pi;
           end
           if (bUA{modalityNumber, i}(k) > 0)
               bUA{modalityNumber, i}(k) = bUA{modalityNumber, i}(k) - 2*pi;
           end
           if (gUA{modalityNumber, i}(k) > 0)
               gUA{modalityNumber, i}(k) = gUA{modalityNumber, i}(k) - 2*pi;
           end
           % Shoulder           
           if (bSH{modalityNumber, i}(k) < 0)
               bSH{modalityNumber, i}(k) = bSH{modalityNumber, i}(k) + 2*pi;
           end       
           if (bSH{modalityNumber, i}(k) > 6)
               bSH{modalityNumber, i}(k) = bSH{modalityNumber, i}(k) - 2*pi;
           end
           % Upper body           
           if (bUB{modalityNumber, i}(k) < -4)
               bUB{modalityNumber, i}(k) = bUB{modalityNumber, i}(k) + 2*pi;
           end
           gUA{modalityNumber, i}(k) = gUA{modalityNumber, i}(k) + pi/2;
       end
       
       % Calculate elbow after fixes
       if (modalityNumber == 1)
        eval(strcat('qE{', num2str(modalityNumber), ',', num2str(i), '} = -i', num2str(i), '.gE + (gUA{modalityNumber, i} + pi/2);'));
        eval(strcat('qDotE{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.gDotE - i', num2str(i), '.gDotUA;'));
       else
        eval(strcat('qE{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.qE;'));
        eval(strcat('qDotE{', num2str(modalityNumber), ',', num2str(i), '} = i', num2str(i), '.qDotE;'));
       end
       
       % Calculate Jacobian synergy
       if (modalityNumber == 3)
           prevActivation = string(enable{modalityNumber,i}(1));
           alpha = 0;
           synergy{modalityIteration}(1) = 0;
           for k = 2:length(t{modalityNumber,i})
              % Enable and configure synergy when set enable
              isEnable = string(enable{modalityNumber,i}(k));
              if (prevActivation == "False" && isEnable == "True")
                  alpha = SetDirectionOfMotionFrameOffset(gUA{modalityNumber,i}(k), qE{modalityNumber,i}(k), subjectData.upperArmLength, subjectData.forearmLength + (subjectData.handLength/2));
              end
              % Calculate synergy when avaialable
              if (prevActivation == "True" && isEnable == "True")
                  synergy{modalityIteration}(k) = ComputeJacobianSynergy(gUA{modalityNumber,i}(k), qE{modalityNumber,i}(k), alpha, subjectData.upperArmLength, subjectData.forearmLength + (subjectData.handLength/2));
              end
              prevActivation = string(enable{modalityNumber,i}(k));
           end         
       end
       
       % Calculate velocity profiles
       for k = 2:length(t{modalityNumber,i})
           % Hand
           xDotHand{modalityNumber, i}(k) = xHand{modalityNumber, i}(k) - xHand{modalityNumber, i}(k - 1) / t{modalityNumber, i}(2);
           yDotHand{modalityNumber, i}(k) = yHand{modalityNumber, i}(k) - yHand{modalityNumber, i}(k - 1) / t{modalityNumber, i}(2);
           zDotHand{modalityNumber, i}(k) = zHand{modalityNumber, i}(k) - zHand{modalityNumber, i}(k - 1) / t{modalityNumber, i}(2);
           % Upper arm
           xDotUA{modalityNumber, i}(k) = xUA{modalityNumber, i}(k) - xUA{modalityNumber, i}(k - 1) / t{modalityNumber, i}(2);
           yDotUA{modalityNumber, i}(k) = yUA{modalityNumber, i}(k) - yUA{modalityNumber, i}(k - 1) / t{modalityNumber, i}(2);
           zDotUA{modalityNumber, i}(k) = zUA{modalityNumber, i}(k) - zUA{modalityNumber, i}(k - 1) / t{modalityNumber, i}(2);
           % Shoulder
           xDotSH{modalityNumber, i}(k) = xSH{modalityNumber, i}(k) - xSH{modalityNumber, i}(k - 1) / t{modalityNumber, i}(2);
           yDotSH{modalityNumber, i}(k) = ySH{modalityNumber, i}(k) - ySH{modalityNumber, i}(k - 1) / t{modalityNumber, i}(2);
           zDotSH{modalityNumber, i}(k) = zSH{modalityNumber, i}(k) - zSH{modalityNumber, i}(k - 1) / t{modalityNumber, i}(2);
           % Upper arm
           xDotUB{modalityNumber, i}(k) = xUB{modalityNumber, i}(k) - xUB{modalityNumber, i}(k - 1) / t{modalityNumber, i}(2);
           yDotUB{modalityNumber, i}(k) = yUB{modalityNumber, i}(k) - yUB{modalityNumber, i}(k - 1) / t{modalityNumber, i}(2);
           zDotUB{modalityNumber, i}(k) = zUB{modalityNumber, i}(k) - zUB{modalityNumber, i}(k - 1) / t{modalityNumber, i}(2);
       end
       
       modalityIteration = modalityIteration + 1;

       % Clear the iteration's table
       eval(strcat('clear i', num2str(i), ';'));       
   end
end
save(strcat(subjectID,'.mat'));