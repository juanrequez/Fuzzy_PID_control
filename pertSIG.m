function mv=pertSIG(x,a,c)
%funci�n sigmoidal
%c punto de crossover
%a controla la pendiente en el punto de crossover


mv=1./(1+exp(-a*(x-c)));

