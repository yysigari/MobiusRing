function chisq=chisq_betafunctions_skew(x)
global beamline sigma0 D0  %need information from the beamline
global sigma_start sigma_end 
betax=sigma_end(1,1); alfax=-sigma_end(1,2);
betay=sigma_end(3,3); alfay=-sigma_end(3,4);

beamlline(1,4)=x(1); %Change quadrupole excitations
beamlline(3,4)=x(2);
beamlline(5,4)=x(3);
beamlline(7,4)=x(4);

[Racc,spos,nmat,nlines]=calcmat(beamline); Rend=Racc(:,:,end);
sigma=Rend*sigma_start*Rend';

%Chisq=(sigma(1,1)-betax)^2+ (sigma(1,2)+alfax)^2 ...
% +(sigma(3,3)-betay)^2+(sigma(3,4)+alfay)^2
chisq=Bmags(sigma_end(1:2,1:2),sigma(1:2,1:2))...
    +Bmags(sigma_end(3:4,3:4),sigma(3:4,3:4))-2 ;