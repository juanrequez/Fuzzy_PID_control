function graficador(funcion,parametros,rango)
%grafica cualquiera de las funciones de pertenencia implementadas en matlab
%elaborado por Juan Requez
%funcion es un string de texto 'pertS','pertZ','pertPI'
%parametros depende del tipo de funci�n. Es un vector:
%pertS: parametros es un vector de dos elementos: [l r]
%pertZ: parametros es un vector de dos elementos: [l r]
%pertPI: parametros es un vector de dos elementos [a c]
%pertTRIANG: parametros es un vector de tres elementos [a, b, c]
%pertTRAP: parametros es un vector de cuatro elementros [a, b, c, d];
%pertGAUSSIAN: Parametros es un vector de dos elementros [c sigma];
%pertBELL: parametros es un vector de tres elementos [a,b,c];
%pertSIG: parametros es un vector de dos elementos [a,c];
%rango es un vector de dos valores con el m�nimo y maximo valor de x para
%graficar


xmin=rango(1);
xmax=rango(2);


switch funcion
    case 'pertS'
        l=parametros(1);
        r=parametros(2);
        titulo=sprintf('Funci�n S con par�metros l=%g, r=%g',l,r);
        leyenda='funci�n S';
    case 'pertZ'
        l=parametros(1);
        r=parametros(2);
        titulo=sprintf('Funci�n z con par�metros l=%g, r=%g',l,r);
        leyenda='funci�n Z';
    case 'pertPI'
        a=parametros(1);
        c=parametros(2);
        titulo=sprintf('Funci�n PI con par�metros a=%g, c=%g',a,c);
        leyenda='funci�n PI';
    case 'pertTRAP'
        a=parametros(1);
        b=parametros(2);
        c=parametros(3);
        d=parametros(4);
        titulo=sprintf('Funci�n Trapezoidal con par�metros a=%g, b=%g, c=%g, d=%g',a,b,c,d);
        leyenda='funci�n trapezoidal';
    case 'pertTSPI'
        a=parametros(1);
        b=parametros(2);
        c=parametros(3);
        d=parametros(4);
        titulo=sprintf('Funci�n TWO SIDED PI con par�metros a=%g, b=%g, c=%g, d=%g',a,b,c,d);
        leyenda='funci�n two sided PI';
    case 'pertTRIANG'
        a=parametros(1);
        b=parametros(2);
        c=parametros(3);        
        titulo=sprintf('Funci�n Triangular con par�metros a=%g, b=%g, c=%g',a,b,c);
        leyenda='funci�n triangular';
    case 'pertGAUSSIAN'
        c=parametros(1);
        sigma=parametros(2);
        titulo=sprintf('Funci�n Gaussiana con par�metros c=%g, sigma=%g',c,sigma);
        leyenda='funci�n gaussiana';
    case 'pertBELL'
        a=parametros(1);
        b=parametros(2);
        c=parametros(3);
        titulo=sprintf('Funci�n Campana con par�metros a=%g, b=%g, c=%g',a,b,c);
        leyenda='funci�n BELL';
    case 'pertSIG'
        a=parametros(1);
        c=parametros(2);
         titulo=sprintf('Funci�n sigmoidal con par�metros a=%g, c=%g',a,c);
        leyenda='funci�n Sigmoidal';
       
end

x=linspace(xmin,xmax,100);

% for i=1:length(x)
%    mv(i)=pertenencia(x(i),funcion,parametros);
% end
mv=pertenencia(x,funcion,parametros);
plot(x,mv,'k')
% axis([xmin xmax min(mv)-0.1*max(mv) 1.2*max(mv)]);
% grid
% xlabel('x')
% ylabel('pertenencia')
% title(titulo)
% legend(leyenda)


    
    