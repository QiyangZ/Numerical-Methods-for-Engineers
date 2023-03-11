function gaussw = gw2dref(n)
if (n == 1)
    gaussw = 4;
elseif (n == 2)
    gaussw = [1;1;1;1];
elseif( n== 3)
    gaussw = [0.308642; 0.493827; 0.308642; 0.493827;...
        0.790123; 0.493827; 0.308642; 0.493827; 0.308642];
else
    disp("no implementation");
end
end