function fai = backwardseuler(fai,intervall_begin,intervall_end,delta_t)
t0 = intervall_begin:delta_t:intervall_end;
n = size(t0,2);
%fai(1) is 0 here.
for i=2:n
    fai(i) = (fai(i-1) + delta_t*ft(t0(i)) )/(1+6*delta_t);
end
end