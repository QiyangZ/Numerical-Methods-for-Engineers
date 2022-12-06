function [J,detJ,invJ] = getJacobian(nodes, xi, eta)
% Rückgabewert: [Jacobi-Matrix, Determinante der Jacobi-Matrix, Inverse der Jacobi-Matrix]
    J = nodes' * linquadderivref(xi, eta);
    detJ = det(J);
    invJ = inv(J);
end

