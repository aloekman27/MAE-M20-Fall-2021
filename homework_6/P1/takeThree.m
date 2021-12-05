% Adrian Loekman (aloekman@g.ucla.edu)
% UID: 105785820
function [win1,lose1] = takeThree(threePoint,winOvertime,simulation)
% [win1,lose1] = takeThree(threePoint,winOvertime,simulation)
%
% Calculates the number of wins if uses three point strategy
%
% Inputs: 
% threePoint: three point percentage
% winOvertime: winning in overtime percentage
% simulation: number of simulations (300,1000,2000)
%
%
% Outputs:
% win1: number of wins
% lose1: number of losses


win1 = zeros(1,3); % preallocate vector for wins
lose1 = zeros(1,3); % preallocate vector for losses
for i = 1:3 % create a loop for each simulation
    sim = simulation(i);    
    n = 1; % start at simulation 1
    while n <= sim
    if threePoint >= randi(100) % if three point is made game goes to overtime
        if winOvertime >= randi(100) % win in overtime
            win1(1,i) = win1(1,i) + 1; % update win
        else % lose in overtime
            lose1(1,i) = lose1(1,i) + 1; % update loss 
        end  
    else 
        lose1(1,i) = lose1(1,i) + 1; % did not make three point
    end 
        n = n+1; % update simulation
    end
end
end 