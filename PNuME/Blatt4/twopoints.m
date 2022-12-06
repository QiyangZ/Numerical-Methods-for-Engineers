function wert_tp = twopoints(x0,h)
wert_tp = (fx(x0 + h) - fx(x0))./h;
end