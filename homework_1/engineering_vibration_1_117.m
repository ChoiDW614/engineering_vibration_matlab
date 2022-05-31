% © 2022 2018100778 최동욱 기계공학과 <ch3044637@khu.ac.kr>
% 수치적분법으로 구한 감쇠 시스템의 해와 엄밀해의 비교

% initialize
clear; clc;
% Numerical Solution
% time
t0 = 0; tf = 5;

% initial condition
X0 = 0; V0 = 0.01;

% displacement obtained by analysis
X = [X0 ; V0];
[t, x] = ode45('func_1_117', [t0 tf], X);

% plot fuctions
% subplot(2, 1, 1); plot(t, x(:,1));
% title('Numerical Solution');
% xlabel('time, second');
% ylabel('displacement, meter');
% axis([0 5 -7e-4 7e-4]); grid on;

% Exact Solution
% damped natural frequency, phase, and amplitude
m_e = 1361; k_e = 2.668e5; c_e = 3.81e3;
x0 = 0; v0 = 0.01;
Ccr = 2*sqrt(k_e*m_e); zeta = c_e/Ccr;
Wn = sqrt(k_e/m_e);
Wd = Wn * sqrt(1-zeta^2);
pi = atan(x0*Wd/(v0+zeta*Wn*x0));
A = sqrt(((v0 + zeta*Wn*x0)/(Wd))^2+x0^2);

% function
y = A*exp(-zeta*Wn*t).*sin(Wd*t+pi);

% plot fuctions
% subplot(2, 1, 2); plot(t, y);
% title('Numerical vs Exact Solution');
% xlabel('time, second');
% ylabel('displacement, meter');
% axis([0 5 -7e-4 7e-4]); grid on;

% plot fuctions
plot(t, x(:,1));
line(t, y);
title('Numerical vs Exact Solution');
xlabel('time, second');
ylabel('displacement, meter');
axis([0 5 -7e-4 7e-4]); grid on;

