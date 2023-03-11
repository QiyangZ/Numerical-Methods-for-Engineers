function [LHS,RHS] = BDF2(timestep,M,B,C,sol)
% [M ... [M], B ... [B(tn+1)], C ... [C(tn+1)], sol ... [ϕ(tn),ϕ(tn−1)]]
% Rückgabewert: Zeilenvektor mit LHS und RHS
sol1 = sol(:,1);
sol2 = sol(:,2);
LHS = 3/2*M - timestep*B;
RHS = 2*M*sol1 - 0.5*M*sol2 + timestep*C;
end