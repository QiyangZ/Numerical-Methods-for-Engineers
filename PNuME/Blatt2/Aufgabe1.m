clc
clear

x = zeros(1,1000);
y = zeros(1,1000);

delta = logspace(-15,0,1000);
for i = 1:1000
%     delta = 10 ^ (i -21);
    P1 = [0 1];
    P2 = [delta(i)  1 + delta(i)];
    x(:,i) = delta(i);
    x_num = lineintersection(P1,P2);
    y(:,i) = abs(1 - x_num);
end

loglog(x,y);




