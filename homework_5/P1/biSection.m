% Adrian Loekman (aloekman@g.ucla.edu)
% UID: 105785820
function [xRoot, numIter] = biSection(f, a, b, tol)
%[xRoot, numIter] = biSection(f, a, b, tol)
%
% Uses Bisection Method to solve a roots problem from boundary a to b
%
% Inputs:
% f: a function handle, standing for the function written above
% a: the left boundary of the range
% b: the right boundary of the range
% tol: the tolerance within which the program can stop
%
% Outputs:
% xRoot: the numerical value of the root
% numIter: the number of iterations after which the root is found\


e0 = b-a; % right bound - left bound
nMax = ((log(e0) - log(tol))/log(2)); % maximum iterations
k = 1; %initiate an iteration count

while k <= nMax
    p = (a+b)/2; % the root of the function is p
    if f(p) == 0 || e0/2 < tol % p is the root if therse conditions are true
        disp(p);
    end 
     k = k + 1; % add up the iteration count
    if (f(p)*f(a)) > 0
        a = p; % set the left bound as p and calculate the root again
    else 
        b = p;% set the right bound as p and calculate the root again
    end 
end 
xRoot = p; % root of the function
numIter = k; %number of iterations
end