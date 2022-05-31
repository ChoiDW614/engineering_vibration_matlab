function xdot = func_1_117(t, x)
% initial condition
m = 1361; k = 2.688e5; c = 3.81e3;

% expressing a differential equation as a state vector
xdot = zeros(2, 1);
xdot(1, 1) = x(2);
xdot(2, 1) = -(k/m) * x(1) - (c/m) * x(2);