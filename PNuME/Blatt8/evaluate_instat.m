function [elemat,elevec] = evaluate_instat...
(elenodes,gpx,gpw,elesol,eleosol,timInt_m,timestep,theta,firststep)

% [elenodes ... [Knotenpositionen(Zeile: Knoten i, Spalte: x,y)],
% gpx ... [Positionen ξi Gauss-Integration],
% gpw ... [Gewichte wi Gauß-Integration],
% elesol ... [Lösung Zeitschritt (n)-Spaltenvektor],
% eleosol ... [Lösung Zeitschritt (n-1)-Spaltenvektor],
% timInt_m ... [Zeitintegrationsverfahren: 1 = OST, 2 = AB2, 3 = AM3, 4 = BDF2],
% timestep ... [Zeitschrittlänge ∆t],
% theta ... [θ für OST],
% firststep ... [erste Zeitschritt?]]

[A,~] = evaluate_stat(elenodes,gpx,gpw);
B = -A;
ro = 7800;
c = 452;
M = zeros(4);
kn = numel(gpw);
for k = 1:kn
 val = linquadref(gpx(k,1),gpx(k,2));
 [~,detJ,~] = getJacobian(elenodes,gpx(k,1),gpx(k,2));
 w = gpw(k);
 for i = 1:4
     for j = 1:4
         M(i,j) = M(i,j) + ro*c*val(i)*val(j)*detJ*w;
     end
 end
end

elemat = zeros(4);
elevec = zeros(4,1);

if firststep
    timInt_m = 1;
end

switch timInt_m
    case 1
        [elemat,elevec] = OST(theta,timestep,M,[B B],[0 0],elesol);
    case 2
        [elemat,elevec] = AB2(theta,timestep,M,[B B],[0 0],[elesol eleosol]);
    case 3
        [elemat,elevec] = AM3(theta,timestep,M,[B B B],[0 0 0],[elesol eleosol]);
    case 4
        [elemat,elevec] = BDF2(theta,timestep,M,B,0,[elesol eleosol]);
    otherwise
        disp("no implementation!")
end



end