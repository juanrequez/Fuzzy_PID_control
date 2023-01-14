function z=P_mamdani(x)
%esta función usa mamdani
%deben modificarse los tipos de función y las reglas para establecer la
%lógica
%x entrada del universo de discurso
%y entrada del universo de discurso
%z salida, universo de discurso de salida, centro de area

%% subconjuntos difusos (seccion modificable)
%conjunto A
%compuesto por cinco funciones de pertenencia
funcionA={['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG']};
parametrosA={[-3 -2 -1] [-2 -1 -0] [-1 0 1] [0 1 2] [1 2 3]};
%conjunto C
%compuesto por nueve funciones de pertenencia
funcionC={['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG']};
parametrosC={[-3 -2 -1] [-2 -1 -0] [-1 0 1] [0 1 2] [1 2 3]};

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
z=linspace(-5,5,25); %discretización del universo de discurso de C
nz=length(z); %tamaño del universo de discurso discreto

%% PASO 1: Calcular las pertenencias de X y Y a A y B

%calcular la pertenencia de X a cada subconjunto de A
for i=1:na
    miuA(i)=pertenencia(x,funcionA{i},parametrosA{i});
end


%% PASO 2 Aplicar las reglas difusas

%min intersección
%buscar el antecedente
%con el antecedente, truncar el conjunto consecuente
for i=1:nr
    subconjA=regla(i,1);
    subconjC=regla(i,2);
    w(i)=miuA(subconjA); %antecedente
    mfZ(i,:)=truncar(w(i),z,funcionC{subconjC},parametrosC{subconjC}); %consecuente
end

%% Paso 3 unir todos los conjuntos difusos en uno solo 
%max para unión
mfZfinal=max(mfZ);

%% desdifusificar centroide
numerador=sum(z.*mfZfinal);
denominador=sum(mfZfinal);
if denominador==0
    zcoa=0;
else
    zcoa=numerador/denominador;
end

%salida
z=zcoa;
