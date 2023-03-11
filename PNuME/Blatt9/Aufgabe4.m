clc
clear
n = 300;
fai = [10.0, 6.0, 5.1, 5.01, 5.001, 5.00001, 5.0000001, 5.000000001, 5.00000000001];
v = ones(1,n)*fai(1);
v(1) = 1;
vv = zeros(1,n-1) - 2;
A = diag(v) + diag(vv,1) + diag(vv,-1);
b = ones(1,n);
x0 = zeros(n,1);

tic
solveGauss(A,b);
toc
tic
solveG(A,b,x0,1e-7,1000);
toc
tic
solveCG(A,b,x0,1e-7,1000);
toc
