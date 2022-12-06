function wert_dpoly = LagrangeDerivPolynom(x,n,x_node,f_node)
wert_dpoly = 0;
for i = 1:n+1
    wert_dpoly = wert_dpoly + LagrangeDerivBasis(x,n,i,x_node).*f_node(i);
end
end