function v = project_function_3_2(t, x)
    % initial condition
    m = 800; k = 4e4; c = 2e3; v = 20;
    l = 0.005; hour2sec = 3600;
    A = 0.01;

    % natural frequency, driving frequency, damping ratio
    Wn = sqrt(k/m);
    Wb = v*2*pi/(l*hour2sec);
    zeta = c/(2*sqrt(k*m));
    t0 = pi/Wb;

    % numerical solution
    v = [x(2); x(2).*-2*zeta*Wn+x(1).*-Wn^2+ ...
        c/m*A*Wb*cos(Wb*t)*(stepfun(t, 0) - stepfun(t, t0)) + ...
        k/m*A*sin(Wb*t)*(stepfun(t, 0) - stepfun(t, t0))];
end