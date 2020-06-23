%% State Space Representations
% downward position
A_down = [0 0 1 0;0 0 0 1;0 52.8369133 -19.50692833 0.6541334519;0 -98.08151611 19.46859916 -1.214272309];
B_down = 2.6*[0;0;35.06604733;-34.99714604];

% upward position
A_up = [0 0 1 0;0 0 0 1;0 52.8369133 -19.50692833 -0.6541334519;0 98.08151611 -19.46859916 -1.214272309];
B_up = 2.6*[0;0;35.06604733;34.99714604];

C = [1,0,0,0;0,1,0,0];
D = [0;0];

eig_down = eig(A_down)
eig_up = eig(A_up)

G_down = ss(A_down,B_down,C,D)
G_up = ss (A_up,B_up,C,D)
figure(1)
step (G_down)
figure(2)
step (G_up)

% [B_down,A_down*B_down,A_down*A_down*B_down,A_down*A_down*A_down*B_down]
R_down = ctrb(A_down,B_down)
rank(R_down)
R_up = ctrb(A_up,B_up)
rank(R_up)

%% Design
% desired closed loop eigenvalues
% P = [-4+1i -4-1i -20 -21];
% P1 = [-1-sqrt(3)*j -1+sqrt(3)*j -5 -10]
P2 = [-7-7*j -7+7*j -35 -50]


% downward position K
% K_down1 = acker(A_down, B_down, P1);
K_down2 = acker(A_down, B_down, P2);

% C_down1 = [1,0,0,0;0,1,0,0;K_down1];
C_down2 = [1,0,0,0;0,1,0,0;K_down2];

% G_down1 = ss(A_down-B_down*K_down1,B_down,C_down1,D)
G_down2 = ss(A_down-B_down*K_down2,B_down,C,D)
% figure(1)
% step(G_down1)
figure(3)
step(G_down2)

% upward position K
K_up = acker(A_up, B_up, P2);
G_up2 = ss(A_up-B_up*K_up,B_up,C,D)
figure(4)
step(G_up2)


% LQR
Q_down = eye(4);
Q_down(1,1) = 0.01;
R_down = 10;
K_down_LQR = lqr(A_down, B_down, Q_down, R_down);
C_down_LQR = [1,0,0,0;0,1,0,0;K_down_LQR];

G_down_LQR = ss(A_down-B_down*K_down_LQR,B_down,C,D)
figure(5)
step(G_down_LQR)

Q_up = eye(4);
Q_up(1,1) = 0.01;
R_up = 100;
K_up_LQR = lqr(A_up, B_up, Q_up, R_up);

G_up_LQR = ss(A_up-B_up*K_up_LQR,B_up,C,D)
figure(6)
step(G_up_LQR)

Poles_down = eig(A_down-B_down*K_down_LQR);
Poles_up = eig(A_up-B_up*K_up_LQR);


% 
% ts = 0.01;
% t = 0 : ts : 5;
% x0 = [0; 0.1; 0.1; 0];
% [y1,t1,x1] = initial(G_down2,x0,t);
% [y2,t2,x2] = initial(G_down_LQR,x0,t);
% figure(6)
% yyaxis left;
% plot(t1, x1(:,3),'LineWidth',2)
% hold on
% plot(t2, x2(:,3),'LineWidth',2)
% ylabel('Cart Velocity(m/s)')
% yyaxis right;
% plot(t1, x1(:,4),'LineWidth',2)
% hold on
% plot(t2, x2(:,4),'LineWidth',2)
% ylabel('Pendulum Angular Velocity(rad/s)')
% xlabel('Time(s)');
% legend('Trial 1 - x2','Trial 2 - x2','Trial 1 - x4','Trial 2 - x4')
% grid on
% title('Cart Velocity and Pendulum Angular Velocity in 2 Cases');
