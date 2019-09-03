% 
% Calculate subject statistics
%
clear all
%
% Get all available subject info
subjectsAvailable = dir(strcat('...\Processed\Data' , '\*.mat'));
%
for subjectNumber = 1:length(subjectsAvailable)
    % Load subject
    load(subjectsAvailable(subjectNumber).name)
    age(subjectNumber) = 2019 - subjectData.yearOfBirth;
end

median(age)
max(age)
min(age)