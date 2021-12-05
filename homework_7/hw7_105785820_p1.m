%{
Name of the script: hw7_105785820_p1.m (Euler Bernoulli Beam Bending)
    
Descpription: Calculate the y displacement and the maximum displacement for
    a beam given a force and a location its applied on. 
Method: Using all the parameters, create a matrix with nodes as rows and
    columns and the RHS matrix. Calculate the displacement for each set
    using left division. Plot the results

Name: Adrian Loekman (aloekman@g.ucla.edu) 
UID: 105785820

%}
%% Front Matter
% Clears all recent codes in command window and workspace
clc; clear all; close all;

%% Parameters
L = 1; % bar length (m)
r = 0.08; % cross section radius (m)
P = 1000; % force applied (N)
d = 0.6; % location applied from the left (m)
E = 65e9; % modulus of elasticity (Pa)
I = (pi*r^4)/4; % moment of inertia of cross section

EI = E * I; % modulus of elasticity times moment of inertia
tic % start calculating time for 100 nodes
nodes = 100; %nodes (points evaluated)


% A * Y = B
%% initialize A matrix

A = zeros(nodes,nodes); % initalize with zeros
A(1,1) = 1; A(end,end) = 1; % set 1 for corner elements

for i = 2:nodes-1 % set a 1 -2 1 matrix for every other elements
    A(i,i-1:i+1) = [1, -2, 1];
end

%% Initialize B matrix
B = zeros(nodes,1); % initialize with zeros
B(1) = 0; B(end) = 0; % Boundary conditions

X = linspace(0,L,nodes); % initialize x values
dx = X(2)-X(1); % distance between each X values

for i = 2:nodes-1
    x = X(i); %for each x vale corresponding to the time step
    B(i) = dx^2 * M(x,d,P,L)/EI; % calculate the B for each time step
end

% left division (matrix divison) to calculate y elements (displacement)
y = A\B;



[ymax, idx] = max(abs(y)); % find the maximum displacement
x_sim = X(idx); % the x value when the maximum displacement is at
% print the results on command window
fprintf('The maximum displacement of the beam is %d and occurs at %f\n', ymax, x_sim)

%% theoretical y value
if d > L/2 % for d values larger than L/2 (0.5)
    y_theo = (2*P*d^3*(L-d)^2)/(3*EI*(2*d+L)^2);
else % for d values smaller than L/2
    D = L - d;
    y_theo = (2*P*D^3*(L-D)^2)/(3*EI*(2*D+L)^2);
end

% calculate the error between simulation and theoretical value
error = abs(ymax-y_theo)/abs(y_theo);
fprintf('The relative error using %d  nodes from the calculation is: %f\n', nodes,error);
toc % end of calculating time

%% Nodes = 5
tic % start calculating using 5 nodes
nodes1 = 5; % number of nodes

%% Initialize A, B and calculate displacement y1
% The process for this part is identical to the process for 100 nodes
A1 = zeros(nodes1,nodes1); 
A1(1,1) = 1; A1(end,end) = 1;

for i = 2:nodes1-1
    A1(i,i-1:i+1) = [1, -2, 1];
end

B1 = zeros(nodes1,1);
B1(1) = 0; B1(end) = 0;

X1 = linspace(0,L,nodes1);
dx1 = X1(2)-X1(1);

for i = 2:nodes1-1
    x = X1(i);
    B1(i) = dx1^2 * M(x,d,P,L)/EI;
end

y1 = A1\B1;
[ymax1, idx1] = max(abs(y1));
error1 = abs(ymax1-y_theo)/abs(y_theo);
fprintf('The relative error using %d  nodes from the calculation is: %f\n', nodes1,error1);
toc % end of 5 nodes time
%% Nodes = 10
%% Initialize A, B and calculate displacement y2
% The process for this part is identical to the process for 100 nodes
tic % start counting time for 10 nodes
nodes2 = 10;

A2 = zeros(nodes2,nodes2);
A2(1,1) = 1; A2(end,end) = 1;

for i = 2:nodes2-1
    A2(i,i-1:i+1) = [1, -2, 1];
end

B2 = zeros(nodes2,1);
B2(1) = 0; B2(end) = 0;

X2 = linspace(0,L,nodes2);
dx2 = X2(2)-X2(1);

for i = 2:nodes2-1
    x = X2(i);
    B2(i) = dx2^2 * M(x,d,P,L)/EI;
end

y2 = A2\B2;

[ymax2, idx2] = max(abs(y2));
error2 = abs(ymax2-y_theo)/abs(y_theo);
fprintf('The relative error using %d  nodes from the calculation is: %f\n', nodes2,error2);
toc
%% Plots
plot(X1,y1,'o-') % plot the displacement for 5 nodes

hold on
plot(X2,y2,'o-') % plot the displacement for 10 nodes
plot(X,y,'o-') % %plot the displacement for 100 nodes


plot(X,y_theo*ones(nodes,1)) % plot theoretical value

% Add descriptions to the plot
title('Displacement of Beam vs. Position')
xlabel('x, position [m]')
ylabel('y, displacement [m]')
legend('5 nodes', '10 nodes', '100 nodes', 'theoretical displacement')
hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function result = M(x,d,P,L)
% result = M(x,d,P,L)
%
% Calculate the moment at each point of the bar
%
% Inputs:
% x = the position from the left end of the bar
% d = the position where force P is exerted
% P = the force exerted on the bar
% L = the length of the bar

%% Initialize Moment Calculationg
M0 = (P*d*(L-d)^2)/L^2;
M1 = -(2*P*d^2*(L-d)^2)/L^3;
M2 = (P*d^2*(L-d))/L^2;

%% Calculate Moment
if x >= 0 && x <= d % for x values greater than 0 and less than d
    result = M0 + ((M1-M0)*x)/d;
else % for x values greater than d and less than length L
    result = M1 + ((M2-M1)*(x-d))/(L-d);
end 


end 
