clc;
clear ;
close all;

A = rand(1,1000); %% the method to create random number: rand, randi 
if A(1) >= 0.5
    fprintf('a1 >= 0.5 \n');
else
    fprintf('a1 < 0.5 \n');
end

n05 = 0;
for a = 1:1000
    if A(a) >= 0.5
        n05 = n05 +1;
    end
    a = a + 1;
end
fprintf("n05 = %d \n", n05);

i = 1;
while (i <= 1000)
    if A(i) >= 0.499 && A(i) <= 0.501
        fprintf("index is %d, value is %f \n",i,A(i));
        break;
    else
        i = i + 1;
    end
    if i==1000
        fprintf("Kein Element 0.499 <= a_i <= 0.501 \n");
    end
   end

