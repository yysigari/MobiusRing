%fifth
% place skew quadrupoles in the 2nd half of the cell between defocusing and
% focusing quad of th enext section where beta_x is ascending and beta_y is
% descending.

fodoskew=[
    2,1,0,F;
    1,10,L/10,0;
    2,1,0,-F;
    1,5,L/10,0;
    60,1,0,0;   %Skew-Quadrupole
    1,5,L/10,0];
%calcualte the new beta function at the location of quadrupole
fodo_from_skew=circshift(fodoskew,2);
beamline=fodo_from_skew;
[Racc,spos,nmat,nlines]=calcmat(beamline);
sigma_skew=periodic_beammatrix2(Racc(:,:,end),1,1,0);
beta0=sigma_skew(1,1);

%match arc to skew cell
match_arc_to_skew=[cell90;fodoskew];
beamline=match_arc_to_skew;
sigma_start=sigma_arc;
sigma_end=sigma_tuner;
x0=[3.5,-3.5,3.5,-3.5];
[x,fval]=fminsearch(@chisq_betafunctions_skew,x0);

skew_straight_in=beamline;
%match skew to arc cell
match_skew_to_arc=repmat(cell90,2,1);
beamline=match_skew_to_arc;
[Racc,spos,nmat,nlines]=calcmat(beamline);

sigma_start=sigma_tuner;
sigma_end=sigma_arc;
x0=[3.5,-3.5,3.5,-3.5]; %+randn(1,4);
[x,fval]=fminsearch(@chisq_betafunctions_skew,x0);
skew_straight_out=beamline;
%Mobius Straight is defined, turning on the skew quads
skew_quads_on=1 %1 = on, 0= off.
skew_quad_strength=0 %slider to adjust the skew strength

scale_factor=0;
if abs(skew_quad_strength)>0,scale_factor=1/skew_quad_strength; end
if skew_quads_on
    fodoskew(5,4)=scale_factor*beta0;
    skew_straight_in(9,4)=scale_factor*beta0;
end
mobius_straight=[
    skew_straight_in;
    fodoskew;
    fodoskew;
    skew_straight_out];
%propagate sigma_arc through this section
beamline=mobius_straight;
[Racc,spos,nmat,nlines]=calcmat(beamline);
figure; plot_betas(beamline,sigma_arc);drawmag(beamline,1,2);
title('Mobius Straight');

Rend=Racc(:,:,end);
sigtmp=Rend*sigma_arc*Rend'
Bmag=BmagBoth(sigtmp,sigma_arc);
Qmobius=tunes(Rend);


