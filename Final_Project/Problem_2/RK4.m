% Name: Adrian Loekman (aloekman@g.ucla.edu) 
% UID: 105785820
function [t, y] = RK4(f, tspan, y0)
% [t, y] = RK4(f, tspan, y0)
%
% RK4 Bogacki-Shampine method of RK4 with adaptive step size
%
% Inputs:
% f: function handle of f(t, y)
% tspan: the time period for simulation (should be a 1x2 array ...
%           contain start time and end time)
% y0: the initial conditions for the differential equation
%
% Outputs:
% t: corresponding time sequence as a T x 1 vector
% y: the solution of the differential equation as a T x n matrix, ...
%           where T is the number of time steps and n is the dimension of y

% Preallocate array for t and y 
t = []; y = [];
i = 1; % set iteration starting from 1
t(i) = tspan(1); % set 1st element of t as the left tspan 
tf = tspan(2); % set the last element of the t from tspan

y(:,1) = y0; % initial conditions into the 1st row
h0 = 0.1; % set h0
e0 = 1e-4; % set e0

tk = t(1); % initiate a value for tk from the 1st value of t
yk = y(:,1); % initiate yk as a value from y0

%% Time Marching Loop

% set a while loop while tk is less than tf
while tk < tf
%     yk = yk'; % transpose yk so it could be matrix multiplied
    h0 = min(h0, tf-tk); % determine the value of h0 
    t_new = tk + h0; % next t value 
    k1 = f(tk,yk); % 1st k from method
    k2 = f(tk + (1/2)*h0,yk + (1/2)*h0*k1); % 2nd k from method
    k3 = f(tk + (3/4)*h0,yk + (3/4)*h0*k2); % 3rd k from method
    y_new = yk + ((2/9)*h0*k1) + ((1/3)*h0*k2) + ((4/9)*h0*k3); % new y value(s)
    k4 = f(tk+h0,y_new);% calculate k4 using the new y value
    z_new = yk + ((7/24)*h0*k1) + ((1/4)*h0*k2) + ((1/3)*h0*k3) + ((1/8)*h0*k4);
    % z value to calculate the value of e(k+1)
    
    % Put t and y into each respsective array
    t(i+1) = t_new;
    y(:,i+1) = y_new;
    
    % calculate the new e value
    e_new = norm((y_new) - (z_new), 2);
    % from the e value calculate the next step (not constant)
    h_new = h0*(e0/e_new)^0.2;
    
    % set the new values to tk, yk, h0 for the new iteration
    tk = t_new;
    yk = y_new;
    h0 = h_new;
    
    % update iteration
    i = i + 1;
    
end
% transpose t to get nx1 array
t = t';
y = y';
end