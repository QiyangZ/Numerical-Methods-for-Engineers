function wert_basis = LagrangeBasis(x,n,i,x_node)
 wert_basis = 1;
for k = 1: n+1
    if k ~= i
        wert_basis = wert_basis .* (x - x_node ...
            (k))./(x_node(i) - x_node(k));
%     else
%         wert_basis = wert_basis*1;
    end
end