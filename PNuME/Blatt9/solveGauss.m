function x = solveGauss(A,b)

%initialization
n = size(A,1);
x = zeros(n,1);

%elimination
for i = 1:n
    for j = i+1 : n
        m_ji = A(j,i)/A(i,i);
        A(j,:) = A(j,:) - m_ji*A(i,:);
        b(j) = b(j) - m_ji*b(i);
    end
end

%solve
x(n)= b(n)/A(n,n);
for m = 1:n-1
    k = n -m;
%     sum = 0;
%     for l = k:(n-1)
%         sum = sum+A(k,l+1)*x(l+1);
%     end
   sum = A(k,k+1:n)*x(k+1:n); 
    x(k) = (b(k)-sum)/A(k,k);
end

end