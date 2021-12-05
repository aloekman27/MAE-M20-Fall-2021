%{
Name of the script: hw3_105785820_p3.m (SIR Simulation of the Spread of Disease)
    
Descpription: This script solves a system of differential equations using
    the forward Euler method with time step t from 0 to 20 and outputs a 
    plot of the result and prints the maximum number of the infected and
    when it occured
Inputs:
    - beta = constant
    - gamma = constant
    - i0 = infected at t = 0
    - s0 = susceptible at t = 0
    - r0 = recovered at t = 0
    - t_start = starting time 
    - t_final = ending time
    - delta_t = time step size
Outputs: The plot of SIR model, the maximum number of infected and at t = ? 
Method: use for loops with k = t_start to t_final with step size 0.1.
Calculate each variable S, I, and R using discretizied forward Euler
method, then plot the data

Name: Adrian Loekman (aloekman@g.ucla.edu) 
UID: 105785820

%}

%% Front Stuff
% Clears all recent codes in command window and workspace
clc; clear all; close all;

%% Inputs

% constants
beta = 0.0026;
gamma = 0.5;

%Initial Values
i0 = 1; % one sick student
s0 = 700; % 700 susceptible individuals
r0 = 0; % 0 recovered


% Set the start time, end time, and time step (used for loop index)
t_start = 0;
t_final = 20;
delta_t = 0.1;

% set a new variable to use forward Euler Method 
i_old = i0;
s_old = s0;
r_old = r0;

% set a placeholder varible to find maximum infected
maxI = 1;

%% Calculation

% loop index from t_start to t_final and time step delta_t
for k = t_start:delta_t:t_final
    % i(k+1) = i(k) from forward Euler Method
    i_new = i_old * (1 + delta_t * beta * s_old - delta_t * gamma);
    % s(k+1) = s(k) from forward Euler Method
    s_new = s_old + delta_t * (-beta * s_old * i_old);
    % r(k+1) = r(k) from forward Euler Method
    r_new = r_old + delta_t * (gamma * i_old);

    % Change variables i_new to i_old for next iteration
    i_old = i_new;
    s_old = s_new;
    r_old = r_new;
    
    % set an if statement so it stops when i starts decreasing
    if i_old > maxI 
        maxI = round(i_old); % round maximum infected students to nearest integer
        tmax = round(k); % round the t when max infected students to nearest integer
    end 
    
    % plot the number of infected students
    plot(k,i_old,'*r')
    hold on % use hold on so each point is set on the same plot
    
    grid
    xlabel('Time, t [days]')
    ylabel('Infected Students, I [person(s)]')
    title('Infected Students vs time')
end

%% Outputs
% print the maximum number of infected students and when it occured
fprintf('The maximum number of infected students is %d at t = %d\n', maxI, tmax)
