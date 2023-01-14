function mv=pertBELL(x,a,b,c)
%funcion campana generalizada
% si b es postivo la campana es natural
% si b es negativo es una campana invertida
% c es el centro de la campana
% a es la anchura de la campana

mv=1./(1+(abs((x-c)./a)).^(2*b));

