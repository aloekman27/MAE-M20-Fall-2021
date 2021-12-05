%{
    Name of the script: hw1_105785820.p3 (Digits of Pi)
    
    Descpription: This script m-file prints pi to the number of digits
    specified by the user
    Inputs: Input the number of decimal places desired by user
    Outputs: pi value to the decimal number given at the input
    Method: Use formatting text sprintf to change the data from double to
    char. Then, use formatting operators to determine the number of
    decimals desired by user


    Name: Adrian Loekman (aloekman@g.ucla.edu)
    UID: 105785820

%}
%% Front Stuff
% Clears all recent codes in command window
clc 
clear all

%% Inputs
% user inputs the number of decimals to print from the value of pi
n = input('number of digits to print:  ');

%% Calculations
% Use formatting operator sprintf to make n decimals for the value of pi
text = sprintf('%.*f',n,pi);

%% Outputs
% Print the output containing the number of digits (double) and the value
% of pi corresponding to the digits (char)
fprintf('Pi to %d digits is %s\n', n, text);