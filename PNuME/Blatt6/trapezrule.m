function fai = trapezrule(fai,intervall_begin,intervall_end,delta_t)
t0 = intervall_begin:delta_t:intervall_end;
n = size(t0,2);
%fai(1) is 0 here.
for i=2:n
    fai(i) = ((1-3*delta_t)*fai(i-1) + 0.5*delta_t*(ft(t0(i)) + ft(t0(i-1))))/(1+3*delta_t);
end
end