%Display all parameters %eigth
[Racc,spos,nmat,nlines]=calcmat(beamline);
Rend=Racc(:,:,end);
[O,A,T,p]=sagrub(Rturn,flipped);
figure
box on
text(0.05,0.9,['E_0 =', num2str(E0/1e3), ' GeV  C=', num2str(C), 'm'], 'FontSize', 16);
text(0.05,0.8,['Q-a =', num2str(Qtune(end,1),5), ' Q_b =', num2str(Qtune(end,2),5), 'm'], 'FontSize', 16)
text(0.05,0.7,['eps_a =', num2str(eps(1),3), ' eps_b=', num2str(eps(2),3), 'm'], 'FontSize', 16);
text(0.05,0.6,['tau_a =', num2str(tau(1)*1e3,3), ' ms  tau_b=', num2str(tau(2)*1e3,3), 'ms'], 'FontSize', 16)
text(0.05,0.5,['tau_e =', num2str(tau(3)*1e3,3), ' ms  sig_p=', num2str(sigp, '%.2e'), 'm'], 'FontSize', 16)
text(0.05,0.4,['alpha =', num2str(alpha,'%.2e')], 'FontSize', 16)
text(0.05,0.3,['I_1 =', num2str(I1), ' I_2=', num2str(I2),  ' I_3=', num2str(I3) ], 'FontSize', 16)
text(0.05,0.2,['I_{4a} =', num2str(I4(1),3), ' I_{4b} =', num2str(I4(2),3)], 'FontSize', 16)
text(0.05,0.1,['I_{5a} =', num2str(I5(1),3), ' I_{5b} =', num2str(I5(2),3)], 'FontSize', 16)
title('Beam Parameters');
axis off

save('MR0_beamline.mat', 'beamline', 'E0', 'C', 'beta0', 'flipped')
toc