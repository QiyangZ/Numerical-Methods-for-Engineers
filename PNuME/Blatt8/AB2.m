function [LHS,RHS] = AB2(timestep,M,B,C,sol)
% [M ... [M], B ... [B(tn), B(tn−1)], C ... [C(tn), C(tn−1)], sol ... [ϕ(tn),ϕ(tn−1)]]
% Rückgabewert: Zeilenvektor mit LHS und RHS
B1 = B(:,1:size(M,2));
B2 = B(:,size(M,2)+1:end);
sol1 = sol(:,1);
sol2 = sol(:,2);
LHS = M;
RHS = (M+3/2*timestep*B1)*sol1 + (3*timestep/2)*C(1)...
    - timestep/2*B2*sol2-timestep/2*C(2);
end