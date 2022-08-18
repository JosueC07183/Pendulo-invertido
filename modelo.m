clc;
clear;
close all;

% Definición de los parámetros del sistema
M = 1.096; m = 0.109; L = 0.5; g = 9.81; F =1; mu = 0; b=0.1; I=0.0034;

% Condiciones iniciales
x0 = [0 0 0 0];

% Definición de tiempos de la simulación
Tf = 0.5; % Tiempo final de simulacion
T = 0: 0.1: Tf; % Tiempo de simulación

% Declaracion de funcion
funcion = @(t, x)penduloinv(t, x, F ,m, M, L, g, mu, b,I);

[ts,x] = ode45(funcion, T, x0);

% Graficar resultados
subplot(2, 2, 1)
plot(ts, x(:, 1))
title('x')
ylabel('posición(m)')
xlabel('Tiempo (s)')

subplot(2, 2, 2)
plot(ts, x(:, 2))
title('xʹ')
ylabel('Velocidad(m/s)')
xlabel('Tiempo (s)')

subplot(2, 2, 3)
plot(ts, x(:, 3))
title('\theta')
ylabel('Posición angular(rad)')
xlabel('Tiempo (s)')

subplot(2, 2, 4)
plot(ts, x(:, 4))
title('\theta ʹ')
ylabel('Velocidad angular(m/s)')
xlabel('Tiempo (s)')

figure(2)
plot(ts, x)

lgd = legend('x', 'xʹ', '\theta', '\theta ʹ', 'location', 'best');
%%% title(lgd, 'Péndulo Invertido')
title('Respuesta modelo no lineal ante fuerza de 1 N'); grid
xlabel('Tiempo (s)')
ylabel('Amplitud')

