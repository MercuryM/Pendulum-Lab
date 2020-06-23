figure(1)
plot(out.simout.Time,out.simout.Data(:,1),'lineWidth',1)
hold on
plot(out.simout.Time,out.simout2.Data(:,1),'lineWidth',1)
grid on
xlabel('time(s)')
legend('Response \theta using K', 'Response \theta using K*')
title('Response \theta for upward case')

figure(2)
plot(out.simout.Time,out.simout.Data(:,2),'lineWidth',1)
hold on
plot(out.simout.Time,out.simout2.Data(:,2),'lineWidth',1)
grid on
xlabel('time(s)')
legend('Response \alpha using K', 'Response \alpha using K*')
title('Response \alpha for upward case')

figure(3)
plot(out.simout.Time,out.simout1.Data(:,1),'lineWidth',1)
hold on
plot(out.simout.Time,out.simout3.Data(:,1),'lineWidth',1)
% ylim([-40,40])
grid on
xlabel('time(s)')
legend('Control signal using K','Control signal using K*')
title('Control signal for upward case')

