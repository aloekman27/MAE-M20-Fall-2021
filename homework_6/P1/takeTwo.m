% Adrian Loekman (aloekman@g.ucla.edu)
% UID: 105785820
function [win2,lose2] = takeTwo(twoPoint,regOffRebound,oppFreeThrow,ftOffRebound,winOvertime,simulation)
% [win2,lose2] = takeTwo(twoPoint,regOffRebound,oppFreeThrow,ftOffRebound,winOvertime,simulation)
%
% Calculates the number of wins and losses using two point strategy
%
% Inputs:
% twoPoint: two point percentage
% regOffRebound: team regular rebound percentage
% oppFreeThrow: opponent free throw percentage
% ftOffRebound: opponent free throw rebound percentage
% winOvertime: overtime win percentage
% simulation: number of simulations
%
% Outputs:
% win2 = number of wins
% lose2 = number of losses

win2 = zeros(1,3); % preallocate vector for wins
lose2 = zeros(1,3); % preallocate vector for losses

for z = 1:3 % create a loop for each simulation
    sim = simulation(z);
    m = 1; % start at iteration 1
while m <= sim
    timeRemain = 30; % time remaining in seconds
    posession = true; % team has the ball posession
    downBy = 3; % down by 3 points
    makeFT = 0; % initial free throws made by opponent
    while timeRemain > 0 % while the game time is still going
        if posession == true % if we have posession
            if twoPoint >= randi(100) % if two point is made
                if timeRemain > 24 %time becomes 24 if time is more than 30
                    timeRemain = 24;
                else % if less time remain is subtracted by 5
                    timeRemain = timeRemain - 5;
                end 
                downBy = downBy - 2; % downBy less 2
                posession = false; % poession goes to opponent
            else  % if two point is not made but got rebound
                if regOffRebound >= randi(100)
                    timeRemain = timeRemain - 5; % time to make 2 point
                    posession = true; % team has posession
                else % do not get rebound
                    timeRemain = timeRemain - 5;% time to make 2 point
                    posession = false; % opponent has posession
                end
            end
            if downBy <= 2 % if we have posession and down by 2 or less, buzzer beater
                timeRemain = 0; % run down time to 0
                if twoPoint >= randi(100) % make two point
                    downBy = downBy - 2; % down by less 2
                end
             
            end
                  
        end
        
        if posession == false % opponent has posession
            timeRemain = timeRemain - 5; % time to foul opponent
            if oppFreeThrow(1) >= randi(100) % opponent 1st FT if in
                downBy = downBy + 1;
                makeFT = makeFT + 1;
            end 
            if oppFreeThrow(2) >= randi(100) % opponent 2nd FT if in
                downBy = downBy + 1;
                makeFT = makeFT + 1;
            else % if opponent does not make 2nd free throw, rebound
                if ftOffRebound >= randi(100) %  opponent gets rebound
                    posession = false; % opponent has posession
                else % team gets rebound
                    posession = true; % team has posession
                end 
            end 
            
        end
%         if makeFT < 2 && posession == true && downBy < 3 % if opponent makes less than 2 FT and team has posession
%              timeRemain = 0; % hold the ball until 
%              if twoPoint >= randi(100) % two point buzzer beater
%                  downBy = downBy - 2; % downby less 2
%              end 
%         end
    end
    
    if downBy > 0 % if down by more than 0, team loses
            lose2(1,z) = lose2(1,z) + 1; % update loss
        elseif downBy < 0 % if down by less than 0, team wins
            win2(1,z) = win2(1,z) + 1; % update win
        else % go to overtime
            if winOvertime >= randi(100) % win in overtime
                win2(1,z) = win2(1,z) + 1;  % update win
            else % lose in overtime
                lose2(1,z) = lose2(1,z) + 1; % update loss
            end 
     end 
       
    
    m = m + 1; % update iteration
end
end
  
            
end

