function [LHS,RHS] = OST(theta,timestep,M,B,C,sol)
LHS = M - theta * timestep * B(1);
RHS = (M + (1-theta)*timestep*B(2))*sol + timestep*(theta*C(1) + (1-theta)*C(2));
end