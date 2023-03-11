function [elemat,elevec] = evaluate_stat(elenodes,gpx,gpw)
lambda = 48;
kn = numel(gpw);
A_size = size(elenodes);
elemat = zeros(A_size(1));
elevec = zeros(A_size(1),1);
for k = 1:kn
    [~,detJ,invJ] = getJacobian(elenodes,gpx(k,1),gpx(k,2));
%     M=nambda_N(gpx(k,1),gpx(k,2));
    w = gpw(k);
    dN = linquadderivref(gpx(k,1),gpx(k,2));
    for i = 1:4
        for j = 1:4
            elemat(i,j) = elemat(i,j) + lambda*dN(i,:)*invJ*(dN(j,:)*invJ)'*detJ*w;
        end
    end
end
end