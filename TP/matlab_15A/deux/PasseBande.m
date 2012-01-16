% plage de fréquences
f=logspace(2,5,40);

% Les admittances du circuit
y1=1/6800;
y2=1i*2.2*10^-9*2*pi*f;
y3=1i*2.2*10^-9*2*pi*f;
y4=1/10000;
y5=1/22000;

% Fonction de transfert
H = -(y1.*y3)./(y2.*y3 + y5.*(y1+y2+y3+y4));
% Module de la fonction de transfert :
G = 20*log(abs(H));
% Phase de fonction de transfert :
P = phase(H)*180/pi;

% Représentation graphique du module et de la phase
subplot(2,1,1)
semilogx(f,G)
grid
title('Gain ')
xlabel('Fréquence (Hz)')
ylabel('Gain (dB)')

subplot(2,1,2)
semilogx(f,P,'-',[10^2 10^5],[-90 -90],'--',[10^2 10^5],[-270 -270],'--')
grid
title('Phase')
ylabel('Phase (°)')
xlabel('Fréquence(Hz)')
asymptote
