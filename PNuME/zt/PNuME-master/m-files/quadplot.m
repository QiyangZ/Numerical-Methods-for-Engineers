function quadplot(nodes,elements,sol)
    num_elements = size(elements,1);
    T = zeros(num_elements*2,3);
    for n=1:num_elements
        element = elements(n,:);
        T([2*n-1,2*n],:) = [element([1,2,4]);element([2,3,4])];
    end
    trisurf(T,nodes(:,1),nodes(:,2),sol)
end

