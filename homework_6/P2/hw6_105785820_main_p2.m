%{
Name of the script: hw6_105785820_p2.m (Implementing Customized Probability Distributions)
    
Descpription: Create a histogram from the customized probability
distribution function, p(x), using the function myRand
Inputs: initialize P and call myRand to this script
Outputs: A plot with the histogram and the real value of p(x) at [0,3]
Method: initialize 11000 zeros for each random sample. Use a for loop to
generate a random sample for each iteration. Plot histogram and real value
of p(x)

Name: Adrian Loekman (aloekman@g.ucla.edu) 
UID: 105785820

%}
%% Front Matter
% Clears all recent codes in command window and workspace
clc; clear all; close all;

%% Declare the Array
P = zeros(11000,1); % array for each probability 

%% Time marching loop
for i = 1: 11000
    P(i) = myRand(); % calculate using myRand for 11000 samples
end


%% Plot
figure(1)
h = histogram(P,'Normalization','pdf'); % plot of histogram
hold on

% data to plot p(x)
x = 0:0.1:3;
y = (-2/9)*x + 2/3; % function p(x) 


plot(x,y,'LineWidth',2)
title('Customized Probability Distribution Function')
xlabel('x')
ylabel('Probability')
legend('Histogram', 'p(x)')
box on
grid on



function x = myRand()
%
% Outputs a random real number from 0 to 3 
%
% Outputs:
% x: the random sample drawn from p(x)

y = rand(); % output a random real number from 0 to 1


x = 3-3*sqrt(1-y); % the inverse function of customized probability 
                   % distribution function p(x)

end 