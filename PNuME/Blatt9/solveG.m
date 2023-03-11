function x = solveG(A,b,x0,rtol,itermax)
x = x0;
r = b - A*x;
k = 0;
while norm(r)>rtol && k<itermax
    v = A*r;
    alpha = (r'*r)/(r'*v);
    x = x + alpha*r;
    r = r - alpha*v;
    k = k+1;
end
disp('the number of iterations (G):');
disp(k);
end