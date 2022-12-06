function x = getxPos(nodes, xi, eta)
% Rückgabewert: Spaltenvektor Position im (x, y)-Koordinatensystem
    x = nodes' * linquadref(xi,eta);
end

