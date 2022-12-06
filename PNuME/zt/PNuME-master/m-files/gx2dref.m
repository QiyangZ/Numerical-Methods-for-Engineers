function gaussx = gx2dref(n)
% [n ... Anz. der Integrationspunkte in einer Richtung]
% Rückgabewert: Positionen i für die 2D-Gauß-Integration auf dem Gebiet omega_ref
% (Zeile: Integrationspunkt i; Spalte: xi, eta)
    [x,y] = meshgrid(gx(n),gx(n));
    gaussx = [x(:),y(:)];
end

