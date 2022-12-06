function gaussx = gx(n)
% [n ... Anz. der Integrationspunkte]
% Rückgabewert: Positionen i für die 1D-Gauß-Integration als Zeilenvektor
    switch n
        case 1
            gaussx = [0];
        case 2
            a = 1/3^(1/2);
            gaussx = [-a, a];
        case 3
            a = (3/5)^(1/2);
            gaussx = [-a, 0, a];
        case 4
            a = (3/7+2/7*(6/5)^(1/2))^(1/2);
            b = (3/7-2/7*(6/5)^(1/2))^(1/2);
            gaussx = [-a, -b, b, a];
        case 5
            a = (5+2*(10/7)^(1/2))^(1/2)/3;
            b = (5-2*(10/7)^(1/2))^(1/2)/3;
            gaussx = [-a, -b, 0, b, a];
        otherwise
            disp('input out of range (1~5)')
    end
end

