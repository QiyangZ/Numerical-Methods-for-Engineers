function [LHS,RHS] = AM3(timestep,M,B,C,sol)
% [M ... [M], B ... [B(tn+1), B(tn), B(tn−1)], C ... [C(tn+1), C(tn), C(tn−1)], sol ... [ϕ(tn),ϕ(tn−1)]]
% Rückgabewert: Zeilenvektor mit LHS und RHS
B1 = B(:,1:size(M,2));
B2 = B(:,size(M,2)+1: 2*size(M,2));
B3 = B(:,2*size(M,2)+1:end);
sol1 = sol(:,1);
sol2 = sol(:,2);
LHS = M - 5/12*timestep*B1;
RHS =(M + 2/3*timestep*B2)*sol1 + 5/12*timestep*C(1) + 2/3*timestep*C(2)...
     - timestep/12*(B3*sol2 + C(3));
end