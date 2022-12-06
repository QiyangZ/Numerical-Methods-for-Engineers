
clear

% Define a tolerance
tol = 1e-12;

% test function : facultaet
assert(abs((fakultaet(0) - 1)) <= tol)
assert(abs(fakultaet(5) - 120) <= tol)