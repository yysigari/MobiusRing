%seventh
Qtunes=Qtune(end,:);
%calcualte radiation integral
beamline=dipole_slicer(beamline,100);
[I1,I2,I3,I4,I5]=radiation_integrals(beamline,flipped);
%momentum compaction factor ,momentum spread, damping times,
%eigenemittances 
E0=10000;
C=spos(end);
[alpha, sigp, tau, eps]=beam_parameters(E0,C,I1,I2,I3,I4,I5);
%periodic beammatrix 
[Racc,spos,nmat,nlines]=calcmat(beamline);
Rend=Racc(:,:,end);

sigma0=periodic_beammatrix2(Rend,eps(1),eps(2),sigp);
figure; plot_sigmamatrix(beamline,sigma0);

