%{
Name of the script: project_105785820_p1.m (Main Component Analysis with PCA)
    
Descpription: This script reads the table given in covid_countries.csv and
calculates the principal component analysis (PCA) using a function using
its eigenvectors and normalized matrix. Plot the data in a biplot to
visualize the data
Method: Read the data, solicit the data that contain numbers and compute
the PCA(eigenvector and normalized matrix) from function myPCA.m. Do biplot
to interpret a visualization of the data. 

Name: Adrian Loekman (aloekman@g.ucla.edu) 
UID: 105785820

%}
%% Front Matter
% Clears all recent codes in command window and workspace
clear all; close all; clc;

% fetch data from the file covid_countries.csv
data = readtable('covid_countries.csv','VariableNamingRule','preserve');

% get the data from the 3rd column to the last column (6th column)
dataDuct = table2array(data(:,3:end));

% Call function myPCA to get coeffOrth and pcaData from the main data
[coeffOrth,pcaData] = myPCA(dataDuct);

% fetch variable names (names on top of each column) 
vbls = data.Properties.VariableNames;

% Call the 4 last variables 
vbls = vbls(3:end);

% Project onto 2D space by two largest eigenvectors
pcaData2D = pcaData(:,1:2); % 2 first columns of pcaData
E2D = coeffOrth(:,1:2); % 2 first columns of two largest eigenvectors

% use biplot to plot the results
bip = biplot(E2D,'Scores',pcaData2D,'Varlabels',vbls);

