function x = solveGauss(A,b)
%Rückgabewert: Spaltenvektor mit Lösung x
    len = size(A,1);
    Ab = [A b];
    x = zeros(len,1);
    for i=1:len
        for j=i+1:len
            m = Ab(j,i)/Ab(i,i);
            Ab(j,:) = Ab(j,:) - m.*Ab(i,:);
        end
    end
    A = Ab(:,1:len);
    b = Ab(:,end);
    x(end) = b(end)/A(end,end);
    for i=1:len-1
        x(end-i) = (b(end-i)-A(end-i,end-i+1:end)*x(end-i+1:end))/A(end-i,end-i);
    end
end

