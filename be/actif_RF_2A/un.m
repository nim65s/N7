%A - Étude du transistor

load mesure;
semilogx(f,20*log10(abs(S11)), f,20*log10(abs(S12)),...
    f,20*log10(abs(S21)), f,20*log10(abs(S22)))
legend('S11','S12','S21','S22')

fi = find(f == 2e10); % index de la fréquence d’intérêt

S11f = S11(fi); % paramètres S à cette fréquence
S12f = S12(fi);
S21f = S21(fi);
S22f = S22(fi);
S = [S11f S12f; S21f S22f];

% Gain du transistor à la fréquence d’intérêt: 
G = 20*log10(abs(S21f)); % 4.0766 dB

% Unilatéral: 
Greverse = 20*log10(abs(S12f)); % -23.7387 dB=> oui

% Gain maximum attendu:
% % Gt = Gsmax + G0 + Glmax
Gsmax = 1 / ( 1 - abs(S11f)^2);
Glmax = 1 / ( 1 - abs(S22f)^2);
G0 = abs(S21f)^2;
Gt = Gsmax + G0 + Glmax; % 6.3259
Gtdb = 20*log10(Gt); % 16.0225 dB

% Stabilité
%   Paramètre de stabilité inconditionnelle
Delta = S11f*S22f - S12f*S21f;
mu = (1 - abs(S11f)^2)/(abs(S22f - Delta*conj(S11f)) + abs(S12f*S21f)); % 1.0136
%   Coefficient de Rollet
K = (1 + abs(Delta)^2 - abs(S11f)^2 - abs(S22f)^2)/(2*abs(S12f*S21f)); % 1.0444
%   ce critère est vérifié
Re = abs(S12f*S21f/(abs(S11f)^2 - abs(Delta)^2));
Ce = conj(S11f - Delta*conj(S22f))/(abs(S11f)^2 - abs(Delta)^2);
Rs = abs(S12f*S21f/(abs(S22f)^2 - abs(Delta)^2));
Cs = conj(S22f - Delta*conj(S11f))/(abs(S22f)^2 - abs(Delta)^2);

abaque_smith
trace_cercle(Ce, Re, 'b')
trace_cercle(Cs, Rs, 'r')

% Tracé à la main:
ra = 77; % Rayon de l’abaque, en mm
abs(Ce)*ra; % 96.4
angle(Ce)/pi*0.25+0.25; % 0.4489
abs(Cs)*ra; % 112.2
angle(Cs)/pi*0.25+0.25; % 0.4253


abs(S11f); % 0.7408 < 1 => le centre est stable, le cercle bleu n’inclu pas le centre, donc l’intérieur du cercle est instable
abs(S22f); % 0.5968 < 1=> le centre est stable, le cercle rouge n’inclu pas le centre, donc l’intérieur du cercle est instable

%B Conception de l’amplificateur optimisé en gain

C1 = S11f - Delta*conj(S22f);
C2 = S22f - Delta*conj(S11f);
B2 = 1 - abs(Delta)^2 - abs(S11f)^2 + abs(S22f)^2;
B1 = 1 - abs(Delta)^2 + abs(S11f)^2 -abs(S22f)^2;
Gamma1 = (B1-sqrt(B1^2-4*abs(C1)^2)) / (2*C1);
Gamma2 = (B2-sqrt(B2^2-4*abs(C2)^2)) / (2*C2);
z1 = (1 + Gamma1) / (1 - Gamma1);
z2 = (1 + Gamma2) / (1 - Gamma2);
trace_imp(z1,'*b');
trace_imp(z2,'+b');

% Après calcul des longueurs sur les abaques,
lambda = 3E8/2E10;

L1a = 0.03*lambda;
L1b = 0.073*lambda;
Ls1a = 0.272*lambda;
Ls1b = 0.228*lambda;
L2a = 0.03*lambda;
L2b = 0.108*lambda;
Ls2a = 0.292*lambda;
Ls2b = 0.21*lambda;

S11gaa = zeros(size(f));
S12gaa = zeros(size(f));
S21gaa = zeros(size(f));
S22gaa = zeros(size(f));
S11gab = zeros(size(f));
S12gab = zeros(size(f));
S21gab = zeros(size(f));
S22gab = zeros(size(f));
S11gba = zeros(size(f));
S12gba = zeros(size(f));
S21gba = zeros(size(f));
S22gba = zeros(size(f));
S11gbb = zeros(size(f));
S12gbb = zeros(size(f));
S21gbb = zeros(size(f));
S22gbb = zeros(size(f));

for i = 1:size(f,2)
    lambda = 3E8/f(i);
    beta = (2*pi) / lambda;
    
    Yr1a = [1 0 ; 1i*tan(beta*Ls1a) 1];
    Yr2a = [1 0 ; 1i*tan(beta*Ls2a) 1];
    Yr1b = [1 0 ; 1i*tan(beta*Ls1b) 1];
    Yr2b = [1 0 ; 1i*tan(beta*Ls2b) 1];
    
    T1a = [ cosh(1i*beta*L1a) sinh(1i*beta*L1a); sinh(1i*beta*L1a) cosh(1i*beta*L1a)];
    T2a = [ cosh(1i*beta*L2a) sinh(1i*beta*L2a); sinh(1i*beta*L2a) cosh(1i*beta*L2a)];
    T1b = [ cosh(1i*beta*L1b) sinh(1i*beta*L1b); sinh(1i*beta*L1b) cosh(1i*beta*L1b)];
    T2b = [ cosh(1i*beta*L2b) sinh(1i*beta*L2b); sinh(1i*beta*L2b) cosh(1i*beta*L2b)];

    
    A = ((1 + S11(i))*(1 - S22(i)) + S12(i)*S21(i))/(2*S21(i));
    B = ((1 + S11(i))*(1 + S22(i)) - S12(i)*S21(i))/(2*S21(i));
    C = ((1 - S11(i))*(1 - S22(i)) - S12(i)*S21(i))/(2*S21(i));
    D = ((1 - S11(i))*(1 + S22(i)) + S12(i)*S21(i))/(2*S21(i));
    T = [A B; C D];

    Tglobaa = Yr1a * T1a * T * T2a * Yr2a;
    Agaa = Tglobaa(1,1);
    Bgaa = Tglobaa(1,2);
    Cgaa = Tglobaa(2,1);
    Dgaa = Tglobaa(2,2);
    S11gaa(i) = (Agaa + Bgaa - Cgaa - Dgaa) / (Agaa + Bgaa + Cgaa + Dgaa);
    S12gaa(i) = 2*(Agaa*Dgaa - Bgaa * Cgaa) / (Agaa + Bgaa + Cgaa + Dgaa);
    S21gaa(i) = 2 / (Agaa + Bgaa + Cgaa + Dgaa);
    S22gaa(i) = (- Agaa + Bgaa - Cgaa + Dgaa) / (Agaa + Bgaa + Cgaa + Dgaa);
    
    Tglobab = Yr1a * T1a * T * T2b * Yr2b;
    Agab = Tglobab(1,1);
    Bgab = Tglobab(1,2);
    Cgab = Tglobab(2,1);
    Dgab = Tglobab(2,2);
    S11gab(i) = (Agab + Bgab - Cgab - Dgab) / (Agab + Bgab + Cgab + Dgab);
    S12gab(i) = 2*(Agab*Dgab - Bgab * Cgab) / (Agab + Bgab + Cgab + Dgab);
    S21gab(i) = 2 / (Agab + Bgab + Cgab + Dgab);
    S22gab(i) = (- Agab + Bgab - Cgab + Dgab) / (Agab + Bgab + Cgab + Dgab);

    Tglobba = Yr1b * T1b * T * T2a * Yr2a;
    Agba = Tglobba(1,1);
    Bgba = Tglobba(1,2);
    Cgba = Tglobba(2,1);
    Dgba = Tglobba(2,2);
    S11gba(i) = (Agba + Bgba - Cgba - Dgba) / (Agba + Bgba + Cgba + Dgba);
    S12gba(i) = 2*(Agba*Dgba - Bgba * Cgba) / (Agba + Bgba + Cgba + Dgba);
    S21gba(i) = 2 / (Agba + Bgba + Cgba + Dgba);
    S22gba(i) = (- Agba + Bgba - Cgba + Dgba) / (Agba + Bgba + Cgba + Dgba);
    
    Tglobbb = Yr1b * T1b * T * T2b * Yr2b;
    Agbb = Tglobbb(1,1);
    Bgbb = Tglobbb(1,2);
    Cgbb = Tglobbb(2,1);
    Dgbb = Tglobbb(2,2);
    S11gbb(i) = (Agbb + Bgbb - Cgbb - Dgbb) / (Agbb + Bgbb + Cgbb + Dgbb);
    S12gbb(i) = 2*(Agbb*Dgbb - Bgbb * Cgbb) / (Agbb + Bgbb + Cgbb + Dgbb);
    S21gbb(i) = 2 / (Agbb + Bgbb + Cgbb + Dgbb);
    S22gbb(i) = (- Agbb + Bgbb - Cgbb + Dgbb) / (Agbb + Bgbb + Cgbb + Dgbb);
end
figure
subplot(2,2,1)
plot(f,20*log10(abs(S11gaa)), f,20*log10(abs(S11gab)),...
    f,20*log10(abs(S11gba)), f,20*log10(abs(S11gbb)));
legend('S11aa','S11ab','S11ba','S11bb')

subplot(2,2,2)
plot(f,20*log10(abs(S21gaa)), f,20*log10(abs(S21gab)),...
    f,20*log10(abs(S21gba)), f,20*log10(abs(S21gbb)));
legend('S21aa','S21ab','S21ba','S21bb')

subplot(2,2,3)
plot(f,20*log10(abs(S12gaa)), f,20*log10(abs(S12gab)),...
    f,20*log10(abs(S12gba)), f,20*log10(abs(S12gbb)));
legend('S12aa','S12ab','S12ba','S12bb')

subplot(2,2,4)
plot(f,20*log10(abs(S22gaa)), f,20*log10(abs(S22gab)),...
    f,20*log10(abs(S22gba)), f,20*log10(abs(S22gbb)));
legend('S22aa','S22ab','S22ba','S22bb')

% les différentes possibilitées AB, BA et BB ramènent des court-circuits
% et le gain s’effondre à des fréquences proches de 20GHz.
% On va donc garder la combinaison AA, qui a des stubs plus courts, et qui 
% ramène donc moins de court-circuits à basse-fréquence.
