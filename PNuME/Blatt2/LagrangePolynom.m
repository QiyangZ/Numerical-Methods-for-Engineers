function wert_poly = LagrangePolynom(x,n,x_node,f_node)
wert_poly = 0;
for k = 1: n+1
    wert_poly = wert_poly + LagrangeBasis(x,n,k,x_node).*f_node(k);
end
end