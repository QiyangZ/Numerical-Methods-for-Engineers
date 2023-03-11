clc
clear

% geometric parameters
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
dbc = [1 T1
       2 T1
       3 T1
       4 T1
       12 T2
       13 T2
       14 T2
       18 T2];


% Einschritt-θ-Verfahren mit θ = 0.5 und einer Zeitschrittlänge von ∆t =500s:

% integral parameters
timeend = 5000;
timInt_m = 1;
timestep = 500;
theta = 0.5;
firststep = 1;
gpx = gx2dref(2);
gpw = gw2dref(2);

% loop parameters
t = 0:timestep:timeend;
t_count = numel(t);

% initial value
loopnum = size(elements,1);

T = zeros(size(nodes,1),t_count);
T0 = zeros(size(nodes,1),1) + 300;
T(:,1) = T0;
sol = T0;
osol = T0;
 
for tc = 2:t_count
    rhs = zeros(size(nodes,1),1);
    sysmat = zeros(size(nodes,1));
    for i = 1:loopnum
    elenodes = nodes(elements(i,:),:);
    elesol = sol(elements(i,:),:);
    eleosol = osol(elements(i,:),:);
    [elemat,elevec] = evaluate_instat...
        (elenodes,gpx,gpw,elesol,eleosol,timInt_m,timestep,theta,firststep);
    [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,elements(i,:));
    end
    [dbcsysmat,dbcrhs] = assignDBC(sysmat,rhs,dbc);
    osol = sol;
    sol = dbcsysmat\dbcrhs;
    T(:,tc) = sol;
end

fkt0(nodes,elements,T(:,end));
shading interp;
colormap hot;
colorbar;
title("Temperatur zum Zeitpunkt: t=5000s, OST(Δt=500s)");
display = [15,16,17,18];
a = T(:,end);
a(display)

i = 1;
while(T(15,i)<450)
    i = i+1;
end
X = sprintf('t*_tude = %ds',i*500);
disp(X);
disp(T(display,i));








