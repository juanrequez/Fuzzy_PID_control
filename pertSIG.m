function mv=pertSIG(x,a,c)
%función sigmoidal
%c punto de crossover
%a controla la pendiente en el punto de crossover


mv=1./(1+exp(-a*(x-c)));

