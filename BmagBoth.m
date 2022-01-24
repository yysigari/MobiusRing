function Bmag=BmagBoth(sig1,sig2);

Bmag= [Bmags(sig1(1:2,1:2), sig2(1:2,1:2))-1,...
       Bmags(sig1(3:4,3:4), sig2(3:4,3:4))-1];

end