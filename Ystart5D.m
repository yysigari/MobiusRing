clear; clear all
global beamline sigma0 D0
global Qx Qy
global sigma_start sigma_end
addpath ./5D
tic
%Length of a drift
L=5;
F=L/sqrt(2);
fodo90=[
    2,1,0,F;
    1,1,L/10,0;
    4,8,0.5,0.25;
    1,1,L/10,0;
    2,1,0,-F;
    1,1,L/10,0;
    4,8,0.5,0.25;
    1,1,L/10,0;];
beamline=fodo90;
[Racc,spos,nmat,nlines]=calcmat(beamline);
% find tunes and initial minimal vals
Qx=0.25;
Qy=0.23;
x0=[3.5,-3.5];
[x,fval]=fminsearch(@chisq_tunes,x0);
[Racc,spos,nmat,nlines]=calcmat(beamline);
Rturn=Racc(:,:,end)
Q=tunes(Rturn)
%calcualte the periodic beam matrix with unit emittances 
%gives us beta functions for plotting
sigma0=periodic_beammatrix2(Rturn,1,1,0)
plot_betas(beamline,sigma0)
drawmag(beamline,1,2)
dlmwrite('mobius_arc_cell.bl',beamline,'\t')
title('Fodo cell with full length dipoles')
fodo90=beamline; %save the matched beamline