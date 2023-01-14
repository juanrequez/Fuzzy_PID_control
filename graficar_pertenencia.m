close all

funcionA={['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG']};
parametrosA={[-3 -2 -1] [-2 -1 -0] [-1 0 1] [0 1 2] [1 2 3]};
%conjunto B
%compuesto por cinco funciones de pertenencia
funcionB={['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG']};
parametrosB={[-3 -2 -1] [-2 -1 -0] [-1 0 1] [0 1 2] [1 2 3]};
%conjunto C
%compuesto por nueve funciones de pertenencia
funcionC={['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG']};
parametrosC={[-5 -4 -3] [-4 -3 -2] [-3 -2 -1] [-2 -1 0] [-1 0 1] [0 1 2] [1 2 3] [2 3 4] [3 4 5]};

%compuesto por nueve funciones de pertenencia
funcionD={['pertS'] ['pertS'] ['pertS'] ['pertS'] ['pertS'] ['pertS'] ['pertS'] ['pertS'] ['pertS']};
parametrosD={[-5 -3] [-4 -2] [-3 -1] [-2 0] [-1 1] [0 2] [1 3] [2 4] [3 5]};

%salida mamdani P
funcionE={['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG'] ['pertTRIANG']};
parametrosE={[-3 -2 -1] [-2 -1 -0] [-1 0 1] [0 1 2] [1 2 3]};
%salida tsukamoto P
funcionF={['pertS'] ['pertS'] ['pertS'] ['pertS'] ['pertS']};
parametrosF={[-3 -1] [-2 -0] [-1 1] [0 2] [1 3]};

na=length(funcionA);%numero de subconjuntos de A
nb=length(funcionB);%numero de subconjuntos de B
nc=length(funcionC);%numero de subconjuntos de C

nd=length(funcionD);%numero de subconjuntos para tsukamoto entrada

ne=length(funcionE);%numero de subconjuntos para tsukamoto entrada
nf=length(funcionF);%numero de subconjuntos para tsukamoto entrada

figure
hold
for i=1:na
    graficador(funcionA{i},parametrosA{i},[-3,3])
end
axis([-3 3 0 1.2]);
text(-2,1.1,'MN');
text(-1,1.1,'N');
text(0,1.1,'C');
text(1,1.1,'P');
text(2,1.1,'MP');
grid
xlabel('error')
ylabel('pertenencia')

figure
hold
for i=1:nb
    graficador(funcionB{i},parametrosB{i},[-3,3])
end
axis([-3 3 0 1.2]);
text(-2,1.1,'MN');
text(-1,1.1,'N');
text(0,1.1,'C');
text(1,1.1,'P');
text(2,1.1,'MP');
grid
xlabel('cambio del error')
ylabel('pertenencia')


figure
hold
for i=1:na
    graficador(funcionE{i},parametrosE{i},[-3,3])
end
axis([-3 3 0 1.2]);
text(-2,1.1,'MN');
text(-1,1.1,'N');
text(0,1.1,'C');
text(1,1.1,'P');
text(2,1.1,'MP');
grid
xlabel('salida')
ylabel('pertenencia')
figure
hold
for i=1:na
    graficador(funcionF{i},parametrosF{i},[-3,3])
end
axis([-3 3 0 1.2]);
text(-2,1.1,'MN');
text(-1,1.1,'N');
text(0,1.1,'C');
text(1,1.1,'P');
text(2,1.1,'MP');
grid
xlabel('salida')
ylabel('pertenencia')

figure
hold
for i=1:nc
    graficador(funcionC{i},parametrosC{i},[-5,5])
end
axis([-5 5 0 1.2]);
text(-4,1.1,'NMG');
text(-3,1.1,'NG');
text(-2,1.1,'N');
text(-1,1.1,'NP');
text(0,1.1,'C');
text(1,1.1,'PP');
text(2,1.1,'P');
text(3,1.1,'PG');
text(4,1.1,'PMG');
grid
xlabel('salida del controlador')
ylabel('pertenencia')

figure
hold
for i=1:nd
    graficador(funcionD{i},parametrosD{i},[-5,5])
end
axis([-5 5 0 1.2]);
text(-4,1.1,'NMG');
text(-3,1.1,'NG');
text(-2,1.1,'N');
text(-1,1.1,'NP');
text(0,1.1,'C');
text(1,1.1,'PP');
text(2,1.1,'P');
text(3,1.1,'PG');
text(4,1.1,'PMG');
grid
xlabel('salida del controlador')
ylabel('pertenencia')


x=linspace(-3,3,20);
y=linspace(-3,3,20);

for i=1:length(x)
    wm(i)=P_mamdani(x(i));
    ws(i)=P_takagisugeno(x(i));
    wt(i)=P_tsukamoto(x(i));
end
figure
plot(x,wm,'k-*', x, ws, 'k-o',x,wt,'k-+')
xlabel('error')
ylabel('salida del controlador')
grid
legend('curva de respuesta, P Mamdani', 'curva de respuesta, P Takagi-Sugeno', 'curva de respuesta, P Tsukamoto','location','best')


% figure
% plot(x,ws,'k')
% xlabel('error')
% ylabel('salida del controlador')
% grid
% legend('curva de respuesta, P Takagi-Sugeno','location','best')
% 
% figure
% plot(x,wt,'k')
% xlabel('error')
% ylabel('salida del controlador')
% grid
% legend('curva de respuesta, P Tsukamoto','location','best')


zm=[];
zs=[];
for i=1:length(x);
    for j=1:length(y);
        %superficie mamdani PI
        zm(i,j)=PI_mamdani(x(i),y(j));
        %superficie sugeno PI
        zs(i,j)=PI_takagisugeno(x(i),y(j));
        %superficie tsukamoto PI
        zt(i,j)=PI_tsukamoto(x(i),y(j));
    end
end
figure
mesh(x,y,zm)
axis([-3 3 -3 3 -5 5]);
colormap(gray)
xlabel('error')
ylabel('cambio del error')
zlabel('salida del controlador')
title('controlador PI incremental Mamdani')

figure
mesh(x,y,zs)
axis([-3 3 -3 3 -5 5]);
colormap(gray)
xlabel('error')
ylabel('cambio del error')
zlabel('salida del controlador')
title('controlador PI incremental Takagi-Sugeno')

figure
mesh(x,y,zt)
axis([-3 3 -3 3 -5 5]);
colormap(gray)
xlabel('error')
ylabel('cambio del error')
zlabel('salida del controlador')
title('controlador PI incremental Tsukamoto')
