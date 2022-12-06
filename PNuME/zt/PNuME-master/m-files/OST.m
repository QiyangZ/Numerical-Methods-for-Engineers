function [LHS,RHS] = OST(theta,timestep,M,B,C,sol)
%     [M ... [M], B ... [B(tn+1), B(tn)], C ... [C(tn+1),C(tn)], sol ... [(tn)]]
%     Rückgabewert: Zeilenvektor mit LHS und RHS
    len = size(M,2);
    B1 = B(:,1:len);
    B2 = B(:,len+1:end);
    C1 = C(:,1);
    C2 = C(:,2);
    LHS = M-theta.*timestep.*B1;
    RHS = (M+(1-theta).*timestep.*B2)*sol + timestep.*(theta.*C1+(1-theta).*C2);
end

