clc
clear

x_node = [0.0 1.0 2.0 3.0 4.0];
f_node = [0.000000 0.031250 0.131687 0.237304 0.327680];

x = 0:0.01:4;
y = (x./(x+1)).^5;
a = LagrangePolynom(0.6,1,x_node,f_node);
da = LagrangeDerivPolynom(0.6,1,x_node,f_node);
b = LagrangePolynom(0.6,4,x_node,f_node);
db = LagrangeDerivPolynom(0.6,4,x_node,f_node);

c = 0:0.05:4;
fc = (c./(c+1)).^5;
c_poly = LagrangePolynom(0.6,80,c,fc);
c_dpo = LagrangeDerivPolynom(0.6,80,c,fc);

% plot(x,y)
% hold on
% plot(x,LagrangePolynom(x,1,x_node,f_node))
% hold on
% plot(x,LagrangePolynom(x,4,x_node,f_node))
% hold on
% plot(c,LagrangePolynom(c,80,c,fc))
% hold on
% plot(x,LagrangeDerivPolynom(x,4,x_node,f_node))
% hold on
% plot(xx,LagrangeDerivPolynom(xx,80,c,fc)) % somethingwrong
plot(x,y,...
    x,LagrangePolynom(x,1,x_node,f_node),...
    x,LagrangePolynom(x,4,x_node,f_node),'--',...
    c,LagrangePolynom(c,80,c,fc),'--+',...
    x,LagrangeDerivPolynom(x,4,x_node,f_node))
xlabel('x');
ylabel('f(x)');
legend('exakte Funktion','Polynom P1','Polynom P4',...
    'Polynom P80','erste Ableitung Polynom4')

format long
a
da
b
db
c_poly
c_dpo