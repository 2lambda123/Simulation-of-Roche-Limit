function main5()
    G=6.6743e-11;
    R=6.3781e6;
    m_earth=1.898e20;
    des=2 * R;
    tmax=365.25*24*60*60*700;
    clockmax=100000;

    desMults = linspace(2,10,3);
    dt = 10;
    r=2*R;
    v0=sqrt(G*m_earth/r);
    desMults = linspace(2,10,3);
    vMults = linspace(0.1,0.5,3);
    u=-sqrt(G*m_earth/r);
    rouM=5510;
    roum = 3300;
    
    % change des, others fixed 
    % count = 0;
    for i = 1 : length(desMults)
        for j = 1 : length(vMults)
            % count = count + 1
            radiusD = 1.26*R*(rouM/roum)^(1/3);
            numPoints = 10000;
            theta = linspace(0, 2*pi, numPoints);
            Dx = radiusD*cos(theta);
            Dy = radiusD*sin(theta);
            plot(Dx, Dy);
            hold on;
            Roche(desMults(i), 365.25*24*60*60*7, dt, u, vMults(j)*v0, roum);
            pause(0.1);
        end
    end

    fprintf("fininshed");
end