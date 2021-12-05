%{
Name of the script: hw2_105785820_p2.m (Day of the Week)
    
Descpription: This script m-file uses if else statements and a simple
 algorithm to print the day of the week using month, date, and year
Inputs: user inputs values for 3 variables
- month : user inputs month with first three letters (eg. JAN)
- date : user inputs date with 2 digits (eg. 01)
- year : user inputs year with 4 digits (eg. 2000)
Outputs: Prints the month, date, and year the user has input and the day of
the week corresponding to the inputs
- monotone: f' does not have real distinct roots
- simple: f(r1)*f(r2) < 0
- neither : the opposite of simple. 
Method: Validate all user inputs. Provide each month with the correct days
 in each month. Then, use the algorithm provided to determine the number
 for each day of the week. Print the date along with the day of the week.

Name: Adrian Loekman (aloekman@g.ucla.edu) 
UID: 105785820

%}
%% Front Stuff
% Clears all recent codes in command window and workspace
clc;
clear all;

%% Inputs
% User inputs month, day, and year using the correct format shown
month = input('Please enter the month as MMM (e.g. JAN): ','s'); %string
day = input('Please enter the day as DD (e.g. 01): '); %double
year = input('Please enter the year as YYYY (e.g. 2000): '); %double


%% Input Validations
% validate that the year input is only from 1 to 9999 using if statement
if year < 0 || year > 9999
    error('Please input valid year'); 
end

% validates the input so that it is correct with the number of days in each
% month
if strcmp(month,'JAN') || strcmp(month,'MAR') || strcmp(month,'MAY') || ...
        strcmp(month,'JUL') || strcmp(month,'AUG') || strcmp(month,'OCT')...
        || strcmp(month,'DEC')
    if day < 1 || day > 31 %in these months, there are only 31 days
            error('Please input a valid day');
    end 
elseif strcmp(month,'APR') || strcmp(month,'JUN') || strcmp(month,'SEP') || ...
        strcmp(month,'NOV') 
    if day < 1 || day > 30 %in these months, there are only 30 days
            error('Please input a valid day');
    end 
elseif strcmp(month,'FEB')
    % Use a new variable for month February so that it could account for
    % leap years
    startLeapFlag = 0;
    % If statements for leap year conditions
    if (mod(year,4) == 0 && mod(year,100) ~= 0) || ( mod(year,400) == 0)
    startLeapFlag = 1; % new variable if leap year conditions are true
    end
    % add the variable next to the day so it automatically adds 1 day if
    % it's a leap year
    if day < 1 || day > (28 + startLeapFlag) 
        error('Please Input a Valid day');
    end
else 
    % prints error if unreasonable value is inputted
    error('Please input a valid month');
    
end   

%% Calculations
% Calculations with algorithm to find the day of month


d = day; %set a new variable for the day of the month

% Change the month from string into a double (1 = January, 2 = February,
% ..., 12 = December)
if strcmp(month,'JAN')
    monthNum = 1;
elseif strcmp(month,'FEB')
    monthNum = 2;
elseif strcmp(month,'MAR')
    monthNum = 3;
elseif strcmp(month,'APR')
    monthNum = 4;
elseif strcmp(month,'MAY')
    monthNum = 5;
elseif strcmp(month,'JUN')
    monthNum = 6;
elseif strcmp(month,'JUL')
    monthNum = 7;
elseif strcmp(month,'AUG')
    monthNum = 8;
elseif strcmp(month,'SEP')
    monthNum = 9;
elseif strcmp(month,'OCT')
    monthNum = 10;
elseif strcmp(month,'NOV')
    monthNum = 11;
else
    monthNum = 12;
end 
    
% Set variable for the shifted month calculated as below
m = mod((monthNum + 9), 12) + 1;

% Special case for January and February to use the algorithm correctly
if strcmp(month,'JAN') || strcmp(month,'FEB')
    year = year - 1; %subtract 1 year from the user input
    y = mod(year,100); % variable for the last 2 digits of the year
    c = floor(year/100);%variable for the first two digits of the year 
else % Other months can use this for the algorithm
    y = mod(year,100);
    c = floor(year/100);
end

%% Algorithm
% The Algorithm used to calculate the day of the week
% The output of w is a number from 0 to 6 where 0 is Sunday and 6 is
% Saturday
w = mod((d + floor(2.6*m - 0.2) + y + floor(y/4) + floor(c/4) - 2*c),7);

% Set the year for the special case (January and February) back into the
% user's input
if strcmp(month,'JAN') || strcmp(month,'FEB')
    year = year + 1;
end 
    
%% Day of the Week
% Change the numbers from variable w into a string that corresponds to each
% day it represents
if w == 0
    dayOfWeek = 'Sunday';
elseif w == 1
    dayOfWeek = 'Monday';
elseif w == 2
    dayOfWeek = 'Tuesday';
elseif w == 3
    dayOfWeek = 'Wednesday';
elseif w == 4
    dayOfWeek = 'Thursday';
elseif w == 5 
    dayOfWeek = 'Friday';
else 
    dayOfWeek = 'Saturday';
end 

% Add a 0 in front of the date when day is 1 <= day < 10
if day>= 1 && day < 10
    day = sprintf('0%d', day); % switch day into string and input 0 in
else 
    day = sprintf('%d', day); % else day would be the same but now a string
end

%add characters to year so that the format is still YYYY (year is a string now)
if year >= 1 && year < 10 % year only consists of 1 digit
    year = sprintf('000%d', year); % add three zeros to year
elseif year >= 11 && year < 100 % year only consists of 2 digits
    year = sprintf('00%d', year); % add two zeros to year
elseif year >= 101 && year < 1000 % year only consists of 3 digits
    year = sprintf('0%d', year); % add 1 zero to year
else % year is already 4 digits
    year = sprintf('%d', year); %print year 
end
    

%% Output
% Outputs the month, day, and year along with the day of the week
fprintf('%s %2s %4s is a %s\n', month, day, year, dayOfWeek);


     

