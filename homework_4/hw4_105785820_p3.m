%{
Name of the script: hw4_105785820_p3.m (Resonance problem:implicit Euler)
    
Descpription: This script uses implicit Euler method and Newton Method to
    solve a second order differential equation. Then, plot the graph of the
    position and time with different values of omega.
Inputs: mass (m), spring constant (k), force applied (fc), omega (w), step
    size (h), time (t), damping coefficient (c)
Outputs:  2 figures with plots. The first figure uses omega = 3. The second
    figure uses omega = 3, 1, and sqrt(k-c) in the same plot and figure
    window
Method: Discretizing the second order differential equation using
    semi-implicit euler method by hand. Then, set variables for known values,
    time, time-step, and declare arrays. Then, use Newton's Method to guess
    a new vector q that will be calculated to get the value of the new
    x(i+1) and v(i+1). Plot the graph

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
h = 0.01; % time step size

%% Declare the arrays: Time, Force, Velocity, and Position
t = 0:h:50; % time (seconds)
n = numel(t); % number of elements, t
ft = zeros(n,3); % array for ft values with 3 different omega
x = zeros(n,3); % array for position values with 3 different omega
v = zeros(n,3); % array for velocity values with 3 different omega

%% Initial Conditions
% Initial conditions are 0 for all x(0) and v(0) thus, using zeros already
% makes it 0.

%% Time Marching Loop
for j = 1:3 % this for loop is to change each omega value 
    omega = w(j);
    for i = 1:n-1 % calculate for each time step
        q = [x(i,j); v(i,j)]; %initial guess at t(i+1)
         % the value of the force Ft
        ft(i,j) = fc*cos(omega*t(i)); 
        
        funct = [m * ((q(2) - v(i,j))/h) + c*q(2) + k*q(1) - ft(i,j);
                q(2) - ((q(1)-x(i,j))/h)]; % discretized function from f1 and f2
       J = [k, m/h + c; -1/h, 1]; % jacobian 2x2 matrix
    
        err = 1; % a starting error value
    
        % loop keeps running until the error is very close to 0
        while err > 1e-6
            dq = J\funct; % calculate delta q using the jacobian
            q = q - dq; % calculate the new q value
        
            funct = [m * ((q(2) - v(i,j))/h) + c*q(2) + k*q(1) - ft(i,j);
                q(2) - ((q(1)-x(i,j))/h)]; % calculate the discretized function using the new q
            err = norm(funct); % calculate the error which is the norm of funct
        end 
        % update the values of x and v using values from q
        x(i+1,j) = q(1);
        v(i+1,j) = q(2);
    
    end
end

%% Plot
figure(1) 
plot(t,x(:,1),'r-','LineWidth', 2) % plot the graph with omega = 3
xlabel('time, t [seconds]') % xlabel on subplot
ylabel('position, x(t) [meters]') % ylabel on subplot
title('Position vs. Time with omega = 3')
legend('omega = 3')
axis([0 50 -15 15])
grid on 
box on

figure(2)
plot(t,x(:,1),'r-','LineWidth', 2) % plot the graph with omega = 3
hold on
plot(t,x(:,2),'g-','LineWidth', 2) % plot the graph with omega = 1
plot(t,x(:,3),'b-','LineWidth', 2) % plot the graph with omega = sqrt(k-c)
title('Position vs. Time; Omega = 3, 1, and sqrt(k-c)') % subplot title
xlabel('time, t [seconds]') % xlabel on subplot
ylabel('position, x(t) [meters]') % ylabel on subplot
legend('omega = 3','omega = 1','omega = sqrt(k-c)', 'location', 'best') % legend indicating the value of omega
grid on 
box on
