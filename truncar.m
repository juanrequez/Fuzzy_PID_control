function mfZ=truncar(w,x,funcion,parametros)
% trunca el conjunto difuso de manera que todos los valores sean menores
% que w. El conjunto difuso truncado es discreto sobre x



mv=pertenencia(x,funcion,parametros);
mfZ=min(w,mv);