o = magic(3);
e = magic(4);
%e(1) = 1;

if all(o==e,'all')
    disp gleich
else
    disp ungleich
end