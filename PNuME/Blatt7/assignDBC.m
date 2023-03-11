function [dbcsysmat,dbcrhs] = assignDBC(sysmat,rhs,dbc)
% [sysmat ... Systemmatrix A, rhs ... Systemvektor f,
% dbc ... Dirichlet Randbedingung-Matrix (Zeile: (dbc), Spalte (1: Knotenindex, 2: Wert)]
% Rückgabewert: Systemmatrix A, Systemvektor f
eyes = eye(size(sysmat));
sysmat(dbc(:,1),:) = eyes(dbc(:,1),:);
dbcsysmat = sysmat;

rhs(dbc(:,1)) = dbc(:,2);
dbcrhs = rhs;
end