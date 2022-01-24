%sixth
%Build tuner section of 3x2 cells
part1=repmat(cell90,2,1); part2=part1;part3=part1;
beamline=cell90;
Qx=0.2;
Qy=0.2;
x0=[3.5,-3.5];
[x,fval]=fminsearch(@chisq_tunes_part,x0);

part2=[beamline;beamline];
[Racc,spos,nmat,nlines]=calcmat(beamline);
Rend=Racc(:,:,end);

Q=tunes(Rend);
sigma_part2 = periodic_beammatrix2(Rend,1,1,0);
figure; plot_betas(beamline,sigma_part2); drawmag(beamline,1,2);
title(['Part2,   Qx =', num2str(Q(1)), ',  Qy = ',num2str(Q(2))]);

beamline=part1;
sigma_start=sigma_arc;
sigma_end=sigma_part2;
x0=[3.5,-3.5,3.5,-3.5]; %+randn(1,4);
[x,fval]=fminsearch(@chisq_betafunctions_skew,x0);

part1=beamline;
beamline=part3
sigma_start=sigma_part2;
sigma_end=sigma_arc;
[x,fval]=fminsearch(@chisq_betafunctions_skew,x0);

part3=beamline;
tuner_straight=[
    part1;part2;part3];
beamline=tuner_straight;
[Racc,spos,nmat,nlines]=calcmat(beamline);
figure; plot_betas(beamline,sigma_arc);drawmag(beamline,1,2);
title('Tune Straight')
%pages 14-18 left

Rend=Racc(:,:,end); Q=tunes(Rend);
sigma=Rend*sigma_arc*Rend' ;
Bmag=BmagBoth(sigma,sigma_arc);
%Ring and tune
ring=[
    mobius_straight;
    arc;
    tuner_straight;
    arc];
ring2=[
    tuner_straight;
    arc;
    mobius_straight;
    arc];
beamline=ring;
[Racc,spos,nmat,nlines]=calcmat(beamline);

Rend=Racc(:,:,end);
Q=tunes(Rend);
%plot beta functions
flipped=0;
show=1;
[beta1,beta2,disp,Qtune]=plot_betas_unrolled(beamline,flipped,show);
