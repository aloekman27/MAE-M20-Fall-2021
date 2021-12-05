%{
Name of the script: hw5_main_p2.m (Fixed Point Method for f(x) =
3+2sin(x)-x)
    
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
x0 = [3 0]; % initial guesses
tol = 10^-5; % tolerance
maxIter = 100; % maximum iterations

%% Function Call
% calculate the value of xStar and xRoot using each initial guess
[xStar1, xRoot1] = fixPoint(@fun3, x0(1), tol, maxIter);
[xStar2, xRoot2] = fixPoint(@fun3, x0(2), tol, maxIter);

%% Check the root using fzero
fun4 = @(x) 3 + 2*sin(x) - x; % function
xRoot_fzero = fzero(fun4,[3 4]); % fzero function call

%% Outputs 

% print the value of the fixed point with guess x = 3
fprintf('The Fixed point from initial guess %.3f is : %.10f\n', x0(1), xStar1)
%print the value of the root of the function with guess x = 3
fprintf('The Root from initial guess %.3f is : %.10f\n', x0(1),xRoot1)
% print the value of the fixed point with guess x = 0
fprintf('The Fixed point from initial guess %.3f is : %.10f\n', x0(2), xStar2)
%print the value of the root of the function with guess x = 0
fprintf('The Root from initial guess %.3f is : %.10f\n', x0(2),xRoot2)

%% Plot
x = 0:0.01:10; % value of x 
y = x; % value of y

f1 = 1 + 0.5*sin(x); % f1 from value of x
f2 = 3 + 2*sin(x);% f2 from value of x

figure(1) % figure 1 is f1 and y vs x
plot(x,f1,x,y)
title('1 + 0.5sin(x) & y vs. x')
xlabel('x')
ylabel('f(x)')
legend('y = 1 + 0.5*sin(x)','y = x','location','best')
grid on

figure(2)% figure 2 is f2 and y vs x
plot(x,f2,x,y)
title('3 + 2sin(x) & y vs. x')
xlabel('x')
ylabel('f(x)')
legend('y = 3 + 2sin(x)','y = x','location','best')
grid on
