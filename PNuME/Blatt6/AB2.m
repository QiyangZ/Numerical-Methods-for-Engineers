function [LHS,RHS] = AB2(timestep,M,B,C,sol)
LHS = M;
RHS = (M+3/2*timestep*B(1))*sol(1) + (3*timestep/2)*C(1)...
    - timestep/2*B(2)*sol(2)-timestep/2*C(2);
end