function [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,ele)
for i = 1:size(elemat,1)
    for j = 1:size(elemat,2)
        sysmat(ele(i),ele(j)) = sysmat(ele(i),ele(j)) + elemat(i,j);
    end
end

for k = 1:numel(elevec)
    rhs(ele(k)) = rhs(ele(k)) + elevec(k);
end
%the second way to slove this problem:
% rhs(ele) = rhs(ele)+elevec;
% sysmat(ele,ele) = elemat + sysmat(ele,ele);
%将对应的数提出来成为4*4矩阵然后加上局部矩阵后传回到global的矩阵
%extract these corresponding elements and then add them up with original ele.,
%then set them back to the original position.
end