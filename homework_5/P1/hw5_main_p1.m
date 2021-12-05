%{
Name of the script: hw5_main_p1.m (Bisection Method)
    
Descpription: Tests the function biSection with the given inputs from the
    problem statement and compare it with the built-in function fzero
Inputs: a (left boundary), b (right boundary), tol (tolerance)
Outputs: xRoot (root from biSection), xRoot_fzero (root from fzero), and
    numIter (number of iterations to obtain root)
Method: Using the known parameters, call the function biSection and fzero
    from the problem statement. Then, print the outputs. Compare the values
    from both method.

Name: Adrian Loekman (aloekman@g.ucla.edu) 
UID: 105785820

%}
%% Front Matter
% Clears all recent codes in command window and workspace
clc; clear all; close all;

%% Parameters
% Known values from problem statement
a = 0; % left boundary 
b = 1; % right boundary
tol = 10^(-5); % given tolerance

%% Function Call
% outputs xRoot (root) of the function and numIter (iterations) using the 
% biSection method given boundary a b and tolerance
[xRoot, numIter] = biSection(@fun1, a, b, tol);

%% Fzero Call
% uses MATLAB function fzero to find the root of a function in boundary a b
xRoot_fzero = fzero(@fun1,[a b]);

error = (abs(xRoot - xRoot_fzero))/ xRoot_fzero;
%% Outputs
% prints the root using bisection, fzero, and iterations needed
fprintf('The Root of the Function via Bisection is : %.10f\n', xRoot)
fprintf('The Root of the Function via fzero is : %.10f\n', xRoot_fzero)
fprintf('Number of Iterations: %d\n', numIter)
fprintf('Error: %e\n', error);