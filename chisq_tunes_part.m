function chisq= chisq_tunes_part(x)
global beamline sigma0 D0
global Qx Qy
beamline(1,4)= x(1);
beamline(3,4)= x(2);

[Racc, spos] = calcmat(beamline);
Rturn=Racc(:,:,end);
[QQx, alpha0x, beta0x,gamma0x]=R2beta(Rturn(1:2,1:2));
[QQy, alpha0y, beta0y,gamma0y]=R2beta(Rturn(3:4,3:4));

chisq = (Qx-QQx)^2 + (Qy-QQy)^2;

end