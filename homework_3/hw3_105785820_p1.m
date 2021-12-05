%{
Name of the script: hw3_105785820_p1.m (Golden Ratio)
    
Descpription: Solve the golden ratio using the ratio of 2*cosd(36) and the
    Fibonacci Sequence. Then, Display the results and the sequences
Inputs: errorTol: an uncertainty 'error'
Outputs: 
    - The golden ratio approximation using 2*cosd(36)
    - The golden ratio approximation using Fibonacci Sequence
    - The number of sequences needed to achieve the result
Method: Use while loops until the error is less than the tolerance to
calculate the approximation of the cosine. Then use that ratio and compare
it with the ratio of the Fibonacci sequence using while loops until it 
reaches less than the tolerance. Calculate the terms in the Fibonacci 
Sequence. Print the results

Name: Adrian Loekman (aloekman@g.ucla.edu) 
UID: 105785820

%}
clc; clear all;

%% Input
% input uncertainty error as input
errorTol = input('Error (e.g. 1e-10) : ');

%% Taylor's Series of 2*cosd(36)
% Input Predetermined values for the while loop
new = 0; % predetermined new term
cosx = 0; % predetermined cos term
n = 0; % terms in summation
e1 = 1; % predetermined error

% change the value from degrees to radians
x =deg2rad(36);

% set a while loop so that it loops as long as the error is larger than the
% tolerance
while e1 >= errorTol % this while loop represents a summation
    old = new; % set the new variable to old
    new = (-1)^n * (x^(2*n)/(factorial(2*n))); % calculate the single term
    n = n + 1; % term n is now n+1
    cosx = cosx + new; % term cosx is (the old) cosx + the new term
    e1 = abs(new - old); % calculate the error from the new and old cosx
   
end

% multiply the summation with 2 to get the golden ratio
golden1 = 2 * cosx;



%% Fibonacci Sequence
% input predetermined values
f1 = 0; % 1st term of the Fibonacci Sequence
f2 = 1; % 2nd term of the Fibonacci Sequence
m = 2; % the mth term starts at 2 because we have defined the first two terms
golden2 = 0; % set an arbitrary large number as a temporary placeholder

% while the error of the ratios are greater than the tolerance, proceed the
% loop
while abs(golden1 - golden2) >= errorTol
    fib = f1 + f2; % each term of the Fibonacci sequence is obtained by 
            % summing the two previous terms
    golden2 = fib/f2; % calculate the ratio
    f1 = f2; % set f2 as f1(to calculate the next Fibonacci term)
    f2 = fib; % set fib as f1 (to calculate the next Fibonacci term)
    error = abs(golden1 - golden2); %calculate the error
    m = m + 1; % counting the number of Fibonacci terms
    
end

%% Outputs
% Prints the output which are the ratios and the numbers in the Fibonacci
% sequence 

% the golden ratio from the cosine summation
fprintf('The ratio of 2*cosd(36) : %.17f\n', golden1);
% the golden ratio from the Fibonacci Sequence
fprintf('The ratio of the Fibonacci Sequence : %.17f\n', golden2);
% The numbers in The Fibonacci Sequence needed to fulfill the tolerance
fprintf('The number of Fibonacci Terms Needed : %2d\n', m);