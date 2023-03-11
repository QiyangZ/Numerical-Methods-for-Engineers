function gaussx = gx2dref(n) % n is the number of intergration ...
                             % punkts in one direction
a = 1/sqrt(3);
b = sqrt(3/5);
if (n == 1)
    gaussx = [0,0];
elseif (n == 2)
    gaussx = [-a,-a; -a,a; a,-a; a,a];
elseif( n== 3)
    gaussx = [-b,-b; -b,0; -b,b; 0,-b; 0,0; 0,b; b,-b; ...
        b,0; b,b];
else
    disp("no implementation");
end
end