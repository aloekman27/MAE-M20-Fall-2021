%{
Name of the script: hw5_main_p2.m (Fixed Point Method for f(x) =
1+0.5sin(x)-x)
    
Descpription: Tests the function fixPoint to find the root from a given
    function
Inputs: x0 (inital guess), tol (tolerance), maxIter (maximum iterations)
Outputs: xRoot (root from fixed point method), xStar (xroot from fixed point)
Method: subtitute f(x) = 0 to g(x) = x. Using the function, fixPoint, calculate
    the root of the function and the fixed point. 

Name: Adrian Loekman (aloekman@g.ucla.edu) 
UID: 105785820

%}
%% Front Matter
% Clears all recent codes in command window and workspace
clc; clear all; close all;

%% Parameters
x0 = 0; % initial guess
tol = 10^-5; % tolerance
maxIter = 10; % maximum iterations

%% Function Call
[xStar, xRoot] = fixPoint(@fun2, x0, tol, maxIter);


%% Output
% print the value of the fixed point
fprintf('The Fixed point from initial guess %.3f is : %.10f\n', x0, xStar)
%print the value of the root of the function
fprintf('The Root from initial guess %.3f is : %.10f\n', x0,xRoot)

