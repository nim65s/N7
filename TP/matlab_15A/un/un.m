%1
a=2;b=-4;c=3;
%1A
D=b^2-4*a*c;
x1=(-b-sqrt(D))/(2*a);
x2=(-b+sqrt(D))/(2*a);
%1B
X=roots([a b c]);

%2A
x=pi:pi/10:10*pi;
y=3*cos(x)./x;
plot(x,y)
%2B
x=0:5/100:5;
y=2.*exp(-2.*x/3).*(2.*(sin(5.*x)).^3-cos(4.*x));
plot(x,y)
%2C
x=-5:.1:5;
y=x.^5-2.*x.^4-21.*x.^3+22.*x.^2+40.*x;
plot(x,y)
%2D
hold on;
grid;
plot(x,y)
hold off;
roots([1 -2 -21 22 40 0]);

%3
A=rand(1,100);
B=100*rand(1,100);
%3A
hist(A);
hist(B);
%3B
C1=sum(A)/100;
C2=mean(A);
D1=sum(B)/100;
D2=mean(B);
%3C
E1=sqrt(sum((A-C1).^2)/99);
E2=std(A);
F1=sqrt(sum((B-D1).^2)/99);
F2=std(B);

%4
A=load('A.txt');
V1=inv(A)*[44.7;-6;-26.2;-50.5];
V2=A\[44.7;-6;-26.2;-50.5];
Bb;%chargement du fichier Bb
C=[Bbb;[1 5 9 4 3]];
inv(C);%inverse
C';%transposée
det(C);%déterminant
poly(C);%Polynôme caractéristique
eig(C);%valeurs propres
diag(C);%diagonale
D=C;
D(3,:) = [];
D(:,4) = [];
[D,eye(4,2);zeros(2,4),ones(2)];

%5A
P=[1 -7 -3 79 -46 -120];
roots(P);
polyval(P,2);
%5B
Q=poly([3 -4.5 -2 1.5 0]);
poly2str(Q,'x');
%5C
conv(P,Q);
deconv(P,Q);
%5D
N=[3 19 28 12];
D=[1 5 6 0];
[Q,R]=deconv(N,D);
[r,p,k]=residue(N,D);
syms p t
ilaplace(3+(6./(p+3))-(4./(p+2))+(2./p))

%5E
printsys(conv([2 3],[1 2]),conv([1 2 2 1],[1 3 2 0]),'p')