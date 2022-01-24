%Mobius straight section %fourth
%FODO cells with 90 degree phase advance in both planes
cell90=[
    2,1,0,F;
    1,10,L/10,0;
    2,1,0,-F;
    1,10,L/10,0];
beamline = cell90;
[Racc,spos,nmat,nlines]=calcmat(beamline);
sigma_tuner=periodic_beammatrix2(Racc(:,:,end),1,1,0);

Q_cell90=tunes(Racc(:,:,end));
figure; plot_betas(beamline,sigma_tuner); drawmag(beamline,1,2);
title('90-degree FODO cell in straight section')

save('sigma_tuner.mat','sigma_tuner');