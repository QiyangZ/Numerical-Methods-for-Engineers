function x = solveG(A,b,x0,rtol,itermax)
% A ... Matrix A des Gleichungssystems Ax = b,
% b ... Vektor b des Gleichungssystems Ax = b,
% x0 ... Startvektor für die Lösung x0,
% rtol ... Zu erreichende Toleranz der L2-Norm des Residuumsvektors r = b − Ax,
% itermax ... Maximale Anzahl an Iteration bei der das Verfahren gestoppt wird.
%Rückgabewert: Vektor mit Lösung x
    % make sym
    eyes = eye(size(A));
    for i=1:size(A,1)
        if all(A(i,:)==eyes(i,:))
            rows = true(size(b));
            rows(i)=false;
            m = A(rows,i);
            A(rows,i) = 0;
            b(rows) = b(rows) - b(i)*m;
        end
    end
    x = x0;
    r = b-A*x;
    k = 0;
    while norm(r)>rtol && k<itermax
        v = A*r;
        alpha = (r'*r)/(r'*v);
        x = x + alpha*r;
        r = r - alpha*v;
        k = k + 1;
    end
%     display(k)
end

