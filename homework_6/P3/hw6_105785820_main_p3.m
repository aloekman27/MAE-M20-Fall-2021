%{
Name of the script: hw6_105785820_p3.m (Birthday Paradox)
    
Descpription: Calculate the frequency of people, n, having the same
    birthday
Inputs: The number of people and simulations
Outputs: the probabilities 2 people have the same birthday in a group of n
    people
Method: Using unidrnd to generate a random integer from 1 - 365 for n
    people. Do this for a number of simulations (3000) and calculate the
    probability. Graph the data and verify with a numerical verification

Name: Adrian Loekman (aloekman@g.ucla.edu) 
UID: 105785820

%}

%% Front Matter
% Clears all recent codes in command window and workspace
clc; clear all; close all;

%% Parameters
sim = 3000; %total simulations

%% Declare arrays
n = 10:10:100; % Declaring arrays for n people


sameBirthday = zeros(1,numel(n)); % preallocate space to store the data
%% Time Marching Loop
for i = 1:numel(n)
    people = n(i); % changes the number of people n
    for j = 1:sim
        birthday = unidrnd(365,people,1); %generate a list of random integers from 1 - 365
    
        sameDay = unique(birthday(:)); % generate a list of people with the same birthday
        if numel(birthday) ~= numel(sameDay) % if sameDay is not equal to birthday, 2 or more integers are the same
            sameBirthday(1,i) = sameBirthday(1,i) + 1; % update frequency
        end  
    end
end 
% calculate probability
probability = sameBirthday./sim;

%% Plot
% plot of probability as a function of n
figure(1)
plot(n,probability,'b^-')
title(' Probability of at least 2 people have the same birthday')
xlabel('People, n [ ]')
ylabel('Probability, P[ ]')




%% Numerical Verification
% % This method uses Poisson Approximation


prob_needed = 0.5; % probability needed
% anonymous function from Poisson Approximation
f= @(n) n^2 - n + (730*log(prob_needed));

% find the root of the function
n_verify = fzero(f, 20);
n_round = round(n_verify);

% print statement from Poisson Approximation
fprintf('From Poisson Approximation, %d people is at least needed for two people to\n', n_round)
fprintf('have the same birthday with probability 0.5\n')





