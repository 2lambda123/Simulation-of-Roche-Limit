function main1()
    G=6.6743e-11;
    R=6.3781e6;
    m_earth=1.898e20;
    % des=2 * R;
    % 
    % clockmax=100000;
    % 
    % desMults = linspace(2,10,3);
    des=3.844039e7;
    v0=sqrt(G*m_earth/des);
    % desMults = 6;
    vMults = linspace(0.1,1.5,7);
    % u=-sqrt(G*m_earth/des);
    rouM = 5510;
    roum = 3340;

    radiusD = 1.26*R*(rouM/roum)^(1/3);
    numPoints = 10000;
    theta = linspace(0, 2*pi, numPoints);
    Dx = radiusD*cos(theta);
    Dy = radiusD*sin(theta);
    plot(Dx, Dy);
    hold on;

    
    % change des, others fixed 
    % count = 0;
    for j = 1 : length(vMults)
        % count = count + 1
        Roche_earth_moon(vMults(j)*v0);
        pause(0.1);
    end

    fprintf("fininshed");
end