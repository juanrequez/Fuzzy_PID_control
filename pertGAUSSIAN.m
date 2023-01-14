function mv=pertGAUSSIAN(x,c,sigma)
%c representa el centro
%sigma represneta la anchura

mv=exp(-1./2*((x-c)./sigma).^2);

