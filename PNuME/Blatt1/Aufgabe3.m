clc;
clear;

% nodes = zeros(9,2);
% ndoes(1,:) = [-1,-1];
% ndoes(2,:) = [0,-1];
% ndoes(3,:) = [1,-1];
% ndoes(4,:) = [-1,0];
% ndoes(5,:) = [0,0];
% ndoes(6,:) = [1,0];
% ndoes(7,:) = [-1,1];
% ndoes(8,:) = [0,1];
% ndoes(9,:) = [1,1]; I have made a foolish mistake here. which is ndose
% and nodes...

elements = zeros(4,4);
elements(1,:) = [1,2,5,4];
elements(2,:) = [2,3,6,5];
elements(4,:) = [5,6,9,8];
elements(3,:) = [4,5,8,7];
% elements(5,:) = [4,5,8];
% elements(6,:) = [8,7,4];
% elements(7,:) = [5,6,9];
% elements(8,:) = [9,8,5];
nodes = [-1, -1; 0, -1; 1, -1; -1, 0; 0, 0; 1, 0; -1, 1; 0, 1; 1, 1];
% elements = [1, 2, 5, 4; 2, 3, 6, 5; 4, 5, 8, 7; 5, 6, 9, 8];
sol = zeros(9,1);
sol(1,1) = 2;
sol(2,1) = 1;
sol(3,1) = 2;
sol(4,1) = 1;
sol(5,1) = 0;
sol(6,1) = 1;
sol(7,1) = 2;
sol(8,1) = 1;
sol(9,1) = 2;



fkt0(nodes,elements,sol);
% quadplot(nodes,elements,sol);


