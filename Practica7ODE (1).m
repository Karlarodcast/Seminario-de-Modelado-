function dx = practica(t,x)
R1 = 5e6;
R2 = 5e6;
R3 = 5e6;
C1 = 100e-9;
C2 = 100e-9;
Uin = 5;

dx = zeros(2,1);
dx(1)=x(2);
dx(2)=(-R1*R3*C2/(R1*R2*R3*C1*C2))*x(2)+(R2/(R1*R2*R3*C1*C2))*Uin;
end

[t,x]=ode45(@practica,[0,1],[0;0]);

figure;
plot(t,x(:,1),'b','LineWidth',1.5);
hold on;
xlabel('Tiempo');
ylabel('Magnitud');
title('Sistema');
legend('Salida y(t)','Derivada');
grid on;

