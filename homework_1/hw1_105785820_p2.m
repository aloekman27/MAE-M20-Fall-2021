%{
    Name of the script: hw1_105785820.p2 (Numerical Approximation)
    
    Descpription: This script m-file calculates the mass of the object
    given the initial mass at rest and velocity
    Inputs: initial mass at rest 1kg and speed 25% speed of light
    Outputs: The mass of the object using special relativity equation and
    approximation approach. Then, calculate the percent error of the
    approximation
    Method: Retype the equations given in matlab, input all givens from the
    problem, use %error formula to calculate the error of the
    approximations

    Name: Adrian Loekman (aloekman@g.ucla.edu)
    UID: 105785820

%}
%% Front Stuff
% Clears all recent codes in command window
clc
clear all

%% Inputs
% The inputs from the problem (mass at rest and speed)
m_0 = 1; %mass at rest (kg)
v_c = 0.25;%speed (25% speed of light. Thus, 0.25)

%% Calculations
% Calculations based on formulas given from the problem and %error 

m1 = m_0 / (sqrt(1-(v_c)^2)); % mass using special relativity

m2 = m_0 * (1 + 0.5*(v_c^2)); % mass using approximation formula

%true value(m1) - approx value(m2)
diff = m1-m2; 

approx_error = abs(diff)/ m1 * 100; % %error of the approximations

%% Outputs
% Prints the outputs obtained by the data on inputs and the calculations

% Prints the mass using special relativity
fprintf('The mass of the object using special relativity is: %7.6f kg\n',...
    m1)
% Prints the mass using approximation formula
fprintf('The mass of the object using the approximation formula is: %7.6f kg\n',...
    m2)
% Prints the approximate errors from the mass approximations above
fprintf('The approximate error of these calculations is: %2.3f%%\n',...
    approx_error)

