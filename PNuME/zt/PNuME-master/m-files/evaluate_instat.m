function [elemat,elevec] = evaluate_instat(elenodes,gpx,gpw,elesol,eleosol,timInt_m,timestep,theta,firststep)
% [elenodes ... [Knotenpositionen(Zeile: Knoten i, Spalte: x,y)],
% gpx ... [Positionen i Gauss-Integration],
% gpw ... [Gewichte wi Gauß-Integration],
% elesol ... [Lösung Zeitschritt (n)-Spaltenvektor],
% eleosol ... [Lösung Zeitschritt (n-1)-Spaltenvektor],
% timInt_m ... [Zeitintegrationsverfahren: 1 = OST, 2 = AB2, 3 = AM3, 4 = BDF2],
% timestep ... [Zeitschrittlänge t],
% theta ... [ für OST],
% firststep ... [erste Zeitschritt?]]
% Rückgabewert: Elementmatrix A(e) und Elementvektor f (e)
    global ro;
    global c;
    
    % calculate B
    [A,~] = evaluate_stat(elenodes,gpx,gpw);
    B = -A;
    
    % calculate M
    M = zeros(4);
    for k=1:numel(gpw)
        xi = gpx(k,1);
        eta = gpx(k,2);
        w = gpw(k);
        [~,detJ,~] = getJacobian(elenodes, xi, eta);
        N = linquadref(xi,eta);
        for i=1:4
            for j=1:4
                M(i,j) = M(i,j) + N(i) * N(j)' * detJ * w;
            end
        end
    end
    M = M * ro * c;
    
    % if firststep, use einschritt theta verfahren
    if firststep
        timInt_m = 1;
    end
    
    % calculate LHS and RHS
    switch timInt_m
        case 1
%             elemat=zeros(4);
%             elevec=zeros(4,1);
%             for i=1:4
%                 for j=1:4
%                     [LHS,RHS] = OST(theta,delta_t,M(i,j),[B(i,j) B(i,j)],[0 0],elesol(j));
%                     elemat(i,j) = LHS;
%                     elevec(i) = elevec(i)+RHS;
%                 end
%             end
            [elemat,elevec] = OST(theta,timestep,M,[B B],zeros(size(M,1),2),elesol);
        case 2
            [elemat,elevec] = AB2(timestep,M,[B B],zeros(size(M,1),2),[elesol eleosol]);
        case 3
            [elemat,elevec] = AM3(timestep,M,[B B B],zeros(size(M,1),3),[elesol eleosol]);
        case 4
            [elemat,elevec] = BDF2(timestep,M,B,zeros(size(M,1),1),[elesol eleosol]);
        otherwise
            error("no passing method found.")
    end
    
end

