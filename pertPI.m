function mv=pertPI(x,a,c)
%función de pertenencia PI.
%aparece en el ejercicio 8, pag 44 de JANG
%Parámetros
%c es el centro
%a es la apertura (spread).
%recordar que a>0
mv=zeros(size(x));
for i=1:length(x)
    if x(i)<=c
        mv(i)=pertS(x(i),c-a,c);
    else
        mv(i)=pertZ(x(i),c,c+a);
    end
end
