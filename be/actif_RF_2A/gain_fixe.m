%A - Étude du transistor

load mesure;
fi = find(f == 2e10); % index de la fréquence d’intérêt

S11f = S11(fi); % paramètres S à cette fréquence
S12f = S12(fi);
S21f = S21(fi);
S22f = S22(fi);
S = [S11f S12f; S21f S22f];

% Gain maximum attendu:
% % Gt = Gsmax + G0 + Glmax
Gs_max = 10*log10(1 / ( 1 - abs(S11f)^2)); % 3.4561
Gl_max = 10*log10(1 / ( 1 - abs(S22f)^2)); % 1.9121
G0 = 10*log10(abs(S21f)^2); % 4.0766
Gt = Gs_max + G0 + Gl_max; % 9.4448
Gs = [0 0.5 1 1.5 2 2.5 3 Gs_max];
Gl = [0 0.5 1 1.5 Gl_max];
gs = 10.^(Gs/10) / 10.^(Gs_max/10);
gl = 10.^(Gl/10) / 10.^(Gl_max/10);


Cs =               gs.*conj(S11f) ./ (1 - (1 - gs) .* abs(S11f)^2);
Rs = sqrt(1-gs) .*(1-abs(S11f)^2) ./ (1 - (1 - gs) .* abs(S11f)^2);
Cl =               gl.*conj(S22f) ./ (1 - (1 - gl) .* abs(S22f)^2);
Rl = sqrt(1-gl) .*(1-abs(S22f)^2) ./ (1 - (1 - gl) .* abs(S22f)^2);

abaque_smith
hold
for i = 1:size(Cs,2)
    trace_cercle(Cs(i), Rs(i), 'r')
end

for i = 1:size(Cl,2) 
    trace_cercle(Cl(i), Rl(i), 'b')
end

s = 5;
l = 3;
Gs(s) + Gl(l); % 3
trace_cercle(Cs(s), Rs(s), 'g')
trace_cercle(Cl(l), Rl(l), 'y')

% Tracé à la main:
ra = 82; % Rayon de l’abaque, en mm
abs(Cs(s))*ra; % 51.5
angle(Cs(s))/pi*0.25+0.25; % 0.452
abs(Cl(l))*ra; % 42.5
angle(Cl(l))/pi*0.25+0.25; % 0.4325

%GammaL = -0.1443 + 1i*0.1637;
%ZL = (1+GammaL)/(1-GammaL);

Zs = 0.55 + 1i*0.24;
Zl = 0.725 + 1i*0.225;

lambda = 3E8/2E10;
Lla = 0.172*lambda;
Llsa = 0.068*lambda;
Lsa = 0.153*lambda;
Lssa = 0.075*lambda;

S11gaa = zeros(size(f));
S12gaa = zeros(size(f));
S21gaa = zeros(size(f));
S22gaa = zeros(size(f));


for i = 1:size(f,2)
    lambda = 3E8/f(i);
    beta = (2*pi) / lambda;
    
    Yrl = [1 0 ; 1i*tan(beta*Llsa) 1];
    Yrs = [1 0 ; 1i*tan(beta*Lssa) 1];
    
    T1a = [ cosh(1i*beta*Lla) sinh(1i*beta*Lla); sinh(1i*beta*Lla) cosh(1i*beta*Lla)];
    T2a = [ cosh(1i*beta*Lsa) sinh(1i*beta*Lsa); sinh(1i*beta*Lsa) cosh(1i*beta*Lsa)];

    
    A = ((1 + S11(i))*(1 - S22(i)) + S12(i)*S21(i))/(2*S21(i));
    B = ((1 + S11(i))*(1 + S22(i)) - S12(i)*S21(i))/(2*S21(i));
    C = ((1 - S11(i))*(1 - S22(i)) - S12(i)*S21(i))/(2*S21(i));
    D = ((1 - S11(i))*(1 + S22(i)) + S12(i)*S21(i))/(2*S21(i));
    T = [A B; C D];

    Tglobaa = Yrs * T1a * T * T2a * Yrl;
    Agaa = Tglobaa(1,1);
    Bgaa = Tglobaa(1,2);
    Cgaa = Tglobaa(2,1);
    Dgaa = Tglobaa(2,2);
    S11gaa(i) =   (Agaa + Bgaa - Cgaa - Dgaa) / (Agaa + Bgaa + Cgaa + Dgaa);
    S12gaa(i) = 2*(Agaa * Dgaa - Bgaa * Cgaa) / (Agaa + Bgaa + Cgaa + Dgaa);
    S21gaa(i) =                             2 / (Agaa + Bgaa + Cgaa + Dgaa);
    S22gaa(i) = (- Agaa + Bgaa - Cgaa + Dgaa) / (Agaa + Bgaa + Cgaa + Dgaa);
end

plot(f, 20*log10(abs(S11gaa)), f, 20*log10(abs(S22gaa)), f, 20*log10(abs(S21gaa)))
