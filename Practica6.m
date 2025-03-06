L = 2e-3;   
R = 10;     
C = 10e-6;  
Uin = 32;   
D = 0.4;    

x0 = [0; 0]; 

tspan = [0 0.01]; 

[t, x] = ode45(@(t, x) state_space(t, x, L, C, R, Uin, D), tspan, x0);

figure;
plot(t, x(:,1), 'g', 'DisplayName', 'Corriente'); 
hold on;
plot(t, x(:,2), 'b', 'DisplayName', 'Voltaje');   
hold off;

xlabel('Tiempo (s)');
ylabel('Magnitud');
grid on;
title('Corriente en el inductor y voltaje en el capacitor');
legend('show');

function dx = state_space(t, x, L, C, R, Uin, D)
    
    d = D; 
    
   
    A = [0, -1/L; 1/C, -1/(R*C)];
    B = [Uin/L; 0];
    
  
    dx = A*x + B*d;
end