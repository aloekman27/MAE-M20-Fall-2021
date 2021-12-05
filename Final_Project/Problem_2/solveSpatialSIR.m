% Name: Adrian Loekman (aloekman@g.ucla.edu) 
% UID: 105785820
function [t,x] = solveSpatialSIR(tFinal, mesh, initialCondition, ...
    alpha, beta, gamma, odeSolver)
% solveSpatialSIR Solve the spatial SIR model
% Inputs:
% tFinal: end time for the simulation (assuming start is t=0)
% mesh: the underlying mesh
% initialCondition: a Nx3 matrix that sums to 1 in third dimension
% alpha, beta, gamma: model parameters
% odeSolver: a function handle for an ode45-compatible solver
% Outputs:
% t: a vector of the time-steps
% x: Nx3xlength(t) matrix representing the state vs. time

% Get system of differential equation from dynamicsSIR function
dSIRdt = @(t,x) dynamicsSIR(x, mesh, alpha, beta, gamma);

% solve the system of differential equation using an ODE Solver
[t,y] = odeSolver(dSIRdt, [0 tFinal], initialCondition(:));

N = length(mesh); % mesh length
% fprintf('Number of nodes = %d\n', N);
Nsteps = length(t); % time length
% fprintf('Number of timesteps = %d\n', Nsteps)
% fprintf("Size of y is:");
% disp(size(y));

% Preallocate values for solutions,x
x = zeros(N, 3, Nsteps);

% Time marching loop to put values on x (solutions) in time steps
for i = 1 : Nsteps
    
    local_sol = y(i,:); %S,I,R values at i-th step
    
    reshaped_sol = reshape(local_sol, [N,3]); % Nx3 matrix
    
    x(:,:,i) = reshaped_sol; % update values for solution
  
    
end

end