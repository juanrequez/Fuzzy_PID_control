function miuw=pertenencia(w,funcion,parametros)

switch funcion
    case 'pertS'
        cadena=@pertS;
        l=parametros(1);
        r=parametros(2);
        expression='feval(cadena,w,l,r)';
    case 'pertZ'
       cadena=@pertZ;
        l=parametros(1);
        r=parametros(2);
        expression='feval(cadena,w,l,r)';
        
    case 'pertPI'
        cadena=@pertPI;
        a=parametros(1);
        c=parametros(2);
        expression='feval(cadena,w,a,c)';
        
    case 'pertTRAP'
        cadena=@pertTRAP;
        a=parametros(1);
        b=parametros(2);
        c=parametros(3);
        d=parametros(4);
        expression='feval(cadena,w,a,b,c,d)';
        
    case 'pertTSPI'
        cadena=@pertTSPI;
        a=parametros(1);
        b=parametros(2);
        c=parametros(3);
        d=parametros(4);
        expression='feval(cadena,w,a,b,c,d)';
        
    case 'pertTRIANG'
        cadena=@pertTRIANG;
        a=parametros(1);
        b=parametros(2);
        c=parametros(3);        
        expression='feval(cadena,w,a,b,c)';
        
    case 'pertGAUSSIAN'
        cadena=@pertGAUSSIAN;
        c=parametros(1);
        sigma=parametros(2);
        expression='feval(cadena,w,c,sigma)';
        
    case 'pertBELL'
        cadena=@pertBELL;
        a=parametros(1);
        b=parametros(2);
        c=parametros(3);
        expression='feval(cadena,w,a,b,c)';
        
    case 'pertSIG'
        cadena=@pertSIG;
        a=parametros(1);
        c=parametros(2);
        expression='feval(cadena,w,a,c)';
               
end

miuw=eval(expression);