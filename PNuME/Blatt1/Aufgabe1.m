clc;
clear all;
close all;

A = [3 0 0 0;
     0 3 0 0;
     0 0 3 0;
     0 0 0 3]; %% Matrix A define
v = [1;2;3;4]; %% column vector v define
a = v' * v
B = v * v'
C = A * B
lambda_C = eig(C)