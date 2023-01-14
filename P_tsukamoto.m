function z=P_tsukamoto(x)
%esta función usa sugeno
%deben modificarse los tipos de función y las reglas para establecer la
%lógica
%x entrada del universo de discurso
%y entrada del universo de discurso
%z salida, universo de discurso de salida, centro de area
%este programa usa producto como intersección y maximo como union


%% subconjuntos difusos (seccion modificable)
%conjunto A
%compuesto por cinco funciones de pertenencia
funcionA={['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG']};
parametrosA={[-3 -2 -1] [-2 -1 -0] [-1 0 1] [0 1 2] [1 2 3]};
funcionC={['pertS'] ['pertS'] ['pertS'] ['pertS'] ['pertS']};
parametrosC={[-3 -1] [-2 -0] [-1 1] [0 2] [1 3]};



%% reglas (sección modificable
%si x pertenece a subconjuntoA y Y pertenece a subconjuntoB entonces
%Subconjunto C se traduce como
%regla(i)=[numero_subconjuntoA numero_subconjuntoB numero_subconjuntoC]
regla=[];
regla(1,:)=[1 1];
regla(2,:)=[2 2];
regla(3,:)=[3 3];
regla(4,:)=[4 4];
regla(5,:)=[5 5];


%% PARAMETROS A partir de aqui, nada es modificable
na=length(funcionA);%numero de subconjuntos de A
nc=length(funcionC);%numero de subconjuntos de C
nr=size(regla,1); %numero de reglas
% z=linspace(-5,5,25); %discretización del universo de discurso de C
% nz=length(z); %tamaño del universo de discurso discreto

%% PASO 1: Calcular las pertenencias de X y Y a A y B (no modificar)

%calcular la pertenencia de X a cada subconjunto de A
for i=1:na
    miuA(i)=pertenencia(x,funcionA{i},parametrosA{i});
end


%% PASO 2 Aplicar las reglas difusas (no modificar)

%prod intersección
for i=1:nr
    subconjA=regla(i,1);
    subconjC=regla(i,2);
    w(i)=miuA(subconjA); %antecedente
    Z(i)=hallarZ(w(i),funcionC{subconjC},parametrosC{subconjC}); %consecuente
end

%% calcular la salida (no modificar)
if sum(w)==0
    z=0;
else
    z=(w*Z')/sum(w);
end

    
