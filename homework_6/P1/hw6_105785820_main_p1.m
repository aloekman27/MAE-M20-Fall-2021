%{
Name of the script: hw6_105785820_p1.m (Monte Carlo Simulation for Decision Making)
    
Descpription: Calculate the probability of choosing a 3pt or 2pt when down
    3 points in 30 seconds in a basketball game. Choose the best options
    with the given percentages
Inputs: 2 function handles of scenarios, taking the three point or two
    point
Outputs: Win Probabilities in mulitple simulations
Method: Using unidrnd to generate a random integer from 1 - 365 for n
    people. Do this for a number of simulations (3000) and calculate the
    probability. Graph the data and verify with a numerical verification

Name: Adrian Loekman (aloekman@g.ucla.edu) 
UID: 105785820

%}
%% Front Matter
% Clears all recent codes in command window and workspace
clc; clear all; close all;

%% Simulation a

%% Parameters
threePoint = 35; % three point percentage
twoPoint = 40; % two point percentage
oppFreeThrow = [80,80]; % opponent free throw percentage
ftOffRebound = 15; % opponent free throw rebound percentage
regOffRebound = 25; % team regular rebound percentage
winOvertime = 50; % win percentage in overtime


simulation = [300 1000 2000]; % set of simulations


% calculate number of wins using three point strategy
win1 = takeThree(threePoint,winOvertime,simulation);

% calculate win percentage from each win divided by simulations using three
% point strategy
winPercentage1 = (win1./simulation) * 100;

% print results of three point strategy
fprintf('The Results From Part a are: \n');
fprintf('Win From Three Point with %d Simulations: %.2f%%\n',...
    simulation(1),winPercentage1(1,1))
fprintf('Win From Three Point with %d Simulations: %.2f%%\n',...
    simulation(2),winPercentage1(1,2))
fprintf('Win From Three Point with %d Simulations: %.2f%%\n\n',...
    simulation(3),winPercentage1(1,3))

% calculate number of wins using two point strategy
win2 = takeTwo(twoPoint,regOffRebound,oppFreeThrow,ftOffRebound,winOvertime,simulation);

% calculate win percentage from each win divided by simulations using two
% point strategy
winPercentage2 = (win2./simulation) * 100;

% print results of two point strategy
fprintf('Win From Two Point with %d Simulations: %.2f%%\n',...
    simulation(1),winPercentage2(1,1));
fprintf('Win From Two Point with %d Simulations: %.2f%%\n',...
    simulation(2),winPercentage2(1,2));
fprintf('Win From Two Point with %d Simulations: %.2f%%\n\n',...
    simulation(3),winPercentage2(1,3));

%% Simulation b

%% Parameters
threePoint2 = 25; % three point percentage b
twoPoint2 = 60; % two point percentage b
oppFreeThrow2 = [65, 65]; % opponent free throw b

% calculate wins using three point strategy
win3 = takeThree(threePoint2,winOvertime,simulation);

% calculate win percentage for each simulation
winPercentage3 = (win3./simulation) * 100;

% print results from three point strategy
fprintf('The Results From Part b are: \n');
fprintf('Win From Three Point with %d Simulations: %.2f%%\n',...
    simulation(1),winPercentage3(1,1))
fprintf('Win From Three Point with %d Simulations: %.2f%%\n',...
    simulation(2),winPercentage3(1,2))
fprintf('Win From Three Point with %d Simulations: %.2f%%\n\n',...
    simulation(3),winPercentage3(1,3))
                       
% calculate wins using two point strategy
win4 = takeTwo(twoPoint2,regOffRebound,oppFreeThrow2,ftOffRebound,winOvertime,simulation);

% calculate win percentage for each simulation
winPercentage4 = (win4./simulation) * 100;

% print results from three point strategy
fprintf('Win From Two Point with %d Simulations: %.2f%%\n',...
    simulation(1),winPercentage4(1,1));
fprintf('Win From Two Point with %d Simulations: %.2f%%\n',...
    simulation(2),winPercentage4(1,2));
fprintf('Win From Two Point with %d Simulations: %.2f%%\n',...
    simulation(3),winPercentage4(1,3));
                               
