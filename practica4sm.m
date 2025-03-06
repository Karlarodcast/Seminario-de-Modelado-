m = 10;
r = 0.05;
k = 100;

function dx = practica4(t, x, m, r, k)
    dx = zeros(2,1);
    dx(1) = x(2);
    dx(2) = (-2 * k * x(1)) / (3 * m);
end 

x0 = [0; 2];
[t, x] = ode45(@(t,x) practica4(t, x, m, r, k), [0 10], x0);

figure;

plot(t, x(:,1), 'b', 'LineWidth', 1.5);
hold on; 

plot(t, x(:,2), 'y', 'LineWidth', 1.5);

xlabel('Tiempo (s)');
ylabel('Valor');
legend('\theta (Desplazamiento)', '\thetȧ (Velocidad angular)');
title('Movimiento del sistema: Desplazamiento y Velocidad angular');
grid on;