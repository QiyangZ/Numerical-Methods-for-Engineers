function gaussw = gw2dref(n)
% [n ... Anz. der Integrationspunkte in einer Richtung]
% Rückgabewert: Gewichte wi für die 2D-Gauß-Integration auf dem Gebiet 
% omega_ref als Spaltenvektor
    [x,y] = meshgrid(gw(n),gw(n));
    gaussw = x(:).*y(:);
end

