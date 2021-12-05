% Name: Adrian Loekman (aloekman@g.ucla.edu) 
% UID: 105785820
function [coeffOrth,pcaData] = myPCA(data)
% [coeffOrth,pcaData] = myPCA(data)
%
% myPCA analyzes the principal components of given COVID-19 statistical ...
%   data from multiple countries - covid_countries.csv
%
% Inputs:
%   data: A nxp matrix representing only the numerical parts of ...
%           the dataset
%
% Outputs:
% coeffOrth: a pxp matrix whose columns are the eigenvectors ...
%               corresponding to the sorted eigenvalues
% pcaData: a nxp matrix representing the data projected onto ...
%               the principal components

[m,n] = size(data); % find the row and column of the data
dataMean = myMean(data); % calculates the mean of the data using function myMean.m
dataStd = myStd(data); % calculate the standard deviation of the data
dataNorm = zeros(m,n); %initialize a new data for the normalized data

% Time marching loop
for i = 1:n
    for j = 1:m %calculate each normalized data for each matrix element
        dataNorm(j,i) = (data(j,i)-dataMean(i))/(dataStd(i));
    end 
end

% find the covariance matrix from the normalized data
covMat = (dataNorm' * dataNorm)/(m-1); 

% find eigenvalues and eigenvector from the coviariance matrix
[V,D] = eig(covMat);

% sort the eigenvalues from the largest to smallest
sortedD = zeros(4,4);
sortedD(1,1) = D(4,4);
sortedD(2,2) = D(3,3);
sortedD(3,3) = D(2,2);
sortedD(4,4) = D(1,1);

% adjust eigenvectors such that it correspond to the descending eigenvalues
sortedV = zeros(4,4);
sortedV(:,1) = V(:,4);
sortedV(:,2) = V(:,3);
sortedV(:,3) = V(:,2);
sortedV(:,4) = V(:,1);

%% Output
coeffOrth = sortedV; % the eigenvectors
pcaData = dataNorm * coeffOrth; %eigenvectors times the normalized matrix
end

function dataMean = myMean(data)
% dataMean = myMean(data)
% 
% calculates the average of a data, data could be any m * n array
%
% Input:
% data: data that wants to be evaluated
% 
% Output: 
% dataMean: Average value of the data

% mean is the sum of the data within 1 row divided by its rows
    dataMean = sum(data)./length(data);

end

function standDev = myStd(data)
% standDev = myStd(data)
%
% Calculates the standard deviation of the data
% 
% Input:
% data: data that wants to be evaluated
%
% Output:
% standDev: standard deviation of the data

[m,n] = size(data); % obtain the size of the data (matrix)
dataSum = zeros(m,n); % preallocate a matrix for elements
dataMean = myMean(data); % calculate mean of the data from myMean function

for i = 1:n
    avg = dataMean(i); % find mean for each column
    for j = 1:m % for each column calculate the data - average
        dataSum(j,i) = (data(j,i) - avg)^2;   
    end
end
% sum all the data in 1 column
stdData = sum(dataSum);

% calculate the standard deviation by dividing the data by columns-1 and
% square root
standDev = sqrt((stdData)/(m));

end
