clc
clear

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
         b-r,h;
         ];

elements = [1 2 6 5
            2 3 7 6
            3 4 8 7
            5 6 10 9
            6 7 11 10
            7 12 14 11
            7 8 13 12
            9 10 16 15
            10 11 17 16
            11 14 18 17];


loopnum = size(elements,1);
rhs = zeros(size(nodes,1),1);
sysmat = zeros(size(rhs,1));
dbc = [1 T1
       2 T1
       3 T1
       4 T1
       12 T2
       13 T2
       14 T2
       18 T2];
for i = 1:loopnum
    elenodes = nodes(elements(i,:),:);
    [elemat,elevec] = evaluate_stat(elenodes,gx2dref(2),gw2dref(2));
    [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,elements(i,:));
end
[dbcsysmat,dbcrhs] = assignDBC(sysmat,rhs,dbc);
T = dbcsysmat\dbcrhs;
dis = [15 16 17 18];
T(dis)
subplot(2,1,1);
fkt0(nodes,elements,T);
title('original');
shading interp %interplot to make a gradient color
colormap hot % the corresbonding color can be found in help
colorbar %show color scale


%% limit 450K
T_h = T(dis);

while(T_h(1)>450)
    rhs = zeros(size(nodes,1),1);
    sysmat = zeros(size(rhs,1));
    r = r + 0.01;
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
         b-r,h;
         ];
    for i = 1:loopnum
    elenodes = nodes(elements(i,:),:);
    [elemat,elevec] = evaluate_stat(elenodes,gx2dref(2),gw2dref(2));
    [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,elements(i,:));
    end
[dbcsysmat,dbcrhs] = assignDBC(sysmat,rhs,dbc);
T = dbcsysmat\dbcrhs;
T_h = T(dis);
end
r
T_h
subplot(2,1,2);
fkt0(nodes,elements,T);
title('limited');
shading interp %interplot to make a gradient color
colormap hot % the corresbonding color can be found in help
colorbar %show color scale


%     nodes = [0,0;
%          b/3,0;
%          2*b/3,0;
%          b,0;
%          0,h/3;
%          b/3,h/3;
%          2*b/3,h/3;
%          b,h/3;
%          0,2*h/3;
%          b/3,2*h/3;
%          2*b/3,2*h/3;
%          b - r*sin(pi/6),h - r*cos(pi/6);
%          b,h-r;
%          b - r*cos(pi/6),h - r*sin(pi/6);
%          0,h;
%          b/3,h;
%          b/2,h;
%          b-r,h;
%          ];
%     for i = 1:loopnum
%     elenodes = nodes(elements(i,:),:);
%     [elemat,elevec] = evaluate_stat(elenodes,gx2dref(2),gw2dref(2));
%     [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,elements(i,:));
%     end
% [dbcsysmat,dbcrhs] = assignDBC(sysmat,rhs,dbc);
% T = dbcsysmat\dbcrhs;
% T_h = T(dis);
% r
% T_h