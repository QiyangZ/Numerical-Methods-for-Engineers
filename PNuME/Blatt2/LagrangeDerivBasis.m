function wert_dBasis = LagrangeDerivBasis(x,n,i,x_node)
wert_dBasis = 0;
for m = 1:n+1
    if m ~= i
        prodc = 1;
        for k = 1: n+1
            if k ~= i && k ~= m
                prodc = prodc .* ((x - x_node(k))./(x_node(i) - x_node(k)));
            else
                prodc = 1.*prodc;
            end
        end
        wert_dBasis = wert_dBasis + prodc ./ (x_node(i) - x_node(m));
    else
        wert_dBasis = 1.*wert_dBasis;
    end
end

end