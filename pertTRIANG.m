function mv=pertTRIANG(x,a,b,c)
%funci�n de pertenencia TRIANGULAR.
%aparece en pagina 25 de JANG
%Par�metros
%a, b, c, d las esquinas del triangulo.
%recordar que c>b>a>0

mv=pertTRAP(x,a,b,b,c);