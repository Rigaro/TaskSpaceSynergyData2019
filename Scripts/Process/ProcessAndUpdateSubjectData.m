%
clear all
modalities = {'Able', 'EMG', 'Jac', 'Lin'};
targetNum = 4;
sessionNumber = 3;
%
% Data directory
dataDir = strcat('...\Processed\Data_s', num2str(sessionNumber), '\');
% Get all available subject info
subjectsAvailable = dir(strcat(dataDir, '\*.mat'));

for subjectNumber = 1:length(subjectsAvailable)
    subjectID = subjectsAvailable(subjectNumber).name(1:6);
    LoadSubjectData
    CalculateStatisticalData
    CalculateMotionStatisticalData
    CalculateNormalizedData
    NormalizePaths
    AnalyseNormalisedPaths
    CalculateNormalisedPathDifferences
    CalculateMeanPathSmoothness
    CalculateSEMeanRelationship
    CalculateMeanQSESmoothness
    CalculateAccuracy
    CalculateJointPathDifferences
    save(strcat(dataDir , subjectsAvailable(subjectNumber).name))
end