%{
Name of the script: hw4_105785820_p2.m (Resonance problem: mass-spring-damper system)
    
Descpription: Use semi-implicit Euler to solve a second order differential
    equation, then, plot three different graphs in the same figure with 
    different values of omega ( 3 rad/s, 1 rad/s, sqrt(k-c) rad/s). This
    problem also includes damping.
Inputs: mass (m), spring constant (k), force applied (fc), omega (w), step
    size (h), time (t), damping coefficient (c)
Outputs: 2 figures with plots. The first figure uses omega = 3. The second
    figure uses omega = 3, 1, and sqrt(k-c) in the same plot and figure
    window
Method: Discretizing the second order differential equation using
    semi-implicit euler method by hand. Then, set variables for known values,
    time, time-step, and declare arrays. Use the for loop to solve for each
    known omega value and the value of x for each time step. Lastly, plot 
    the graph on figures

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
c = 0.2; % Damping Coefficient (N*s/m)
w = [3 1 sqrt(k-c)]; % Angular velocity (rad/s)
h = 0.001; % time step size

%% Declare the arrays: Time, Force, Velocity, and Position
t = 0:h:50; % time (seconds)
n = numel(t); % number of elements, t
ft = zeros(n,3); % Force Applied, 3 columns for 3 different omega
x = zeros(n,3); % Position, 3 columns from 3 different omega
v = zeros(n,3); % Velocity, 3 columns from 3 different omega
 

%% Initial Condition
%t(1) = 0
v(1,:) = 0; % all carts are static at x = 0, t = 0

%% Time Marching Loop
for j = 1:3 % the omega given
    omega = w(j); % set omega as j for each loop
    for i = 1:n-1 % i is each step taken for each time loop
        ft(i,j) = fc*cos(omega*t(i)); % find ft for each time and omega
        v(i+1,j) = ((ft(i,j)-c*v(i,j) - k*x(i,j))/m) * h + v(i,j); %velocity (explicit euler)
        x(i+1,j) = v(i+1,j)*h + x(i,j); % position (semi-implicit euler)
    end 
end

%% Plot
figure (1) % 1st figure window
plot(t,x(:,1),'r.-') % plot the first column (omega = 3)
axis([0 50 -20 20]) % set axis equal to other suplot for better observation
title('Position vs. Time; Omega = 3') % subplot title
xlabel('time, t [seconds]') % xlabel on subplot
ylabel('position, x(t) [meters]') % ylabel on subplot
legend('omega = 3', 'location', 'best') % legend indicating the value of omega
box on % set boundaries for top bodrder
grid on % turn on grid to view the plot better

figure (2) % 2nd figure window
plot(t,x(:,1),'r-','LineWidth', 3)% plot the first column (omega = 3)
hold on
plot(t,x(:,2),'b-','LineWidth', 3)% plot the second column (omega = 1)
plot(t,x(:,3),'g-','LineWidth', 3)% plot the third column (omega = sqrt(k-c))
title('Position vs. Time; Omega = 3, 1, and sqrt(k-c)') % subplot title
xlabel('time, t [seconds]') % xlabel on subplot
ylabel('position, x(t) [meters]') % ylabel on subplot
legend('omega = 3','omega = 1','omega = sqrt(k-c)', 'location', 'best') % legend indicating the value of omega
box on
grid on

