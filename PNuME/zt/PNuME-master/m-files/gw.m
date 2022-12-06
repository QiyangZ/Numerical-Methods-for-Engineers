function gaussw = gw(n)
% [n ... Anz. der Integrationspunkte]
% Rückgabewert: Gewichte wi für die 1D-Gauß-Integration als Zeilenvektor
    switch n
        case 1
            gaussw = [2];
        case 2
            gaussw = [1, 1];
        case 3
            gaussw = [5/9, 8/9, 5/9];
        case 4
            a = (18-30^(1/2))/36;
            b = (18+30^(1/2))/36;
            gaussw = [a, b, b, a];
        case 5
            a = (322-13*70^(1/2))/900;
            b = (322+13*70^(1/2))/900;
            gaussw = [a, b, 128/225, b, a];
        otherwise
            disp('input out of range (1~5)')
    end
end

