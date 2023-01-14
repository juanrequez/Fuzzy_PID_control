function z=hallarZ(w,funcion,parametros)

switch funcion
case 'pertS'
        l=parametros(1);
        r=parametros(2);
        Ai=(l+r)/2;
    case 'pertZ'
        l=parametros(1);
        r=parametros(2);
        Ai=(l+r)/2;
    case 'pertPI'
        a=parametros(1);
        c=parametros(2);
        Ai=(c-a)/2;
    case 'pertTRAP'
        a=parametros(1);
        b=parametros(2);
        c=parametros(3);
        d=parametros(4);
        Ai=(a+b)/2;
        
    case 'pertTSPI'
        a=parametros(1);
        b=parametros(2);
        c=parametros(3);
        d=parametros(4);
        Ai=0;
    case 'pertTRIANG'
        a=parametros(1);
        b=parametros(2);
        c=parametros(3);        
        Ai=(a+b)/2;
    case 'pertGAUSSIAN'
        c=parametros(1);
        sigma=parametros(2);
        Ai=c-sigma/2;
        
    case 'pertBELL'
        a=parametros(1);
        b=parametros(2);
        c=parametros(3);
        Ai=0;
        
    case 'pertSIG'
        a=parametros(1);
        c=parametros(2);
        Ai=c-a/2;
                
end
extremos=pertenencia(parametros,funcion,parametros);
evaluador=(w==extremos);

if sum(evaluador)==0
   zi=fzero(@(x) pertenencia(x,funcion,parametros)-w,Ai);
   if isnan(zi)
       z=0;
   else
       z=zi;
   end
else
    for i=1:length(evaluador)
        if evaluador(i)==1
            z=parametros(i);
        end
    end
end










