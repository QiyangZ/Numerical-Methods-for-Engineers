function val = linquadref(xi,eta)
    % Lagrange-Polynome ausgewertet im Punkt (xi,eta)
    val = zeros(4,1);
    val(1) = 1/4*(1-xi)*(1-eta);
    val(2) = 1/4*(1+xi)*(1-eta);
    val(3) = 1/4*(1+xi)*(1+eta);
    val(4) = 1/4*(1-xi)*(1+eta);
end

