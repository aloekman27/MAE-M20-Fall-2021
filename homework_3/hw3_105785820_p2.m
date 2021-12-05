%{
Name of the script: hw3_105785820_p2.m (Permutation)
    
Descpription: This script solves the mathematical expression of permutation
    using manually calculated factorial
Inputs:
    - n = n is an integer
    - r = r is an integer
Outputs: the value of P(n,r)
Method: Calculate the factorial of the numerator (n!) and denominator
(n-r)! using for loops. Then divide to get P(n,r)

Name: Adrian Loekman (aloekman@g.ucla.edu) 
UID: 105785820

%}

%% Front Stuff
% Clears all recent codes in command window and workspace
clc; clear all;

%% Inputs
n = input('input n: '); % inputs n
r = input('input r: '); % inputs r

%% Validate inputs

% n has to be a positive integer 
while n < 0 || (mod(n,1) ~= 0) % if n is negative or not an integer
    fprintf('Invalid n, please reinput\n');
    n = input('input n: '); % reinput a value for n
end 

% r has to be a positive integer
while r < 0 || (mod(r,1) ~= 0)% if r is negative or not an integer
    fprintf('Invalid r, please reinput\n');
    r = input('input r: ');% reinput a value for r
end 

while n < r % n cannot be less than r because the denominator would be (-)
    fprintf('n cannot be less than r\n')
    n = input('input n: ');% reinput a value for n
end 

%% Calculations
%Numerator Calculation
num = 1; %set the last integer for any factorial, 1
for i = n:-1:1 % from value n to 1
    num = num * i; % multiply the factorial by i
end % the for loop acts like a factorial by multiplying the previous 
        % multiplication with each i

denom = 1;%set the last integer for any factorial, 1
for j = (n-r):-1:1 % from value n-r to 1
    denom = denom * j; % multiply the factorial by i
end % the for loop acts like a factorial by multiplying the previous 
        % multiplication with each i

% divide the numerator with denominator to get P(n,r)
pnr = num/denom;


%% Output
% Prints the value of P(n,r) for any integer n and r
fprintf('Value of Permutation is P(%d,%d) = %d\n', n, r, pnr);


