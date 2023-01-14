function mv=pertTRAP(x,a,b,c,d)
%función de pertenencia TRAPEZOIDAL.
%aparece en pagina 25 de JANG
%Parámetros
%a, b, c, d las esquinas del trapecio.
%recordar que d>c>b>a>0
mv=zeros(size(x));
for i=1:length(x)
    if x(i)<=a
        mv(i)=0;
    elseif x(i)>a&&x(i)<=b
        mv(i)=(x(i)-a)/(b-a);
    elseif x(i)>b&&x(i)<=c
        mv(i)=1;
    elseif x(i)>c&&x(i)<=d
        mv(i)=(d-x(i))/(d-c);
    else
        mv(i)=0;
    end
end
