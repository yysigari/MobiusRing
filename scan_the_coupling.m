% scan_the_coupling.m
%
clear all; close all
load('MR0_beamline.mat')
tic
s=0.0:0.02:1.5;   % the scale factor for the skew parameter
data=zeros(length(s),20);
for k=1:length(s)
  status=[k,s(k),toc]
  if abs(s(k))>0, scale_factor=1/s(k); else scale_factor=0; end
  beamline(9,4)=scale_factor*beta0;   
  beamline(15,4)=scale_factor*beta0;  
  beamline(21,4)=scale_factor*beta0;  
  [Racc,spos,nmat,nlines,ibl]=calcmat(beamline); Rend=Racc(:,:,end);
  [O,A,T,p]=sagrub(Rend,flipped);
  data(k,1:6)=p(1:6);
  [beta1,beta2,disp,Qtune]=plot_betas_unrolled(beamline,flipped,0);
  data(k,7:8)=Qtune(end,:);
  [I1,I2,I3,I4,I5]=radiation_integrals(beamline,flipped);
  data(k,9:15)=[I1,I2,I3,I4,I5];
  [alpha,sigp,tau,emit]=beam_parameters(E0,C,I1,I2,I3,I4,I5);
  data(k,16)=alpha;
  data(k,17)=sigp;
  data(k,18:20)=tau;
  data(k,21:22)=emit;
end
save('mobius_data_x.mat','data','s')
% and display the data
scan_the coupling_display