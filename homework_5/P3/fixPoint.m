% Adrian Loekman (aloekman@g.ucla.edu)
% UID: 105785820
function [xStar, xRoot] = fixPoint(fun3, x0, tol, maxIter)
%
% Finds the root of a function using fixed point method
% 
% Inputs:
% fun2: a function handle, standing for the function written above
% x0: the initial guess of the fixed point
% tol: the tolerance within which the program can stop
% maxIter: the maximum number of iterations the program is allowed to run
%
% Outputs:
% xStar: the numerical value of the fixed point
% xRoot: the numerical value of the root

xVal = x0; % set initial guess x0
iter = 1; % initialize iteration cound
while abs(fun3(xVal)-xVal) > tol && iter < maxIter
    % (g(xi) - xi > tol) or max iterations is not yet reached
    xNew = fun3(xVal); % new root, x(i+1) is g(xi)
    xVal = xNew; % update values
    iter = iter + 1; % update iteration
end 

xStar = fun3(xVal); % the fixed point x*
xRoot = xVal; % the root of the function
end 