function wert_fpm = fivepointsm(x0,h)
wert_fpm = (fx(x0 - 2.*h) - 8.*fx(x0 - h) + 8.*fx(x0 + h) -fx(x0 + 2.*h))./(12*h);
end