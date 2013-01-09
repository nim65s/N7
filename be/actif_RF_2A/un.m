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
mu = (1 - abs(S11f)^2)/(abs(S22f - Delta*conj(S11f)) + abs(S12f*S21f)); % 1.0136
%   Coefficient de Rollet
Delta = S11f*S22f - S12f*S21f;
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