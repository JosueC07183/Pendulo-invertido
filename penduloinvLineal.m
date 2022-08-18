function  dx=penduloinvLineal(t,x,F,m,M,L,g,mu,b,I)

%Estados
x1 = x(1); 
x2 = x(2); 
x3 = x(3); 
x4 = x(4); 

%derivadas parciales
x10=0;
x20=0;
x30=0;
x40=0;
F0=0;

u1=F0+(M+m)*g*tan(x30)-b*x20-m*L*((x40)^2)*sin(x30);

du1=(M+m)*g*((sec(x30))^2)-m*L*((x40)^2)*cos(x30);

u2=F0*cos(x30)+(M+m)*g*sin(x30)-b*x20*cos(x30)-m*L*((x40)^2)*sin(x30)*cos(x30);

du2=-F0*sin(x30)+(M+m)*g*cos(x30)+b*x20*sin(x30)-m*L*((x40)^2)*cos(2*x30);

v=((M+m)*(I+m*L^2)-((m*L)^2)*(((cos(x30))^2)));

dv=((M*L)^2)*sin(2*x30);
%Para f1
df1dx1=0;  df1dx2=1; df1dx3=0; df1dx4=0; df1dF=0;

%Para f2
df2dx1=0;

df2dx2=-((I+m*L^2)*(b))/v;

df2dx3=(((I+m*L^2)*(du1*v-dv*u1))/(v^2))-g*((sec(x30))^2);

df2dx4=((-2)*(I+m*L^2)*(m*L*x40*sin(x30)))/(v);

df2dF=(I+m*L^2)/(v);

%Para f3
df3dx1=0; df3dx2=0; df3dx3=0; df3dx4=1; df3dF=0;

%Para f4
df4dx1=0;

df4dx2=(-b*m*L*cos(x30))/(v);

df4dx3=((m*L)*(du2*v-dv*u2))/(v^2);

df4dx4=(-2*((m*L)^2)*x40*sin(x30)*cos(x30))/(v);

df4dF=(m*L*cos(x30))/(v);

%Modelo lineal
dx = zeros(4, 1);
dx(1) = (df1dx1)*(x1-x10)+(df1dx2)*(x2-x20)+(df1dx3)*(x3-x30)+(df1dx4)*(x4-x40)+df1dF*(F-F0);
dx(2) = (df2dx1)*(x1-x10)+(df2dx2)*(x2-x20)+(df2dx3)*(x3-x30)+(df2dx4)*(x4-x40)+df2dF*(F-F0);
dx(3) = (df3dx1)*(x1-x10)+(df3dx2)*(x2-x20)+(df3dx3)*(x3-x30)+(df3dx4)*(x4-x40)+df3dF*(F-F0);
dx(4) = (df4dx1)*(x1-x10)+(df4dx2)*(x2-x20)+(df4dx3)*(x3-x30)+(df4dx4)*(x4-x40)+df4dF*(F-F0);


