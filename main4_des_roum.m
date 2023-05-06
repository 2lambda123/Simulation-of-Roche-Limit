function main4()
    G=6.6743e-11;
    R=6.3781e6;
    m_earth=1.898e20;
    des=2 * R;
    tmax=365.25*24*60*60*7;
    clockmax=100000;

    
    dt = 10;
    r=2*R;
    v0=sqrt(G*m_earth/r);
    v=0.4*v0;
    u=-sqrt(G*m_earth/r);
    %roum = linspace(7000,13000,10);
    rouM=5510;
    roum0 = 3300;
    desMults = linspace(2,10,3);
    roumMults = linspace(1,3,3);
    
    % change des, others fixed 
    % count = 0;
    for i = 1 : length(desMults)
        for j = 1 : length(roumMults)
            % count = count + 1
            Roche(desMults(i), 365.25*24*60*60*7, dt, u, v, roum0*roumMults(j));
            pause(0.1);
        end
    end

    fprintf("fininshed");
end