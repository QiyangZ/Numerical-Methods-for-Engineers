function [LHS,RHS] = AM3(timestep,M,B,C,sol)
% [M ... [M], B ... [B(tn+1), B(tn), B(tn−1)], C ... [C(tn+1),C(tn),C(tn−1)], sol ... [(tn),(tn−1)]]
% Rückgabewert: Zeilenvektor mit LHS und RHS
    len = size(M,2);
    B1 = B(:,1:len);
    B2 = B(:,len+1:len*2);
    B3 = B(:,len*2+1:end);
    C1 = C(:,1);
    C2 = C(:,2);
    C3 = C(:,3);
    sol1 = sol(:,1);
    sol2 = sol(:,2);
    LHS = M - 5/12.*timestep.*B1;
    RHS = M*sol1 + timestep/12.*(5.*C1+8.*(B2*sol1+C2)-(B3*sol2+C3));
end

