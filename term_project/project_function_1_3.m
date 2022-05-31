function v = project_function_1_3(t, x)
    % initial condition
    m = 800; k = 4e4; c = 2e3; v = 20;
    l = 0.005; hour2sec = 3600;
    A = 0.01;
    
    % natural frequency, driving frequency, damping ratio
    Wn = sqrt(k/m);
    Wb = v*2*pi/(l*hour2sec);
    zeta = c/(2*sqrt(k*m));

    % numerical solution
    v = [x(2); x(2).*-2*zeta*Wn+x(1).*-Wn^2+c/m*A*Wb*cos(Wb*t) + ...
        k/m*A*sin(Wb*t)];
end