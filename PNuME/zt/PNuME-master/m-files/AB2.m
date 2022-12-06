function [LHS,RHS] = AB2(timestep,M,B,C,sol)
% [M ... [M], B ... [B(tn), B(tn−1)], C ... [C(tn),C(tn−1)], sol ... [(tn),(tn−1)]]
% Rückgabewert: Zeilenvektor mit LHS und RHS
    len = size(M,2);
    B1 = B(:,1:len);
    B2 = B(:,len+1:end);
    C1 = C(:,1);
    C2 = C(:,2);
    sol1 = sol(:,1);
    sol2 = sol(:,2);
    LHS = M;
    RHS = M*sol1 + 0.5.*timestep.*(3.*(B1*sol1+C1) - (B2*sol2+C2));    
end

