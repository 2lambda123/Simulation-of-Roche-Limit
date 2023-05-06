G=6.6743e-11;
R=6.371e6;
m_moon=7.342e22; % mass of the Moon
des=2 * R * 10; % Earth-Moon distance
center = [0 0];

numPoints = 10000;
theta = linspace(0, 2*pi, numPoints);
Cx = center(1) + R*cos(theta);
Cy = center(2) + R*sin(theta);

% Validation 1
figure(1);
tmax=365.25*24*60*60;
clockmax=1000 ;
dt=tmax/clockmax;
x=des;
y=0;
r=sqrt(x^2+y^2);
u=-0.7*sqrt(G*m_moon/r); % velocity towards the Moon
v=sqrt(G*m_moon/r); % perpendicular velocity for an orbit

x_saved = zeros(clockmax, 1);
y_saved = zeros(clockmax, 1);
for clock=1:clockmax
    r=sqrt(x^2+y^2);
    u = -G * m_moon * dt * x * r^(-3) + u;
    v = -G * m_moon * dt * y * r^(-3) + v;
    x_saved(clock) = x;
    y_saved(clock) = y;
    x = u * dt + x;
    y = v * dt + y;
end

plot(0,0,'r*');
hold on;
plot(Cx, Cy);
hold on;
plot(x_saved, y_saved, 'b');
axis(5*[-des,des,-des,des]);
axis equal;
axis manual;

% Validation 2
figure(2);
tmax=365.25*24*60*60*50;
clockmax=1000*50;
dt=tmax/clockmax;

x=des;
y=0;
r=sqrt(x^2+y^2);
u=-0.7*sqrt(G*m_moon/r); % velocity towards the Moon
v=sqrt(G*m_moon/r); % perpendicular velocity for an orbit

x_saved = zeros(clockmax, 1);
y_saved = zeros(clockmax, 1);
for clock=1:clockmax
    r=sqrt(x^2+y^2);
    u = -G * m_moon * dt * x * r^(-3) + u;
    v = -G * m_moon * dt * y * r^(-3) + v;
    x_saved(clock) = x;
    y_saved(clock) = y;
    x = u * dt + x;
    y = v * dt + y;
end

plot(0,0,'r*');
hold on;
plot(Cx, Cy);
hold on;
plot(x_saved, y_saved, 'b');
axis(5*[-des,des,-des,des]);
axis equal;
axis manual;

% Validation 3
figure(3);
tmax=365.25*24*60*60*800;
clockmax=1000*800;
dt=tmax/clockmax;
x=des;
y=0;
r=sqrt(x^2+y^2);
u=-0.7*sqrt(G*m_moon/r); % velocity towards the Moon
v=sqrt(G*m_moon/r); % perpendicular velocity for an orbit

x_saved = zeros(clockmax, 1);
y_saved = zeros(clockmax, 1);
for clock=1:clockmax
    r=sqrt(x^2+y^2);
    u = -G * m_moon * dt * x * r^(-3) + u;
    v = -G * m_moon * dt * y * r^(-3) + v;
    x_saved(clock) = x;
    y_saved(clock) = y;
    x = u * dt + x;
    y = v * dt + y;
end

plot(0,0,'r*');
hold on;
plot(Cx, Cy);
hold on;
plot(x_saved, y_saved, 'b');
axis(5*[-des,des,-des,des]);
axis equal;
axis manual;

% Validation 4
figure(4);
tmax=365.25*24*60*60*500;
clockmax=1000*8000;
dt=tmax/clockmax;

x_saved2 = zeros(clockmax, 1);
y_saved2 = zeros(clockmax, 1);
for clock=1:clockmax
    r=sqrt(x^2+y^2);
    u = -G * m_moon * dt * x * r^(-3) + u;
    v = -G * m_moon * dt * y * r^(-3) + v;
    x_saved2(clock) = x;
    y_saved2(clock) = y;
    x = u * dt + x;
    y = v * dt + y;
end

plot(0,0,'r*');
hold on;
plot(Cx, Cy);
hold on;
plot(x_saved2, y_saved2, 'b');
axis(5*[-des,des,-des,des]);
axis equal;
axis manual;
