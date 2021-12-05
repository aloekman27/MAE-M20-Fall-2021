%{
Name of the script: hw2_105785820_p1.m (Cubic Function Type)
    
Descpription: This script m-file determines wether a cubic function is
 simple, monotone, or neither 
Inputs: user inputs a, b, c, and d : four coefficients for the function (a~=0) 
Outputs: Prints the function to be simple, monotone, or neither based on 
 the calculations made on the function's derivative
- monotone: f' does not have real distinct roots
- simple: f(r1)*f(r2) < 0
- neither : the opposite of simple. 
Method: Validate that a is not equal to 0. Then, find the derivative of the 
 function with coefficients. Find the 2 roots of the quadratic equation.

Name: Adrian Loekman (aloekman@g.ucla.edu) 
UID: 105785820

%}

%% Front Stuff
% Clears all recent codes in command window and workspace
clc;
clear all;


%% Inputs
% User inputs 4 coefficients a, b, c, and d
a = input("Enter a value for a (a ~= 0) : ");
b = input("Enter a value for b : ");
c = input("Enter a value for c : ");
d = input("Enter a value for d : ");

% Validate that a must not be zero, otherwise will print error statement
if a == 0 
    error("a must not be zero!");
end 

%% Calculations
% Calculations made to solve the problem

% derivative of the cubic function: f'(x) = 3ax^2 + 2bx + c

% Finding the roots of the quadratic function
root1 = (-2*b + sqrt((2*b)^2 - 4*3*a*c))/(2*3*a);
root2 = (-2*b - sqrt((2*b)^2 - 4*3*a*c))/(2*3*a);

%% Cubic Function Characteristics
%If else statement to determine the cubic function properties
% Determine if the roots of the quadratic are real or not, and not
% identical
if ((isreal(root1) == 1) &&  (isreal(root2) == 1)) && (root1 ~= root2)
    % If roots are real proceed to these codes
    % f(x) = ax^3 + bx^2 + cx + d
    fr1 = a*root1^3 + b*root1^2 + c*root1 + d; % f(r1)
    fr2 = a*root2^3 + b*root2^2 + c*root2 + d; % f(r2)
    if fr1*fr2 < 0 % cubic function is simple if the result is negative
        fprintf('Simple\n')% Outputs 'Simple' on command window
    else %if the result is 0 or positive, then print neither
        fprintf('Neither\n'); % Outputs 'Neither' on command window
    end
else 
    % the cubic function is monotone if the roots of the quadratic are not
    % real distinct roots
    fprintf('Monotone\n'); % outputs the statement 
    
end 