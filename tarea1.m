
Ip = 0.0079;   
Mc = 0.7031;   
lp = 0.3302;   
Mp = 0.23;     
Beq = 4.3;     
Bp = 0.0024;   
g = 9.81;      
Fc = 0;        

x0 = [0; 0; deg2rad(1); 0];  

odefun = @(t, x) [
    x(2);  
    ((Ip + Mp*lp^2)*Fc*cos(x(3))*sin(x(3)) - ... 
     (Ip*Mp*lp - Mp^2*lp^2)*Bp*x(4)*cos(x(3)) - ...
     Mp*lp*x(4)^2*sin(x(3)) - Beq*x(2)*(Mc + Mp))/(Ip*(Mc + Mp) + Mp^2*lp^2*sin(x(3))^2);
    x(4); 
    ((Mc + Mp)*Mp*g*lp*sin(x(3)) - ... 
     (Mc + Mp)*Bp*x(4) - Fc*Mp*lp*cos(x(3)) - ...
     Beq*Mp*lp*x(2)*cos(x(3)))/(Ip*(Mc + Mp) + Mp^2*lp^2*sin(x(3))^2);
];


tspan = [0 10];  
[t, sol] = ode45(odefun, tspan, x0);


figure;
subplot(2,1,1);
plot(t, sol(:,1)); 
xlabel('Tiempo (s)');
ylabel('x_c (m)');
title('Posición del carro');

subplot(2,1,2);
plot(t, rad2deg(sol(:,3))); 
xlabel('Tiempo (s)');
ylabel('\alpha (°)');
title('Ángulo del péndulo');
