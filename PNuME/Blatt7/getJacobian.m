function [J,detJ,invJ] = getJacobian(nodes, xi, eta)
a = (-nodes(1,1)*(1-eta) + nodes(2,1)*(1-eta) +...
    nodes(3,1)*(1+eta) - nodes(4,1)*(1+eta))/4;
b = (-nodes(1,1)*(1-xi) - nodes(2,1)*(1+xi) +...
    nodes(3,1)*(1+xi) + nodes(4,1)*(1-xi))/4;
c = (-nodes(1,2)*(1-eta) + nodes(2,2)*(1-eta) +...
    nodes(3,2)*(1+eta) - nodes(4,2)*(1+eta))/4;
d = (-nodes(1,2)*(1-xi) - nodes(2,2)*(1+xi) +...
    nodes(3,2)*(1+xi) + nodes(4,2)*(1-xi))/4;
J = [a,b;c,d];
detJ = det(J);
invJ = inv(J);
end