T = 1500; %1500 - 2500 netwon
m = 11.8;
length = 1.1; % 1.1m
diameter = 0.127; %12.7 cm
L_cm = 0.45; % antar senter av massen er 45 cm fra tuppen
L_aksial = length - L_cm;
L_hypotenus = sqrt(L_aksial^2 + (diameter/2)^2);
K_finne = 0.5; % kg/rad
K_drag = 0.005; % kg/m
g = 9.81;
I_treghet = (1/12)*m*length^2;

%startverdier
x0 = 0;
z0 = 0;
theta0 = pi/4; %startvinkel
theta_dot = 0; %start vinkelhastighet
v0 = 0;
v_z0 = 0;
v_x0 = 0;

%Regulator verdier
Kp_pitch = 40.0; %Indre sløyfe PD verdier
Kd_pitch = 15.0;

Kp_altitude = 0.08; %Ytre sløyfe PI verdier
Ki_altitude = 0.001;
Kd_altitude = 0.05;

theta_ff = asin((m*g)/T); %Skal egtl bruke F_aksial istedenfor T, men har minimalt å si
theta_ref_saturation = 1;
delta_pitch_saturation = pi/4;

%Referanseverdier
z_ref = 150;