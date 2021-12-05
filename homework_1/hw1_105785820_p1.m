%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Name of the script: hw1_105785820_p1.m (Evaluating Inputs)              %          %
%                                                                         %
% Description: This script m-file evaluates a user's input for a name and %
%              mathematical expression                                    %             
% Inputs : name and mathematical expression (both are strings)            %
% Outupus : Script prints a sentence containing the user's name in        %
%           Uppercase letters, the mathematical expression, and evaluating% 
%           that mathematical expression                                  %
% Method : Using MATLAB's built in toolbox upper and eval to solve the    %                                                %
%          mathematical problem initially in string class                 %
%                                                                         %
%   Name: Adrian Loekman (aloekman@g.ucla.edu)                            %
%   UID: 105785820                                                        %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Front Stuff
% Clears all recent codes in command window
clc
clear all

%% Input
% Inputs for this problem

% user can enter name
name = input('Enter your name: ', 's'); 
% user enters mathematical expression
math_express  = input('Enter your mathematical expression: ', 's');

%% Calculations
% The methods used in this problem to obtain desired output

upper_name = upper(name); %changes all letters in input name into uppercase
eval_math_express = eval(math_express); %evaluates the mathematical expression by user

%% Output
% The output from the input and calculations 

% prints the desired output using fprintf with users inputs
fprintf('Hello %s, your expression %s evaluates to %d\n',...
    upper_name, math_express, eval_math_express);
