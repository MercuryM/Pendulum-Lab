syms Jm Jp a a1 o o1 m l r g  vm
T = 0.5 * Jm * o1^2 + 0.5 * Jp * a1^2 + 0.5 * m * (-cos(o)*sin(a)*o1*l-sin(o)*cos(a)*a1*l-sin(o)*o1*r)^2+0.5*m*(-sin(o)*sin(a)*o1*l+cos(o)*cos(a)*a1*l+cos(o)*o1*r)^2+0.5*m*(sin(a))^2*a1^2*l^2;
V = -m * cos(a) * g * l
T1 = expand (T)
T2 = simplify(T1)
T3 = collect(T2,o1)
T4 = collect(T2,o)
T5 = collect(T2,a1)
T6 = collect(T2,a)
X1 = diff(T2, o1)
X2 = diff(T2,o)
X3 = diff(T2, a1)
X4 = diff(T2, a)
X5 = diff(V, a)
syms Rm kt nm km kg ng m l Jp Jm Bp Ba r g
% Rm = 2.6;kt = 0.00768;nm = 0.69; km = 0.00768; kg = 70;
% ng = 0.9; m = 0.127; l= 0.1556; Jp = 0.0012; Jm = 0.002;
% Bp = 0.0024; Ba = 0.0024; r = 0.2159; g = 9.81;
% 
tm = ng*kg*nm*kt*vm
Q = [m*r^2+Jm, m*l*r;m*l*r,Jp+m*l^2]
P = -[ng*kg*nm*km*kg*km/Rm + Ba,0;0,Bp];
W = -[0,0;0,m*g*l]
Z = [ng*kg*nm*km;0];
Q^-1*P
Q^-1*W
Q^-1*Z
Q^-1
A1 = [0,0,1,0;0,0,0,1;Q^-1*W,Q^-1*P]
B1 = [0;0;Q^-1*Z]
pretty(A1)
pretty(B1)
Q2 = [m*r^2+Jm, -m*l*r;-m*l*r,Jp+m*l^2]
P2 = -[ng*kg*nm*km*kg*km/Rm + Ba,0;0,Bp];
W2 = -[0,0;0,-m*g*l]
Z2 = [ng*kg*nm*km;0];
Q2^-1*P2
Q2^-1*W2
Q2^-1*Z2
A2 = [0,0,1,0;0,0,0,1;Q2^-1*W2,Q2^-1*P2]
B2 = [0;0;Q2^-1*Z2]
pretty(A2)
pretty(B2)