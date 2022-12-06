function wert_tpe = threepointse(x0,h)
wert_tpe = (-3*fx(x0) + 4*fx(x0 + h) - fx(x0 + 2*h))./(2*h);
end