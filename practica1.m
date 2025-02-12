
Ip = 0.0079;      
Mc = 0.7031;      
lp = 0.3302;      
Mp = 0.23;        
Fc = 0;           
Beq = 4.3;        
g = 9.81;         
Bp = 0.0024;      


xc0 = 0;          
alpha0 = deg2rad(1); 
xcdot0 = 0;       
alphadot0 = 0;    

x0 = [xc0; xcdot0; alpha0; alphadot0]; 

tspan = [0 20];

[t, solu] = ode45(@(t, x) [
    x(2); 
    ((Ip + Mp*lp^2)*Fc + Mp^2*lp^2*g*cos(x(3))*sin(x(3)) ...
    - (Ip + Mp*lp^2)*Beq*x(2) - (Ip*Mp*lp - Mp^2*lp^3)*x(4)^2*sin(x(3)) ...
    - Mp*lp*x(4)*cos(x(3))*Bp) / ...
    ((Mc + Mp)*Ip + Mc*Mp*lp^2 + Mp^2*lp^2*sin(x(3))^2);
    x(4);
    ((Mc + Mp)*Mp*g*lp*sin(x(3)) - (Mc + Mp)*Bp*x(4) ...
    + Fc*Mp*lp*cos(x(3)) - Mp^2*lp^2*x(4)^2*sin(x(3))*cos(x(3)) ...
    - Beq*Mp*lp*x(2)*cos(x(3))) / ...
    ((Mc + Mp)*Ip + Mc*Mp*lp^2 + Mp^2*lp^2*sin(x(3))^2)
], tspan, x0);

figure;
subplot(2,2,1);
plot(t, solu(:,1), 'Color', [0.6 0.2 0.6], 'LineWidth', 1.5);
xlabel('Tiempo (s)');
ylabel('Desplazamiento xc (m)');
title('Desplazamiento del carrito');
grid on;

subplot(2,2,2);
plot(t, solu(:,3), 'Color', [0.6 0.2 0.6], 'LineWidth', 1.5);
xlabel('Tiempo (s)');
ylabel('Ángulo α (rad)');
title('Ángulo del péndulo');
grid on;

subplot(2,2,3);
plot(t, solu(:,2), 'Color', [0.6 0.2 0.6], 'LineWidth', 1.5);
xlabel('Tiempo (s)');
ylabel('Velocidad xc˙ (m/s)');
title('Velocidad del carrito');
grid on;

subplot(2,2,4);
plot(t, solu(:,4), 'Color', [0.6 0.2 0.6], 'LineWidth', 1.5);
xlabel('Tiempo (s)');
ylabel('Velocidad angular α˙ (rad/s)');
title('Velocidad angular del péndulo');
grid on;
