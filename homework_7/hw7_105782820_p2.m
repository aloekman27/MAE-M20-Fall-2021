%{
Name of the script: hw7_105785820_p2.m (Langton's Ant)
    
Descpription: Create a simulation of an ant moving through a designated
    pattern in a grid 
Method: Create a grid and place the ant randomly on the grid. Follow the
    game rules and begin each step the ant takes for every timestep. Write
    each iteration on the grid and save it as a video

Name: Adrian Loekman (aloekman@g.ucla.edu) 
UID: 105785820

%}
%% Front Matter
% Clears all recent codes in command window and workspace
clc; clear all; close all;


%% Initialize Grid
num_rows = 50; % number of rows
num_cols = 50; % number of columns

% Start with A colored grid (grid of zeros)
A = zeros(num_rows, num_cols); % create grid (which is a matrix)

%placing the ant on a random element in the grid
ant_x = randi(50,1); % random x element
ant_y = randi(50,1); % random y element
face = "North"; % the ant faces north on the grid (facing up)

generations = 2000; % generation (time steps)
frames = 2000; % number of frames
% initialize time vector from 0 to the timesteps with the number of frames
T = linspace(0,generations,frames);

%% Create video
v = VideoWriter('LangtonAnt.avi'); % create a video with a particular filename
open(v); % open the video in the appropriate application

colors = zeros(1,3); %initalize vector to calculate color proportions


%% Time marching loop
% RULES OF THE GAME
% 1. if the color is A, turn 90 clockwise and turn A into B, move forward 1
%   step
% 2. if the color is B, turn 90 clockwise and turn B into C, move forward 1
%   step
% 3. if the color is C, turn 90 counter-clockwise and turn C into D, move 
%   forward 1 step
% 4. if the color is D, turn 90 counter-clockwise and turn D into A, move 
%   forward 1 step
% color A = 0
% color B = 1
% color B = 2
% color B = 3
for i = 1:frames % analyze ant position for each timestep
    if A(ant_x,ant_y) == 0 || A(ant_x,ant_y) == 1 % if ant on color A or B
        if face == "North" % turn 90 clockwise from initial heading
            face = "East";
        elseif face == "East" % turn 90 clockwise from initial heading
            face = "South";
        elseif face == "South" % turn 90 clockwise from initial heading
            face = "West";
        else % turn 90 clockwise from initial heading
            face = "North";
        end
        
        if A(ant_x,ant_y) == 0 % if color A, change to color B
            A(ant_x,ant_y) = 1;
        else % if color B, change to color C
            A(ant_x,ant_y) = 2;
        end 
        
    % if ant's position is on color C or D
    elseif A(ant_x,ant_y) == 2 || A(ant_x,ant_y) == 3 
        if face == "North" % turn 90 counter-clockwise from heading
            face = "West";
        elseif face =="West" % turn 90 counter-clockwise from heading
            face = "South";
        elseif face == "South" % turn 90 counter-clockwise from heading
            face = "East";
        else % turn 90 counter-clockwise from heading
            face = "North";
        end
        
        if A(ant_x,ant_y) == 2 % if color C, change to color D
            A(ant_x,ant_y) = 3;
        else % if color D, change to color A
            A(ant_x,ant_y) = 0;
        end
    end
    
    %% Position Changes
    
    if face == "North" % move up one row element
        ant_x = ant_x - 1;
    elseif face == "East" % move right one column element
        ant_y = ant_y + 1;
    elseif face == "South" % move down one row element
        ant_x = ant_x + 1;
    elseif face == "West" % move left one column element
        ant_y = ant_y - 1;
    end
    
    %% Apply Wrap Around Condition
    if ant_x == 0 % if ant row position on 0, go to 50
        ant_x = 50;
    end
    if(ant_y == 0) % if ant column position on 0, go to 50
        ant_y = 50;
    end
    if(ant_x == 51) % if ant row position on 51, go to 1
        ant_x = 1;
    end
    if(ant_y == 51) % if ant column position on 51, go to 1
        ant_y = 1;
    end
    
    %% Draw Ant's Position on the grid
    clims = [0 3]; % use 4 indicator as colors
    imagesc(A, clims); % draw image on grid
    title(sprintf('Frames = %d',i)); % update for every timestep
    drawnow(); % draw image
            
    %% Color Proportion Find
    for j = 1:3
        colorFind = find(A == j); % find elements that correspond to each color
        colors(i,j) = sum(colorFind(:))/(num_cols * num_rows); % sum the colors proportional to the grid
        
    end
    % get video data 
    antVideo = getframe;
    writeVideo(v,antVideo.cdata);
    
end
% end video and grid image
v.close();

%% Plots

plot(T, colors(:,1)); % plots proportion of color B throughout iteration
hold on; 
plot(T, colors(:,2)); % plots proportion of color C throughout iteration
plot(T, colors(:,3)); % plots proportion of color D throughout iteration
% Add descriptions to the plot
title('Proportion of Colors')
xlabel('Time')
ylabel('Portion of Colored Boxes')
legend('Color B', 'Color C', 'Color D')