function deriv = linquadderivref(xi,eta)
    % Ableitungen der Lagrange-Polynome ausgewertet im Punkt (xi,eta)
    deriv = zeros(4,2);
    deriv(1,1) = -1/4*(1-eta);
    deriv(1,2) = -1/4*(1-xi);
    deriv(2,1) = 1/4*(1-eta);
    deriv(2,2) = -1/4*(1+xi);
    deriv(3,1) = 1/4*(1+eta);
    deriv(3,2) = 1/4*(1+xi);
    deriv(4,1) = -1/4*(1+eta);
    deriv(4,2) = 1/4*(1-xi);
end

