%{
    Name of the script: hw1_105785820.p4 (Heat Transfer)
    
    Descpription: This script m-file solves temperatures and time based on
    the inputs given on each section of the problem
    Inputs:
    a.) initial temperature, thermal chamber temperature, time(hours)
    b.) initial temperature, thermal chamber temperature, final temperature
    c.) initial temperature, final temperature, time(hours)
    Outputs: 
    a.) final temperature
    b.) time taken (seconds)
    c.) thermal chamber temperature
    Method: Use and manipulate(rearrange) the given equation on the problem
    according to the output desired on each section of the problem

    Name: Adrian Loekman (aloekman@g.ucla.edu)
    UID: 105785820

%}

%% Front Stuff
% Clears all recent codes in command window
clc 
clear all

k = 0.45; % constant k

%% Part a
% Given the initial temperature, thermal chamber temperature, and time, we
% can find the final temperature of the object using the equation given

%% Inputs Part a
T_0_a = 100; % Intial Temperature (degrees Celcius)
T_s_a = 25; % Thermal Chamber Temperature (degrees Celcius)
t_a = 3; % time elapsed (hours)

%% Calculations Part a
% Heat Transfer Equation given by the problem
T_f_a = T_s_a + ((T_0_a - T_s_a)*exp(-k*t_a));

%% Output Part a
% Print the final temperature from the calculation above
fprintf('(a) The final temperature of the object is %.5f degrees Celcius \n',...
    T_f_a)

%% Part b
% Given the initial temperature, thermal chamber temperature, and final
% temperature, we can find the time elapsed(in seconds) by rearranging the
% Heat Transfer equation to solve for t

%% Inputs Part a
T_0_b = 100; % Intial Temperature (degrees Celcius)
T_s_b = 25; % Thermal Chamber Temperature (degrees Celcius)
T_f_b = T_0_b - 10; % Final Temperature (degrees Celcius)

%% Calculations Part b
% Rearranging the Heat transfer equation to solve for t
t_b = (log(T_f_b-T_s_b)-log(T_0_b-T_s_b))/(-k);
% Convert time from hours to seconds
t_b_seconds  = round(t_b * 60);

%% Output Part b
% Print the time elapsed from the equation above
fprintf('(b) The time needed for the object is %d seconds\n',...
    t_b_seconds);

%% Part c
% Given the initial temperature, final temperature and time(hours), we can
% calculate the thermal chamber temperature by rearranging the Heat
% Transfer equation to solve for T_s

%% Inputs Part c
T_0_c = 50; % Thermal Chamber Temperature (degrees Celcius)
T_f_c = 40; % Final Temperature (degrees Celcius)
t_c = 1.5; % time elapsed (hours)

%% Calculations Part c
% Rearrange the Heat Transfer equation to solve for thermal chamber
% temperature
T_s_c = (T_f_c - T_0_c * exp(-k*t_c))/(1-exp(-k*t_c));

%% Output Part c
% Print the Thermal Chamber Temperature from the calculation above
fprintf('(c) The temperature of the thermal chamber is %.5f degrees celcius \n',...
    T_s_c);






