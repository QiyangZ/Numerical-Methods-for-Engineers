function [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,ele)
% [elemat ... Elementmatrix A(e), elevec ... Elementvektor f (e), sysmat ... Systemmatrix A,
% rhs ... Systemvektor f , ele ... globale Knotenindex (als Zeilenvektor)]
% Rückgabewert: Systemmatrix A, Systemvektor f
    sysmat(ele,ele)=sysmat(ele,ele)+elemat;
    rhs(ele) = rhs(ele) + elevec;
end

