function deriv = linquadderivref(xi,eta)
a11 = eta/4 - 1/4;
a12 = xi/4 - 1/4;
a21 = 1/4 - eta/4;
a22 = - xi/4 - 1/4;
a31 = eta/4 + 1/4;
a32 = xi/4 + 1/4 ;
a41 = - eta/4 - 1/4;
a42 = 1/4 - xi/4;
deriv = [a11 a12;
         a21 a22;
         a31 a32;
         a41 a42];
end