% Name: Adrian Loekman (aloekman@g.ucla.edu) 
% UID: 105785820
function dxdt = dynamicsSIR(x, mesh, alpha, beta, gamma)
% dxdt = dynamicsSIR(x, mesh, alpha, beta, gamma)
%
% dynamicsSIR Compute the rate of change of the model
%
% Inputs:
% x: vectorized state
% mesh: the underlying mesh
% alpha, beta, gamma: model parameters
%
% Output:
% dxdt: vectorized time derivative of state

% Calculate the length of the mesh (rows)
N = length(mesh); % length(x/3)

% Reshape vector x into N rows of [S,I,R]

% reshape the values so that it is in a form S I R in that order
x = reshape(x, [N,3]);

% preallocate vectors for values of dxdt = dSdt, dIdt, dRdt
derivatives = zeros(N,3);
%[dS1/dt, dI1/dt , dR1/d1;
% dS2/dt, dI2/dt , dR2/d1
% dS3/dt, dI3/dt , dR3/d1
% ...
% dSN/dt, dIN/dt , dRN/d1

%% Time Marching Loop
% This will create an Nx3 matrix with each dxdt value which will be solved
for i = 1:N
    M = numel(mesh(i).neighbors); % calculate the number of neighbors in an element
    neighborContribution = 0; % initialize neighbor contribution
    for j = 1:M % evaluating each neighbor of a node to calculate neighbor contribution
    neighborContribution = neighborContribution + (alpha/M)*... % calcualte the neighbor contribution
        (x(mesh(i).neighbors(j),2)/(norm(mesh(mesh(i).neighbors(j)).location - mesh(i).location))); 
    end 
    derivatives(i,1) = - (beta * x(i,2) + neighborContribution) * ...
        x(i,1); % the derivative of S, dSdt
    derivatives(i,2) = + (beta * x(i,2) + neighborContribution) * ...
        x(i,1) - gamma * x(i,2); % the derivative of I, dIdt
    derivatives(i,3) = + gamma * x(i,2); % the derivative of R, dRdt
    
end 

% Vectorize derivatives [S1 S2 S3 .. SN I1 I2 I3 .. IN R1 R2 R3 .. RN]
dxdt = derivatives(:); % setup the value of dxdt so that it is only in 1 column


end 
