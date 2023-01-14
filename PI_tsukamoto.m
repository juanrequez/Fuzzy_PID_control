function z=PI_tsukamoto(x,y)
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
%conjunto B
%compuesto por cinco funciones de pertenencia
funcionB={['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG']};
parametrosB={[-3 -2 -1] [-2 -1 -0] [-1 0 1] [0 1 2] [1 2 3]};
%conjunto C
%compuesto por nueve funciones de pertenencia
funcionC={['pertS'] ['pertS'] ['pertS'] ['pertS'] ['pertS'] ['pertS'] ['pertS'] ['pertS'] ['pertS']};
parametrosC={[-5 -3] [-4 -2] [-3 -1] [-2 0] [-1 1] [0 2] [1 3] [2 4] [3 5]};



%% reglas (sección modificable
%si x pertenece a subconjuntoA y Y pertenece a subconjuntoB entonces
%Subconjunto C se traduce como
%regla(i)=[numero_subconjuntoA numero_subconjuntoB numero_subconjuntoC]
regla=[];
regla(1,:)=[1 1 1];
regla(2,:)=[1 2 2];
regla(3,:)=[1 3 3];
regla(4,:)=[1 4 4];
regla(5,:)=[1 5 5];
regla(6,:)=[2 1 2];
regla(7,:)=[2 2 3];
regla(8,:)=[2 3 3];
regla(9,:)=[2 4 5];
regla(10,:)=[2 5 6];
regla(11,:)=[3 1 3];
regla(12,:)=[3 2 4];
regla(13,:)=[3 3 5];
regla(14,:)=[3 4 6];
regla(15,:)=[3 5 7];
regla(16,:)=[4 1 4];
regla(17,:)=[4 2 5];
regla(18,:)=[4 3 6];
regla(19,:)=[4 4 7];
regla(20,:)=[4 5 8];
regla(21,:)=[5 1 5];
regla(22,:)=[5 2 6];
regla(23,:)=[5 3 7];
regla(24,:)=[5 4 8];
regla(25,:)=[5 5 9];
%% PARAMETROS A partir de aqui, nada es modificable
na=length(funcionA);%numero de subconjuntos de A
nb=length(funcionB);%numero de subconjuntos de B
nr=size(regla,1); %numero de reglas
z=linspace(-5,5,25); %discretización del universo de discurso de C

%% PASO 1: Calcular las pertenencias de X y Y a A y B (no modificar)

%calcular la pertenencia de X a cada subconjunto de A
for i=1:na
    miuA(i)=pertenencia(x,funcionA{i},parametrosA{i});
end
%calcular la pertenencia de Y a cada subconjunto de B
for i=1:nb
    miuB(i)=pertenencia(y,funcionB{i},parametrosB{i});
end

%% PASO 2 Aplicar las reglas difusas (no modificar)

%prod intersección
%max para unión

%buscar el antecedente
%con el antecedente, truncar el conjunto consecuente
for i=1:nr
    subconjA=regla(i,1);
    subconjB=regla(i,2);
    subconjC=regla(i,3);
    w(i)=min(miuA(subconjA),miuB(subconjB)); %antecedente
    Z(i)=hallarZ(w(i),funcionC{subconjC},parametrosC{subconjC}); %consecuente
end


%% calcular la salida (no modificar)
if sum(w)==0
    z=0;
else
    z=(w*Z')/sum(w);
end

    
