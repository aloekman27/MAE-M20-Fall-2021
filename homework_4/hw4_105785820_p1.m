%{
Name of the script: hw4_105785820_p1.m (Resonance problem: mass-spring system)
    
Descpription: Use semi-implicit Euler Method to Solve a second order
    differential equation, which is Resonance. Then, plot two different
    graphs in the same figure with different values of omega ( 3 rad/s and
    sqrt(10) rad/s)
Inputs: mass (m), spring constant (k), force applied (fc), omega (w), step
    size (h), time (t)
Outputs: 2 plots in the same figure each showing how the position of the
    system is changing as the time increases with different values of omega.   
Method: Solve the second order differential equation using semi-implicit
    Euler method by hand. Then, create the discretized formula on MATLAB. After
    writing all inputs and time values, use for loop to solve the differential
    equation with each time step for both conditions (varying the value of
    omega). Lastly, plot the graph on the same figure as the output. 

Name: Adrian Loekman (aloekman@g.ucla.edu) 
UID: 105785820

%}
%% Front Matter
% Clears all recent codes in command window and workspace
clc; clear all; close all;

%% Parameters
m = 1; % mass (kg)
k = 10; % spring constant (N/m)
fc = 10; % Force Applied (Newtons)
w = [3 sqrt(10)]; % Angular velocity (rad/s)
h = 0.01; % time step size

%% Declare the arrays: Time, Force, Velocity, and Position
t = 0:h:80; % time (seconds)
n = numel(t); % number of elements, t
ft = zeros(n,2); % Force F(t) for part b in 1st column anc c in 2nd column
x = zeros(n,2); % Position for part b in 1st column anc c in 2nd column
v = zeros(n,2); % velocity (dx/dt) for part b in 1st column anc c in 2nd column


%% Initial Condition
%t(1) = 0
v(1,1) = 0; % dx/dt at t = 0
v(1,2) = 0; 

%% Time Marching Loop
for j = 1:2 % number of omega given
    omega = w(j); % for each loop change the value of omega according to j
    for i = 1:n-1 % each point is in row i and in column j
        ft(i,j) = fc*cos(omega*t(i)); %force applied F(t)
        v(i+1,j) = v(i,j) + ((ft(i,j) - k*x(i,j))/m) * h; % Velocity dx/dt
        x(i+1,j) = x(i,j) + h*(v(i+1,j)); % Position x(t)
    end 
end

%% Plot
figure(1); % figure 1 is the window for all figures
box on

subplot(2,1,1) % 1st plot in figure 1
plot(t,x(:,1),'b-') % plot time vs x(t) when omega = 3
title('Position vs. Time; Omega = 3') % subplot title
xlabel('time, t [seconds]') % xlabel on subplot
ylabel('position, x(t) [meters]') % ylabel on subplot
legend('omega = 3', 'location', 'best') % legend indicating the value of omega
axis([0 80 -150 150]) % set axis so all subplots has the same axis

grid on % turn on grid to view the plot better
subplot(2,1,2) % 2nd plot in figure 1
plot(t,x(:,2),'r-') % plot time vs x(t) when omega = sqrt(10)
title('Position vs. Time; Omega = sqrt(10)') % subplot title 
xlabel('time, t [seconds]') % xlabel on subplot
ylabel('position, x(t) [meters]') % ylabel on subplot
legend('omega = sqrt(10)', 'location', 'best') % legend indicating the value of omega
grid on


