//TP EDP
clear
//////
L=1; 
N=9; 
h=L/(N+1) 
A=-1/h^(2)*((-1)*diag(ones(1,N-1),-1) + 2*diag(ones(1,N)) + (-1)*diag(ones(1,N-1),1))
x=[0:h:L]; 
T=1;  
M=500;
dt=T/M; 
t=[0:dt:T]
U=zeros(M+1,N+2)
Uexacte=zeros(M+1,N+2)
//Initialisation. 
        U(1,:)=sin(%pi/L*x)
        Uexacte(1,:)=sin(%pi/L*x)
//Graphes au temps initial. 
plot(x,U(1,:), 'b')
plot(x,Uexacte(1,:), 'r')
title('Initialisation')
xlabel('x')
for k=1:M-1
        V=U(k,2:N+1)'
        W=A*V
        U(k+1,2:N+1)=U(k,2:N+1) + dt*W'
        Uexacte(k+1,:)=sin(%pi/L*x)*exp(-%pi^2/L^2*t(k))
drawlater()
f0=scf(1)
clf(f0)
plot(x,U(k+1,:), 'b')
plot(x,Uexacte(k+1,:), 'r')
title('Evolution des solutions approchées et exactes au cours du temps')
a=gca();
a.data_bounds=[0, 0;1,1];
xlabel('x')
l=legend(['solution approchee';'solution exacte'])
drawnow()
end                        

plot(x,U(M,:), 'b')
plot(x,Uexacte(M,:), 'r')

