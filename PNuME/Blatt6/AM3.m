function [LHS,RHS] = AM3(timestep,M,B,C,sol)
LHS = M - 5/12*timestep*B(1);
RHS =(M + 2/3*timestep*B(2))*sol(1) + 5/12*timestep*C(1) + 2/3*timestep*C(2)...
     - timestep/12*(B(3)*sol(2) + C(3));
end