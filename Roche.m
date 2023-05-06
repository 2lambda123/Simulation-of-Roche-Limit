function Roche(desMult, tmax, dt, u, v, roum)
    G=6.6743e-11;
    R=6.3781e6; % m
    m_earth=1.898e20;  % kg
    rouM=5510;
    des=desMult * R;
    clockmax=int32(tmax/dt);
    xsave = zeros(1,clockmax);
    ysave = zeros(1,clockmax);
    tsave = zeros(1,clockmax);
    x=des; % distance from Jupiter to Earth
    y=0; % Earth and Jupiter are assumed to be in the same plane
    r=sqrt(x^2+y^2);
    
    % u=-0.7*sqrt(G*m_earth/r); % velocity towards Jupiter
    % v=sqrt(G*m_earth/r); % perpendicular velocity for an orbit
    
    
    numPoints = 1000;
    theta = linspace(0, 2*pi, numPoints);
    Cx = R*cos(theta);
    Cy = R*sin(theta);
    
    plot(0,0,'r*');
    hold on;
    plot(Cx, Cy);
    hold on;
    % hp=plot(x,y,'bo'); %Plot the blue colored circle markers
    % htrail=plot(x,y);
    axis(1.1*[-des,des,-des,des]);
    axis equal;
    %axis manual;

    x_saved = zeros(clockmax, 1);
    y_saved = zeros(clockmax, 1);
    for clock=1:clockmax
        r=sqrt(x^2+y^2);
        if(r>1.26*R*(rouM/roum)^(1/3))
            u = -G * m_earth * dt * x * r^(-3) + u;
            v = -G * m_earth * dt * y * r^(-3) + v;
            x_saved(clock) = x;
            y_saved(clock) = y;
            x = u * dt + x;
            y = v * dt + y;
        end
    end
    plot(x_saved, y_saved);
end

