function [LHS,RHS] = OST(theta,timestep,M,B,C,sol)
% [M ... [M], B ... [B(tn+1), B(tn)], C ... [C(tn+1), C(tn)], sol ... [ϕ(tn)]]
% Rückgabewert: Zeilenvektor mit LHS und RHS
B1 = B(:,1:size(M,2));
B2 = B(:,size(M,2)+1:end);
LHS = M - theta * timestep * B1;
RHS = (M + (1-theta)*timestep*B2)*sol + timestep*(theta*C(1) + (1-theta)*C(2));
end