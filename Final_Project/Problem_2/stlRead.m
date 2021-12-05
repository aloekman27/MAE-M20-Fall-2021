% Name: Adrian Loekman (aloekman@g.ucla.edu) 
% UID: 105785820
function mesh = stlRead(fileLocation)
% mesh = stlRead(fileLocation)
%
% stlRead takes the location a modified stl file (.txt format) is ...
% stored, reads the file, and finds the required parameters.
%
% Input:
% fileLocation: location of the tab delimited .txt file to be read
%
% Output:
% mesh: an array of structs representing the vertices. Each ...
% element has members "location" and "neighbors". "location" is a 1x3 ...
% array of x, y, z coordinates, and "neighbors" is an array of indices ...
% of the point's neighbors.

%% Preallocations 
% load data from the fileLocation with tab as a delimiter
data = readcell(fileLocation,"delimiter", "\t");
M = length(data); % calculate the length of the data
i = 1; % initialize i
j = 1; % initialize j
B = zeros(M,3); % preallocate matrix to store corners
% preallocate mesh struct 
mesh = struct('location', cell(M,1),'neighbors', cell(M,1));

%% Time Marching Loop
while i < M % for every row in the data find the "corner"
    if data(i) == "corner" % store the corner points to matrix b
        B(j,:) = cell2mat(data(i,2:end));
        j = j + 1; % update j
        i = i + 1; % update i
    else % if the row is not a corner, disregard it
    
    i = i + 1; % update i
    end
    
end

B(j:end,:) = []; % delete unused rows in b

% create a new variable for the matrix B without repeating nodes. 
C = unique(B,'rows','stable');

% store each row of C onto the mesh struct
for k = 1:length(C)
    mesh(k).location = C(k,:);

end

% Storing the neighbors 

for face = 1:3:length(B) % time loop for each 3 nodes because they're one group

    c1 = B(face, :); % set c1 as the first row
    c2 = B(face + 1, :); % set c2 as the second row 
    c3 = B(face + 2, :); % set c3 as the third row

    % find the index of each c1, c2, and c3 in matrix array C
    [~,indC1] = ismember(c1, C, 'rows');
    [~,indC2] = ismember(c2, C, 'rows');
    [~,indC3] = ismember(c3, C, 'rows');

    % update the neighbor struct with the indexes that match 
    mesh(indC1).neighbors = union(mesh(indC1).neighbors,[indC2; indC3]);
    mesh(indC2).neighbors = union(mesh(indC2).neighbors,[indC1; indC3]);
    mesh(indC3).neighbors = union(mesh(indC3).neighbors,[indC2; indC1]);
end

% delete unused rows in the struct
mesh(1179:end) = [];

end