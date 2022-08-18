function dx = penduloinv(t,x,F,m,M,L,g,mu,b,I)

% Estados
x1 = x(1); 
x2 = x(2); 
x3 = x(3); 
x4 = x(4); 

% Modelo no lineal
dx = zeros(4, 1);
dx(1) = x2; 
dx(2) = (I+m*L^2)*((F+(M+m)*g*tan(x3)-b*x2-m*L*((x4)^2)*sin(x3))/((M+m)*(I+m*L^2)-((m*L)^2)*(((cos(x3))^2))))-g*tan(x3);
dx(3) = x4;
dx(4) = (m*L)*((F*cos(x3)+(M+m)*g*sin(x3)-b*x2*cos(x3)-m*L*((x4)^2)*sin(x3)*cos(x3))/((M+m)*(I+m*L^2)-((m*L)^2)*(((cos(x3))^2)))); 

