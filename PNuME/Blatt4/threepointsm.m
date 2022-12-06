function wert_tpm = threepointsm(x0,h)
wert_tpm = (fx(x0 + h) - fx(x0 - h))./(2*h);
end