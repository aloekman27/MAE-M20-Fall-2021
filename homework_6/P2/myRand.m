% Name: Adrian Loekman (aloekman@g.ucla.edu) 
% UID: 105785820
function x = myRand()
%
% Outputs a random real number from 0 to 3 
%
% Outputs:
% x: the random sample drawn from p(x)

y = rand(); % output a random real number from 0 to 1


x = 3-3*sqrt(1-y); % the inverse function of customized probability 
                   % distribution function p(x)

end 