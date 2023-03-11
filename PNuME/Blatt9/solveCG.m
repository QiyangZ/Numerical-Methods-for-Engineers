function x = solveCG(A,b,x0,rtol,itermax)
x = x0;
r = b - A*x;
p = r;
k = 0;
while norm(r)>rtol && k<itermax
    v = A*p;
    r_ = r;
    alpha = (r'*r)/(p'*v);
    x = x + alpha*p;
    r = r - alpha*v;
    beta = (r'*r)/(r_'*r_);
    p = r + beta*p;
    k = k + 1;
end
disp('the number of iterations (CG):');
disp(k);
end