% Name: Adrian Loekman (aloekman@g.ucla.edu) 
% UID: 105785820
function animate(mesh, t, X)
% animate(mesh, t, X)
%
% animate: a function that shows the change in the ratio of susceptible,
%          infected, and recovered individuals in the grid as an image.
%
% Inputs:
% mesh : an struct of mesh information of the triangulated surface
% t   : the time vector
% X: an N*3*length(t) matrix, where each Nx3 matrix corresponds to
% the state of the S.I.R. system at a particular instance in time.
% This 2D matrix is repeated for each time step, making it a 3D matrix
%
% Output: this function does not output anything.


N = length(mesh); % Number of Nodes

%% Initialization
coord = zeros(N,3); % coordinates of nodes
color = zeros(size(X)); % colors representing S, I, R

%% Time Marching loop
for i = 1:N % for each coordinate row, change with values with mesh location
    coord(i,:) = mesh(i).location; % results will be a matrix
end 

%% Initiate color from 3d data
color(:,1,:) = X(:,2,:); % red for infected
color(:,2,:) = X(:,3,:); % Green for recovered
color(:,3,:) = X(:,1,:); % Blue for susceptible

%% Plot
figure; % figre will be 3d
currT = 0; % current Time
d = 20; % set d

%% Time Marching Loop 2
% Create animation where the colors would change throughout figure
for i = 1 : length(t)
    if t(i) >= currT
        % pcshow creates a 3-d point cloud with 500 marker size
        pcshow(coord, color(:,:,i), 'MarkerSize', 500);
        % Label the axis
        xlabel('X');
        ylabel('Y');
        zlabel('Z');
        pause(0.1); % show change every 0.1s
        drawnow; % draw new animation every iteration
        currT = currT + 0.1 * d; % update time 
        
    end
end 

end 