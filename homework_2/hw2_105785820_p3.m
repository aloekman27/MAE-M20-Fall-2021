%{
Name of the script: hw2_105785820_p3.m (Neighbor Identification)
    
Descpription: This script m-file determines and prints the neighbors of a 
    cell input p if prompted input m rows and n columns of a rectangular 
    array. 
Inputs: User inputs the number of rows (m), the number of columns (n), and
     the cell that wants to be identified (p)
Outputs: Prints the neighbors of cell p according to the configuration of 
    the cells.
Method: User inputs number of rows and columns (this must be an integer and
both m & n must be greater than 3). Also, user inputs the cell, p, that wants
to be identified (cell p must be greater than 1 but less than the final
cell m * n). Then, Identify where the cell is located on the rectangular
array. This will not be shown in the output. The location on the grid
determines how many neighbor the cell has. Then, the output prints the cell
the user has inputted along with the neighbors corresponding to the cell.

Name: Adrian Loekman (aloekman@g.ucla.edu) 
UID: 105785820

%}

%% Front Stuff
% Clears all recent codes in command window and workspace
clc; clear all;

%% Inputs
% User Inputs m, n, and p 
m = input('Enter the number of rows (M): '); % inputs # of rows
n = input('Enter the number of columns (N): ');% inputs # of columns
p = input('Enter the cell number : '); % inputs the cell to be identified

%% Input Validations
% Validate that the input is correct

% m and n must be greater than 3
if m <= 3 || n <= 3 
    error('M and N must be greater than 3');
end 
% p must be from 1 to the value of m * n
if p < 1 || p > (m*n)
    error('P must be between 1 and M*N');
end 

%% Main Calculation
% Using if statements to locate the cell on the array and identify the
% neighbors associated with the cell

%% Corner Node Cells
% For corner node cells, each cell will have 3 distinct neighbors
if p == 1 || p == m || p == (m*n)-(m-1) || p == (m*n) %p on corners
    if p == 1 % top left corner
        n1 = p+1;% bottom of the cell
        n2 = m+1;% next to the cell
        n3 = m+2;% bottom of n2
    elseif p == m % bottom left corner
        n1 = p-1;
        n2 = (2 * m) - 1;
        n3 = (2 * m);
    elseif p == (m*n)-(m-1) % top right corner
        n1 = (m * (n-2)) + 1;
        n2 = (m * (n-2)) + 2;
        n3 = ((m*n)-(m-1)) + 1;
    else % bottom right corner
        n1 = (m * (n-1)) - 1;
        n2 = (m * (n-1));
        n3 = (m * n) - 1;   
    end 
    %% Corner Node Output
    % Prints the cell inputted along with the neighbors
    fprintf('The neighbors for Node %d are %d %d %d\n', p, n1, n2, n3);
    fprintf('Corner Node\n'); %Prints the output 'corner node'

%% Left Cells
% This applies to all cells on column 1 (the leftmost column)
elseif p > 1 && p < m % p is from 1 to whatever is m from user input
    n1 = p - 1; % cell above
    n2 = p + 1; % cell below
    n3 = (p + m) - 1; % cell diagonal right up
    n4 = (p + m) ; % cell to the right 
    n5 = (p + m) + 1; % cell diagonal right down
    %% Left Cells Output
    fprintf('The neighbors for Node %d are %d %d %d %d %d\n', p, n1, n2, ...
        n3, n4, n5);

%% Right Cells
% This Applies to cells on the rightmost column
elseif p > (m*n) - (m-1) && p < (m * n) % p must be the leftmost column excluding the corners
    n1 = p - m - 1; % diagonal left up
    n2 = p - m; %left cell
    n3 = p - m + 1; %diagonal right up
    n4 = p - 1; %cell above
    n5 = p + 1; % cell below
    
    %% Right Cells Output
    fprintf('The neighbors for Node %d are %d %d %d %d %d\n', p, n1, n2, ...
        n3, n4, n5);

%% Bottom Cells
% This applies to all cells on mth row except for the corner nodes
elseif mod(p,m) == 0 && (p ~= m || p ~= m * n) %use mod becasue the last row is just a multiple of m
    n1 = (p - m) - 1; % diagonal left up
    n2 = (p - m); %left of cell
    n3 = p - 1; % cell above
    n4 = (p + m) - 1; %diagonal right up
    n5 = (p+m); %right of cell
    
    %% Bottom Cells Output
    fprintf('The neighbors for Node %d are %d %d %d %d %d\n', p, n1, n2, ...
        n3, n4, n5);

%% Top Cells 
% This Applies to the cells on the 1st row except for corner nodes
elseif mod(p,m) == 1 && ( p ~= 1 || p ~= (m*n)-(m-1)) % when dividing the cell with m, 
    n1 = p - m; % left cell
    n2 = (p - m) + 1; % diagonal left down cell
    n3 = p + 1; % cell below
    n4 = p + m; % cell to the right
    n5 = (p + m) + 1; % cell diagonal right down
    
    %% Top Cells Output
    fprintf('The neighbors for Node %d are %d %d %d %d %d\n', p, n1, n2, ...
        n3, n4, n5);
else %% All cells that are not on the sides have 8 neighbors
    n1 = (p - m) - 1; % cell diagonal left up
    n2 = (p - m); % cell to the left
    n3 = (p - m) + 1; % cell diagonal left down
    n4 = (p - 1); % cell above
    n5 = (p + 1); % cell below
    n6 = (p + m) - 1; % cell diagonal right up
    n7 = (p + m); % cell to the right
    n8 = (p + m) + 1; % cell diagonal right down
    
    %% All Other Cells Output
    fprintf('The neighbors for Node %d are %d %d %d %d %d %d %d %d\n', p, n1, n2, ...
        n3, n4, n5, n6, n7, n8);
end


