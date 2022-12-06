clc
clear

t0 = 0:0.2:2;
n = size(t0,2);
exa = zeros(1,n);
for t = 1:n
    exa(t) = exloesung(t0(t));
end
%% Vorwärts-Euler-Verfahren
fai1 = zeros(1,n);
fai1 = forwardseuler(fai1,0,2,0.2);
%% Rückwärts-Euler_verfahren
fai2 = zeros(1,n);
fai2 = backwardseuler(fai2,0,2,0.2);
 %% Trapezregel
 fai3 = zeros(1,n);
fai3 = trapezrule(fai3,0,2,0.2);
% plot(t0,exa,'k--',t0,fai1,'b',t0,fai2,'y',t0,fai3,'r');


%% Aufgabe 2
% test OST [LHS,RHS] = OST(0.5, 0.2, [1.1], [1.4, 1.5], [1.7, 1.8], [2.0])
faiost_zero = zeros(1,n);
for i = 2:n
    M = 1;
    B = [-6,-6];
    C = [ft(t0(i)),ft(t0(i-1))];
    [LHS,RHS] = OST(0.0,0.2,M,B,C,faiost_zero(i-1));
    faiost_zero(i) = RHS / LHS;
end

faiost_half = zeros(1,n);
for i = 2:n
    M = 1;
    B = [-6,-6];
    C = [ft(t0(i)),ft(t0(i-1))];
    [LHS,RHS] = OST(0.5,0.2,M,B,C,faiost_half(i-1));
    faiost_half(i) = RHS / LHS;
end

faiost_one = zeros(1,n);
for i = 2:n
    M = 1;
    B = [-6,-6];
    C = [ft(t0(i)),ft(t0(i-1))];
    [LHS,RHS] = OST(1.0,0.2,M,B,C,faiost_one(i-1));
    faiost_one(i) = RHS / LHS;
end
figure(1);
plot(t0,exa,'k--',t0,faiost_zero,'b',t0,faiost_half,'g',t0,faiost_one,'r');
legend('exakt','theta = 0','theta = 0.5','theta = 1');
title('Einschritt-θ-Verfahren mit timestep=0.2');
xlabel('t');
ylabel('Φ(t)');

% test AB2 [LHS,RHS]=AB2(0.2, [1.1], [1.5, 1.6], [1.8, 1.9], [2.0, 2.1])
% test AM3 [LHS,RHS]= AM3(0.2, [1.1], [1.4, 1.5, 1.6], [1.7, 1.8, 1.9], [2.0, 2.1])
% test BDF2 [LHS,RHS]= BDF2(0.2, [1.1], [1.4], [1.7], [2.0, 2.1])
%% Adams-Bashforth-Verfahren
faiab = zeros(1,n);
for i=2:n-1
    M = 1;
    B = [-6,-6];
    C = [ft(t0(i)),ft(t0(i-1))];
    sol = [faiab(i),faiab(i-1)];
    [LHS,RHS] = AB2(0.2,M,B,C,sol);
    faiab(i+1) = RHS / LHS;
end
% plot(t0,faiab)
% hold on

%% Adams_Moulton-Verfahren
faiam = zeros(1,n);
for i=2:n-1
    M = 1;
    B = [-6,-6,-6];
    C = [ft(t0(i+1)),ft(t0(i)),ft(t0(i-1))];
    sol = [faiam(i),faiam(i-1)];
    [LHS,RHS] = AM3(0.2,M,B,C,sol);
    faiam(i+1) = RHS / LHS;
end
% plot(t0,faiam);
% hold on

%% BDF2-Verfahren
faibd = zeros(1,n);
for i=2:n-1
    M = 1;
    B = -6;
    C = ft(t0(i+1));
    sol = [faibd(i),faibd(i-1)];
    [LHS,RHS] = BDF2(0.2,M,B,C,sol);
    faibd(i+1) = RHS / LHS;
end
% plot(t0,faibd);

figure(2);
plot(t0,exa,'k--',t0,fai1,'b',t0,fai2,'g',t0,fai3,'r',t0,faiab,'b--',...
    t0,faiam,'g--',t0,faibd,'r--');
legend('exakt','VorEuler','BacEuler','Trapez','AB2','AM3','BDF2');
title('Lösungen mit Zeitschritt = 0.2');
xlabel('t');
ylabel('Φ(t)');

