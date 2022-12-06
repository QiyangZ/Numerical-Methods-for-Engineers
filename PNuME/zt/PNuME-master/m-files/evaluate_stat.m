function [elemat,elevec] = evaluate_stat(elenodes,gpx,gpw)
% [elenodes ... [Knotenpositionen(Zeile: Knoten i, Spalte: x,y)], gpx ... [Positionen i Gauss-Integration],
% gpw ... [Gewichte wi Gauss-Integration]]
% Rückgabewert: Elementmatrix A(e) und Elementvektor f (e)
    global lambda;
    elemat = zeros(4);
    elevec = zeros(4,1);
    for k=1:numel(gpw)
        xi = gpx(k,1);
        eta = gpx(k,2);
        w = gpw(k);
        [~,detJ,invJ] = getJacobian(elenodes, xi, eta);
        dN = linquadderivref(xi,eta);
        for i=1:4
            for j=1:4
                elemat(i,j) = elemat(i,j) + lambda * dN(i,:)*invJ*(dN(j,:)*invJ)'* detJ * w;
            end
        end
    end
end

