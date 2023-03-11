clc
%% for function17
% [A,B]  = evaluate_stat([0, 0; 1, 0; 1, 2; 0, 2], gx2dref(3), gw2dref(3));
% disp(A);
% disp(B);

%% for assemble

% rhs=[2;2;3;4;0];
% ele = [5, 3, 1];
% rhs(ele) <---

% [sysmat,rhs] = assemble([1, 2, 3, 4; 5, 6, 7, 8; 9, 10, 11, 12; 13, 14, 15, 16], [17; 18; 19; 20], eye(5,5), ones(5,1), [5, 3, 1, 2]);
% sysmat
% rhs

% [dbcsysmat,dbcrhs] = assignDBC([12, 12, 10, 0, 9; 15, 17, 14, 0, 13; 7, 8, 7, 0, 5; 0, 0, 0, 1, 0; 3, 4, 2, 0, 2], [20; 21; 19; 1; 18], [2, -7; 5, -2]);
% dbcsysmat
% dbcrhs

%% for main
r = 0.02;
b = 0.3;
h = 0.3;
T1 = 600;
T2 = 300;
nodes = [0,0;
         b/3,0;
         2*b/3,0;
         b,0;
         0,h/3;
         b/3,h/3;
         2*b/3,h/3;
         b,h/3;
         0,2*h/3;
         b/3,2*h/3;
         2*b/3,2*h/3;
         b - r*sin(pi/6),h - r*cos(pi/6);
         b,h-r;
         b - r*cos(pi/6),h - r*sin(pi/6);
         0,h;
         b/3,h;
         b/2,h;
         b-r,h
         ];

elements = [1 2 6 5
            2 3 7 6
            3 4 8 7
            5 6 10 9
            6 7 11 10
            7 12 14 11
            7 8 13 12
            9 10 16 15
            10 11 17 16];



loopnum = size(elements,1);
rhs = zeros(size(nodes,1),1);
sysmat = zeros(size(rhs,1));
    elenodes = nodes(elements(2,:))