% Adrian Loekman (aloekman@g.ucla.edu)
% UID: 105785820
function fx = fun1(x)
% fx = fun1(x)
%
% defines the value of fx for every x value input
%
% Inputs:
% x: a point at which to evaluate the value of the function
%
% Outputs:
% fx: the numerical value of the function

% function of fx given from the problem statement
fx = x.^3 - sin(x) - 4*x + 1;

end