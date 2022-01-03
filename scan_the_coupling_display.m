% scan_the coupling_display.m
clear; close all
s=0.0:0.02:1.5; 
load('mobius_data_4.mat');
N=length(s);
%
% for k=1:N
%   if abs(data(k,7))>27, data(k,7)=data(k,7)-1; end
%   if abs(data(k,8))>25, data(k,8)=data(k,8)-1; end
% end

fracQ1l=data(1,7)-floor(data(1,7));
fracQ2l=data(1,8)-floor(data(1,8));
for k=2:N
  fracQ1=data(k,7)-floor(data(k,7));
  fracQ2=data(k,8)-floor(data(k,8));
  if abs(fracQ1-fracQ1l)<abs(fracQ2-fracQ2l)
    data(k,7)=floor(data(k-1,7))+fracQ1;
    data(k,8)=floor(data(k-1,8))+fracQ2;
  else
    data(k,7)=floor(data(k-1,7))+fracQ2;
    data(k,8)=floor(data(k-1,8))+fracQ1;
  end
end

subplot(2,1,1); plot(s,data(:,1),'k*',s,data(:,4),'k*')
xlabel('Skew quad strength [0=uncoupled, 1=Mobius]'); ylabel('[Q_a], [Q_b]')
text(0.04,0.63,'Q_b=24.x');
text(0.04,0.30,'Q_a=26.x');
subplot(2,1,2); plot(s,real(data(:,7)),'k*',s,real(data(:,8)),'k*')
xlabel('Skew quad strength [0=uncoupled, 1=Mobius]'); ylabel('Q_a, Q_b')
ylim([24.1,26.9])
%
for k=1:N
  if abs(data(k,21))>1, data(k,21)=NaN; end
  if abs(data(k,22))>1, data(k,22)=NaN; end
end
figure; 
subplot(2,1,1); plot(s,1e9*abs(data(:,21)),'k*',s,1e9*abs(data(:,22)),'k*')
xlabel('Skew quad strength [0=uncoupled, 1=Mobius]'); 
ylabel('Emittances \epsilon_a,\epsilon_b [nm-rad]')
%
% figure; plot(s,abs(data(:,18)),'k*',s,abs(data(:,19)),'k*', ...
%   s,abs(data(:,20)),'k*')
% xlabel('Skew quad strength [0=uncoupled, 1=Mobius]'); 
% ylabel('Damping times \tau_1,\tau_2, \tau_p')
%
subplot(2,1,2); plot(s,data(:,1)+data(:,4),'k*', ...
  s,data(:,1)-data(:,4),'ko')
xlabel('Skew quad strength [0=uncoupled, 1=Mobius]'); 
ylabel('Q_a+Q_b and Q_a-Q_b')
legend('Q_a+Q_b','Q_a-Q_b','Location','SouthEast')
ylim([-0.55,1.05])

figure
subplot(2,1,1);
plot(s,1e3*abs(data(:,18)),'k',s,1e3*abs(data(:,19)),'r-.')
xlabel('Skew quad strength [0=uncoupled, 1=Mobius]');
ylabel('\tau_a, \tau_b [ms]')
legend('\tau_a','\tau_b')
subplot(2,1,2);
plot(s,1e3*abs(data(:,20)),'k'); ylim([4.5,4.6])
xlabel('Skew quad strength [0=uncoupled, 1=Mobius]');
return

figure
subplot(2,1,1); plot(s,1e9*abs(data(:,21)+data(:,22)),'k*')
subplot(2,1,2); plot(s,1e9*abs(data(:,21)-data(:,22)),'k*')

return


% figure
% Q1=data(:,7)-floor(data(:,7));
% Q2=data(:,8)-floor(data(:,8));
% plot(s,Q1,'k',s,Q2,'r')
%
figure
fracQ1l=data(1,7)-floor(data(1,7));
fracQ2l=data(1,8)-floor(data(1,8));
for k=2:N
  fracQ1=data(k,7)-floor(data(k,7));
  fracQ2=data(k,8)-floor(data(k,8));
  if abs(fracQ1-fracQ1l)<abs(fracQ2-fracQ2l)
    data(k,7)=floor(data(k-1,7))+fracQ1;
    data(k,8)=floor(data(k-1,8))+fracQ2;
  else
    data(k,7)=floor(data(k-1,7))+fracQ2;
    data(k,8)=floor(data(k-1,8))+fracQ1;
  end
end
plot(s,real(data(:,7)),'k*',s,real(data(:,8)),'k*')
return



%...................for publication
close all
figure
subplot(3,1,1); plot(s,data(:,1),'k*',s,data(:,4),'k*')
text(0.04,0.63,'Q_b=24.x');
text(0.04,0.30,'Q_a=26.x');
xlabel('Skew quad strength [0=uncoupled, 1=Mobius]'); 
ylabel('[Q_a], [Q_b]')
subplot(3,1,2); plot(s,1e9*abs(data(:,21)),'k*',s,1e9*abs(data(:,22)),'k*')
xlabel('Skew quad strength [0=uncoupled, 1=Mobius]'); 
ylabel('Emittances \epsilon_a,\epsilon_b [nm-rad]')
subplot(3,1,3); plot(s,data(:,1)+data(:,4),'k*',s,data(:,1)-data(:,4),'ko')
xlabel('Skew quad strength [0=uncoupled, 1=Mobius]'); 
ylabel('Q_a+Q_b and Q_a-Q_b')
legend('Q_a+Q_b','Q_a-Q_b','Location','SouthEast')
ylim([-0.55,1.05])
%set(gca,'FontSize',16)
set(gcf,'Position',[100,100,800,700])