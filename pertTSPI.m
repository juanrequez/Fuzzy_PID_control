function mv=pertTSPI(x,a,b,c,d)
%función de pertenencia two sided PI.
%aparece en el ejercicio 9, pag 44 de JANG
%Parámetros
%a, b, c, d los limites de la forma.
%recordar que d>c>b>a>0
mv=zeros(size(x));
for i=1:length(x)
    if x(i)<=a
        mv(i)=0;
    elseif x(i)>a&&x(i)<=b
        mv(i)=pertS(x(i),a,b);
    elseif x(i)>b&&x(i)<=c
        mv(i)=1;
    elseif x(i)>c&&x(i)<=d
        mv(i)=pertZ(x(i),c,d);
    else
        mv(i)=0;
    end
end
