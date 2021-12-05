% Name: Adrian Loekman (aloekman@g.ucla.edu) 
% UID: 105785820
function plotTimeSeries(mesh, t, X, coord)
% plotTimeSeries(mesh, t, X, coord)
%
% plotTimeSeries: a function that plots and saves the local S.I.R ...
% distribution at spatial coordinate (x, y, z).
%
% Inputs:
% mesh: an struct of mesh information of the triangulated surface
% t: a vector of time steps
% X: an N*3*length(t) matrix, where each point in the M*3 space
% corresponds to a local S.I.R. model with states whose values ...
% are between 0 and 1. This 2D matrix is repeated for each time step, ...
% making it a 3D matrix.
% coord: a 1*3 vector of local vertex's coordinate
%
% Outputs:
% This function has no outputs


Nc = length(X); % calculate the length of the 3-d array
t0 = t(1); % 1st time element
tf = t(end); % last time element

%% Time Marching Loop
for i = 1:Nc % Loop for every element
    % If the element is the monitored location then plot graph
    if mesh(i).location == coord
        A = length(X(i,:,:)); % reshape into a m*n array
        new = reshape(X(i,:,:),[3,A]); % reshape array to a 2-d array 
        B = sprintf('%.2f, ', coord(1:2)); % for the title
        C = sprintf('%.2f ', coord(3)); % for the title
        
        % Plotting
        plots = figure; % set variable for figure 
        
        subplot(3,1,1) % 1st subplot
        plot(t, new(1,:),'b-') % S rate
        title(['Local SIR Distribution at Spatial Coordinate (', B,C,')'])
        xlabel('time')
        ylabel('Susceptible Ratio')
        xlim([t0 tf])
        grid on
        
        
        subplot(3,1,2) % 2nd subplot
        plot(t, new(2,:),'r-') % I rate
        xlabel('time')
        ylabel('Infected Ratio')
        xlim([t0 tf])
        grid on
        
        subplot(3,1,3) % 3rd subplot
        plot(t, new(3,:),'g-') % R rate
        xlabel('time')
        ylabel('Recovered Ratio')
        xlim([t0 tf])
        grid on
        
    end
    
    
    
end
    % save plot to a png file. 
    saveas(plots,sprintf('time_series_%.2f_%.2f_%.2f.png',coord(1),coord(2),coord(3)))
      

end 