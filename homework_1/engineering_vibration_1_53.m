% © 2022 2018100778 최동욱 기계공학과 <ch3044637@khu.ac.kr>
% 각각의 zeta에 대한 감쇠 시스템의 변위와의 관계식

% initialize
clear; clc;

% initial condition
Wn = 2; X0 = 1e-3; V0 = 1e-3; zeta = [0.01; 0.1; 0.2; 0.4; 0.8];

% damped natural frequency, phase, and amplitude
Wd = Wn * sqrt(1-zeta.^2);
pi = atan(X0 * Wd./(V0+zeta*Wn*X0));
A = sqrt(((V0 + zeta.*Wn*X0)./(Wd)).^2+X0.^2);

% time
t = 0:0.1:30;

% displacement obtained by analysis
Xt = A.*exp(-Wn*zeta*t).*sin(Wd*t+pi);

% plot fuctions
subplot(5, 1, 1); plot(t, Xt(1,1:301));
title ('damping system, \zeta = 0.01');
xlabel('time, t(s), step 0.1');
ylabel('displacement, x(t)');
axis([0, 30, -3e-3, 3e-3]);

subplot(5, 1, 2); plot(t, Xt(2,1:301));
title ('damping system, \zeta = 0.1');
xlabel('time, t(s), step 0.1');
ylabel('displacement, x(t)');
axis([0, 30, -3e-3, 3e-3]);

subplot(5, 1, 3); plot(t, Xt(3,1:301));
title ('damping system, \zeta = 0.2');
xlabel('time, t(s), step 0.1');
ylabel('displacement, x(t)');
axis([0, 30, -3e-3, 3e-3]);

subplot(5, 1, 4); plot(t, Xt(4,1:301));
title ('damping system, \zeta = 0.4');
xlabel('time, t(s), step 0.1');
ylabel('displacement, x(t)');
axis([0, 30, -3e-3, 3e-3]);

subplot(5, 1, 5); plot(t, Xt(5,1:301));
title ('damping system, \zeta = 0.8');
xlabel('time, t(s), step 0.1');
ylabel('displacement, x(t)');
axis([0, 30, -3e-3, 3e-3]);