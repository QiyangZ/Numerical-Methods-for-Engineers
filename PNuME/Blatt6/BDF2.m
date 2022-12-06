function [LHS,RHS] = BDF2(timestep,M,B,C,sol)
LHS = 3/2*M - timestep*B;
RHS = 2*M*sol(1) - 0.5*M*sol(2) + timestep*C;
end