function val = linquadref(xi,eta)
N1 = 0.25 * (1 - xi) * (1 - eta);
N2 = 0.25 * (1 + xi) * (1 - eta);
N3 = 0.25 * (1 + xi) * (1 + eta);
N4 = 0.25 * (1 - xi) * (1 + eta);
val = [N1,N2,N3,N4];
end
