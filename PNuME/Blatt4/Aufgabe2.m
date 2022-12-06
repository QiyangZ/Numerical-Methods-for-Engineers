clc
clear

h = logspace(-5,0,1000);
% h = 1e-5:0.0001:1;
g1 = h;
g2 = h.^2;
g3 = h.^4;
n = size(h,2); % the second parameter of size stands for dimension. here
% 1 for row, 2 for col. when no sencond parameter, then return the size of
% h.

%% for x = 0.6

er2p = zeros(1,n);
er3m = zeros(1,n);
er3e = zeros(1,n);
er5m = zeros(1,n);
er5e = zeros(1,n);

for i=1:n
    er2p(i) =  abs(defx(0.6) - twopoints(0.6,h(i)));
    er3m(i) =  abs(defx(0.6) - threepointsm(0.6,h(i)));
    er3e(i) =  abs(defx(0.6) - threepointse(0.6,h(i)));
    er5m(i) =  abs(defx(0.6) - fivepointsm(0.6,h(i)));
end
figure(1);
loglog(h,er2p,'r-',h,er3m,'g-',h,er3e,'b-',h,er5m,'k-',h,g1,'r--',h,g2,'g--',h,g3,'k--');
legend('err_{2p}','err_{3m}','err_{3e}','err_{5m}','h','h^2','h^4');
xlabel('h');
ylabel('error');
title('x = 0.6');


%% for x= 2

s2er2p = zeros(1,n);
s2er3m = zeros(1,n);
s2er3e = zeros(1,n);
s2er5m = zeros(1,n);
s2er5e = zeros(1,n);

for i=1:n
    s2er2p(i) =  abs(defx(2) - twopoints(2,h(i)));
    s2er3m(i) =  abs(defx(2) - threepointsm(2,h(i)));
    s2er3e(i) =  abs(defx(2) - threepointse(2,h(i)));
    s2er5m(i) =  abs(defx(2) - fivepointsm(2,h(i)));
end
figure(2);
loglog(h,s2er2p,'r-',h,s2er3m,'g-',h,s2er3e,'b-',h,s2er5m,'k-',h,g1,'r--',h,g2,'g--',h,g3,'k--');
legend('err_{2p}','err_{3m}','err_{3e}','err_{5m}','h','h^2','h^4');
xlabel('h');
ylabel('error');
title('x = 2');


