%{
Name of the script: project_105785820_p2.m (Solving the Spatial SIR Model)
    
Descpription: This script reads the modifiedSphereSTL.txt to create a mesh
that will be used as a base to visualize an SIR model for a disease with
a differential equation solved using Bogacki-Shampine 3rd Order
Runge-Kutta. The resuls will be plotted using a time series, an animation
of the mesh, and write the data from the mesh and SIR to Microsoft Excel
Method: Load Mesh using stlRead function. Load SIRparameters.mat and
initialize intial conditions. Solve the differential equation using 2
methods, RK4.m and ode45, using the initial conditions. Call
plotTimeSeries to plot the time series using the monitorLocations from the
data. Generate the animation to the mesh from the differential equation.
Then, get the data and write them to excel

Name: Adrian Loekman (aloekman@g.ucla.edu) 
UID: 105785820

%}
%% Front Stuff
% Clears all recent codes in command window and workspace
clc; clear all; close all;

%% Load Mesh

% calculate time of calling the function
fprintf("Calling stlRead to load mesh...\n");
ticStart = tic;
% Load Mesh using function stlread.m 
mesh = stlRead("modifiedSphereSTL.txt");
fprintf('Done in %.3f seconds\n',toc(ticStart));% time elapsed

N = length(mesh); % length of mesh (rows)

%% Load SIRparameters.mat and set initial conditions

% calculate time of calling the function
fprintf("Calling SIRparameters.mat and creating initial conditions...\n")
ticStart = tic;

load('SIRparameters.mat'); % load SIRparameters.mat to the Workspace

% Initialize values for initial conditions
initialConditions = zeros(N,3);

% Create S = 1, I = 0, R = 0 for initial conditions
initialConditions(:,1) = 1; % S's
initialConditions(:,2) = 0; % I's
initialConditions(:,3) = 0; % R's

% calculate the elements in the initialInfections variable
num_infect = numel(initialInfections);

% Time marching loop from S, I, and R
for i = 1:num_infect % loop over each infected place
    for j = 1:N% loop over each node
        dist = norm(mesh(j).location - initialInfections{i});
        if dist < 1e-10
            ind = j; % infection has happened
            break
        end
    end
    % Change the new initial conditions to I = 1 infected and S = 0, R = 0
    initialConditions(ind,:) = [0,1,0]; % S = 0; I = 1; R = 0
      
end

fprintf('Done in %.3f seconds\n',toc(ticStart));% time elapsed

%% Solve Spatial SIR using RK4.m and ode45

% Solve using RK4
% Calculate time of calling function
fprintf("calling solveSpatialSIR with RK4.m...\n")
ticStart = tic;
% Solve the differential equation using RK4
[ty, y] = solveSpatialSIR(tFinal, mesh, initialConditions, alpha,...
    beta, gamma, @RK4); 
fprintf('Done in %.3f seconds \n', toc(ticStart));% time elapsed

% Solve using ode45
% Calculate time of calling function
fprintf("calling solveSpatialSIR with ode45...\n")
ticStart = tic;
% Solve the differential equation using ode45
[ty1, y1] = solveSpatialSIR(tFinal, mesh, initialConditions, alpha,...
    beta, gamma, @ode45);
fprintf('Done in %.3f seconds \n', toc(ticStart));% time elapsed

%% Call plotTimeSeries function on system from RK4.m results

% Calculate time of calling function
fprintf("Calling plotTimeSeries at the specified coordinates...\n");
ticStart = tic;

% Time marching Loop for plotTimeSeries for each monitor location
for i = 1 : numel(monitorLocations)
    % plot the SIR model for each monitor location
    plotTimeSeries(mesh,ty, y, monitorLocations{i});
    
end

fprintf('Done in %.3f seconds\n',toc(ticStart));% time elapsed

%% Call animate to generate animation

% Calculate time of calling function
fprintf("Calling animate to generate animation...\n");
ticStart = tic;
% Call the animate function from the mesh and differential equation
animate(mesh,ty,y);

fprintf('Done in %.3f seconds\n',toc(ticStart)); % time elapsed


%% Calling write2Excel to export data
% Calculate time of calling function
fprintf("Calling write2Excel to export data...\n");
ticStart = tic;

%call the function to write data into Microsoft Excel
write2Excel(mesh,ty,y,'SIRData.xlsx');

fprintf('Done in %.3f seconds\n',toc(ticStart));% time elapsed
