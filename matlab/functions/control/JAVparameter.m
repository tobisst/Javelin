%statiske verdier
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

areal_finne = 0.06*0.12; %cm^2


%startverdier
x0 = 0;
z0 = 0;
theta0 = theta_ff; %startvinkel
theta_dot = 0; %start vinkelhastighet
v_angle = 0;
v0 = 0;
v_z0 = 0;
v_x0 = 36;

phi0 = 0;
phi_dot0 = 0;
v_y0 = 0;
y0 = 0;

%Regulator verdier
Kp_pitch = 2.0; %Indre sløyfe PD verdier
Kd_pitch = 5.0;

Kp_altitude = 0.0005;
Ki_altitude = 0.00005;   % veldig forsiktig
Kd_altitude = 0.005;

theta_ff = asin((m*g)/T); %Skal egtl bruke F_aksial istedenfor T, men har minimalt å si
theta_ref_saturation_up = 0.2;
theta_ref_saturation_down = -0.1;

delta_pitch_saturation = pi/4;

delta_yaw_saturation = pi/4;

Kp_yaw = 30.0;    
Ki_yaw = 50;
Kd_yaw = 15.0;

%Referanseverdier
z_ref = 150;
x_ref = 2000;
y_ref = 50;
beta_ref = 0;
alpha_ref = 1.4; %vinkelen mot målet i xz planet i radianer, ca 80%


K_theta_dot_gain = 993; % verdi rett fra claude
v_square_cruice = 36^2;

A_front = pi*(diameter/2)^2;

A_side = diameter * length;

Cd = 0.25; 
rho = 1.225;
Cd_side = 0.025;



% Fysiske parametre
%T = 1500; m = 11.8; g = 9.81; I = (1/12)*m*L²
%K_finne = 0.5; L_aksial = 0.65; Cd = 0.25; rho = 1.225
%A_front = pi*(0.127/2)^2; A_side = 0.127*1.1
% Regulator (ytre — PID)
%Kp_alt = 0.005; Ki_alt = 0.001; Kd_alt = 0.02
% Regulator (indre — PD)
%Kp_pitch = 2; Kd_pitch = 5; N_filter = 10
%%theta_ff = asin(m*g/T); theta0 = theta_ff; z0 = 0; x0 = 0
%z_ref = 150; Rate Limiter: ±10 m/s"""
