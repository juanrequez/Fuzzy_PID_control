function mv=pertS(x,l,r)
%función de pertenencia S.
%aparece en el ejercicio 6, pag 43 de JANG
%Parámetros
%l valor menor :donde empieza la s
%r valor mayor: donde termina la s
%recordar que l<r

mv=zeros(size(x));
for i=1:length(x)
    if x(i)<=l
        mv(i)=0;
    elseif x(i)>l&x(i)<=(l+r)/2
        mv(i)=2*((x(i)-l)/(r-l))^2;
    elseif x(i)>(l+r)/2&x(i)<=r
        mv(i)=1-2*((r-x(i))/(r-l))^2;
    else
        mv(i)=1;
    end
end

