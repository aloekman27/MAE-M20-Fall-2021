% Name: Adrian Loekman (aloekman@g.ucla.edu) 
% UID: 105785820
function write2Excel(mesh, t, X, filename)
% write2Excel(mesh, t, X, filename)
%
% write2Excel: a function that stores the vertices' locations, the ...
% ratios of infected, susceptible and recovered in an Excel file.
%
% Inputs:
% mesh: an struct of mesh information of the triangulated surface
% t: a vector of time steps
% X: an N*3*length(t) matrix, where each Nx3 matrix corresponds to
% the state of the S.I.R. system at a particular instance in time.
% This 2D matrix is repeated for each time step, making it a 3D ...
% matrix.
% filename: the name of Excel file used to store data
%
% Output: this function does not output anything.

%% Preallocations 
N = numel(t); % calculate time elements
Nc = size(X,1); % calculate SIR elements (rows)

S = zeros(Nc,1); % preallocate array for S
I = zeros(Nc,1); % preallocate array for S
R = zeros(Nc,1); % preallocate array for S

%% Set up Variable names for the table
variableNames = {'Coordinate X','Coordinate Y','Coordinate Z',...
    'Susceptible rate', 'Infected Rate', 'Recovered Rate'};

targetTime = 0; % initiate a time 
coordinates = zeros(N,3); % preallocate a vector for the coordinates

%% Change location struct to matrix
for j = 1:Nc
    % for each iteration, set each row with each row of location
    coordinates(j,:) = mesh(j).location;
end 

%% Set table and place the table onto Microsoft excel
for i = 1 : N % for loop for every time step
    if t(i) >= targetTime % set an if statements for every 15 time steps
        corX = coordinates(:,1); % x coordinates of mesh
        corY = coordinates(:,2); % y coordinates of mesh
        corZ = coordinates(:,3); % z coordinates of mesh
        S(:) = X(:,1,i); % values of susceptible rate 
        I(:) = X(:,2,i); % values of infected rate
        R(:) = X(:,3,i); % values of recovered rate
        
        % Create table with these variables below as each column
        T = table(corX, corY, corZ, S, I, R, 'VariableNames', variableNames);
        nameOfSheet = sprintf("T = %f", t(i)); % sheet name
        % create table to Excel with table, sheet, and filename starting
        % from A1
        writetable(T,filename,'Sheet', nameOfSheet, 'Range', 'A1');
        
        % update time for every 15 time elements
        targetTime = targetTime + 15;
        
    end
end


end 