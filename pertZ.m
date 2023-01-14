function mv=pertZ(x,l,r)
%función de pertenencia S.
%aparece en el ejercicio 7, pag 44 de JANG
%Z(x,l,r)=1-S(x,l,r)
%Parámetros
%l valor menor :donde empieza la z
%r valor mayor: donde termina la z
%recordar que l<r
mv=zeros(size(x));
for i=1:length(x)
    if x(i)<=l
        mv(i)=1;
    elseif x(i)>l&x(i)<=(l+r)/2
        mv(i)=1-2*((x(i)-l)/(r-l))^2;
    elseif x(i)>(l+r)/2&x(i)<=r
        mv=2*((r-x(i))/(r-l))^2;
    else
        mv=0;
    end
end
