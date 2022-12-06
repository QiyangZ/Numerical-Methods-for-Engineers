clear; clc; close all

func = @facultaet;
inputs_s = {{1},{2},{3},{4},{5}};
expected_outputs_s = {{1},{2},{6},{24},{120}};
eps = 1e-12;
functest(func, inputs_s, expected_outputs_s,eps)

func = @linquadref;
inputs_s = {{0.0, 0.0},{0.577, -0.577}};
expected_outputs_s = {{[0.25; 0.25; 0.25; 0.25]},{[0.16676775; 0.62173225; 0.16676775; 0.04473225]}};
eps = 1e-12;
functest(func, inputs_s, expected_outputs_s,eps)

func = @linquadderivref;
inputs_s = {{0.0, 0.0},{0.577, -0.577}};
a = 0.10575;
b = 0.39425;
expected_outputs_s = {{[-0.25,-0.25; 0.25,-0.25; 0.25, 0.25;-0.25, 0.25]},{[-b,-a; b,-b; a, b;-a, a]}};
eps = 1e-12;
functest(func, inputs_s, expected_outputs_s,eps)

func = @gx;
inputs_s = {{3}};
expected_outputs_s = {{[-0.774596669241483, 0, 0.774596669241483]}};
eps = 1e-12;
functest(func, inputs_s, expected_outputs_s,eps)

func = @gw;
inputs_s = {{3}};
expected_outputs_s = {{[0.55555555555555, 0.888888888888889, 0.55555555555555]}};
eps = 1e-12;
functest(func, inputs_s, expected_outputs_s,eps)

func = @getxPos;
inputs_s = {{[2, 1; 4, 1; 4, 3; 2, 2], 0.577,-0.577}};
expected_outputs_s = {{[3.577; 1.37826775]}};
eps = 1e-12;
functest(func, inputs_s, expected_outputs_s,eps)

func = @getJacobian;
inputs_s = {{[2, 1; 4, 1; 4, 3; 2, 2], 0.577,-0.577}};
expected_outputs_s = {{[1.0, 0; 0.10575, 0.89425], 0.89425, [1.0, 0;-0.1182555, 1.1182555]}};
eps = 1e-7;
functest(func, inputs_s, expected_outputs_s,eps)

func = @gx2dref;
inputs_s = {{1},{2},{3}};
a = 0.577350269189626;
b = 0.774596669241483;
expected_outputs_s = {{[0.0, 0.0]},{[-a,-a;-a, a; a,-a; a, a]},{[-b,-b;-b, 0;-b, b; 0,-b; 0, 0; 0, b; b,-b; b, 0; b, b]}};
eps = 1e-12;
functest(func, inputs_s, expected_outputs_s,eps)

func = @gw2dref;
inputs_s = {{1},{2},{3}};
expected_outputs_s = {{[4.0]},{[1.0; 1.0; 1.0; 1.0]},{[0.308642; 0.493827; 0.308642; 0.493827; 0.790123; 0.493827; 0.308642; 0.493827; 0.308642]}};
eps = 1e-6;
functest(func, inputs_s, expected_outputs_s,eps)

func = @OST;
inputs_s = {{0.5, 0.2, [1.1], [1.4, 1.5], [1.7, 1.8], [2.0]}};
expected_outputs_s = {{0.96, 2.85}};
eps = 1e-12;
functest(func, inputs_s, expected_outputs_s,eps)

func = @AB2;
inputs_s = {{0.2, [1.1], [1.5, 1.6], [1.8, 1.9], [2.0, 2.1]}};
expected_outputs_s = {{1.1, 3.114}};
eps = 1e-12;
functest(func, inputs_s, expected_outputs_s,eps)

func = @AM3;
inputs_s = {{0.2, [1.1], [1.4, 1.5, 1.6], [1.7, 1.8, 1.9], [2.0, 2.1]}};
expected_outputs_s = {{0.983333333333333, 2.894}};
eps = 1e-12;
functest(func, inputs_s, expected_outputs_s,eps)

func = @BDF2;
inputs_s = {{0.2, [1.1], [1.4], [1.7], [2.0, 2.1]}};
expected_outputs_s = {{1.37, 3.585}};
eps = 1e-12;
functest(func, inputs_s, expected_outputs_s,eps)

func = @evaluate_stat;
global lambda;
lambda = 48;
inputs_s = {{[0, 0; 1, 0; 1, 2; 0, 2], gx2dref(3), gw2dref(3)}};
expected_outputs_s = {{[40.000000000000000,-28.000000000000004,-20.000000000000000,7.999999999999998;
-28.000000000000004,40.000000000000007,8.000000000000000,-20.000000000000000;
-20.000000000000000,8.000000000000000,39.999999999999993,-28.000000000000000;
7.999999999999998,-20.000000000000000,-28.000000000000000,40.000000000000000],[0;0;0;0]}};
eps = 1e-12;
functest(func, inputs_s, expected_outputs_s,eps)

func = @assemble;
inputs_s = {{[1, 2, 3, 4; 5, 6, 7, 8; 9, 10, 11, 12; 13, 14, 15, 16], [17; 18; 19; 20], eye(5,5), ones(5,1), [5, 3, 1, 2]}};
expected_outputs_s = {{[12,12,10,0,9;15,17,14,0,13;7,8,7,0,5;0,0,0,1,0;3,4,2,0,2],[20;21;19;1;18]}};
eps = 1e-12;
functest(func, inputs_s, expected_outputs_s,eps)

func = @assignDBC;
inputs_s = {{[12, 12, 10, 0, 9; 15, 17, 14, 0, 13; 7, 8, 7, 0, 5; 0, 0, 0, 1, 0; 3, 4, 2, 0, 2], [20; 21; 19; 1; 18], [2,-7; 5,-2]}};
expected_outputs_s = {{[12,12,10,0,9;0,1,0,0,0;7,8,7,0,5;0,0,0,1,0;0,0,0,0,1],[20;-7;19;1;-2]}};
eps = 1e-12;
functest(func, inputs_s, expected_outputs_s,eps)

func = @evaluate_instat;
global lambda;
global ro;
global c;
lambda = 48;
ro = 7800;
c = 452;
inputs_s = {{[0,0;1,0;1,2;0,2],gx2dref(3),gw2dref(3),[1;2;3;4],[0;0;0;0],1,1000,0.66,1}};
expected_outputs_s = {{[809866.6666666666,373253.3333333334,182666.6666666667,397013.3333333334;
373253.3333333334,809866.6666666669,397013.3333333334,182666.6666666667;
182666.6666666667,397013.3333333334,809866.6666666667,373253.3333333334;
397013.3333333334,182666.6666666667,373253.3333333334,809866.6666666666],[3736426.6666666665;3918693.3333333335;4895306.6666666670;5077573.3333333321]}};
eps = 1e-8;
functest(func, inputs_s, expected_outputs_s,eps)

func = @solveGauss;
inputs_s = {{[10.0, 2, 1; 3, 4, 4; 1, 8, 4], [1; 1; 2]}};
expected_outputs_s = {{[0.051282051282051; 0.275641025641026;-0.064102564102564]}};
eps = 1e-12;
functest(func, inputs_s, expected_outputs_s,eps)

func = @solveG;
inputs_s = {{[10.0, 2.0, 10.0; 2.0, 40.0, 8.0; 10.0, 8.0, 60.0], [1.0; 1.0; 2.0], [0.0; 0.0; 0.0], 1e-7, 1000}};
expected_outputs_s = {{[0.078600816156673; 0.017489712225719; 0.017901236448326]}};
eps = 1e-12;
functest(func, inputs_s, expected_outputs_s,eps)

func = @solveCG;
inputs_s = {{[10.0, 2.0, 10.0; 2.0, 40.0, 8.0; 10.0, 8.0, 60.0], [1.0; 1.0; 2.0], [0.0; 0.0; 0.0], 1e-7, 1000}};
expected_outputs_s = {{[0.078600823045267; 0.017489711934156; 0.017901234567901]}};
eps = 1e-12;
functest(func, inputs_s, expected_outputs_s,eps)