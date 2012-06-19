%1)1)
Nbits = 100000;
N = rand(1,Nbits);
bits = N > 0.5;
size(find(bits));
bits = 2*bits -1;
N = 20;
n = linspace(0,1,N);
f0 = 0.1;
s = sin(2*pi*n);
bits_modules = kron(bits,s);
RSB = 10;
sigma_carre = (1/(N*Nbits)).*sum(bits_modules.^2)/10^(RSB/10);
bruit = sqrt(sigma_carre)*randn(1,N*Nbits);
signal_emis = bruit + bits_modules;
bits_detectes = sign(s*reshape(signal_emis,N,Nbits));
TEB = -sum((bits == bits_detectes)-1);

RSB = linspace(-10,0,20);
for i = 1:20 
    sigma_carre = (1/(N*Nbits)).*sum(bits_modules.^2)/10^(RSB(i)/10);
    bruit = sqrt(sigma_carre)*randn(1,N*Nbits);
    signal_emis = bruit + bits_modules;
    bits_detectes = sign(s*reshape(signal_emis,N,Nbits));
    TEB(i) = -sum((bits == bits_detectes)-1);
end
%semilogy(RSB,TEB);

%1)2)
texte = 'cet apres midi nous avons partiel de traitement numerique du signal '
[bits,dict] = c_source(texte);
bits = bits*2-1;
n = linspace(0,1,N);
s = sin(2*pi*n);
bits_modules = kron(bits,s);
Nbits = size(bits_modules);
Nbits = Nbits(2)
RSB = -20;
sigma_carre = (1/(N*Nbits)).*sum(bits_modules.^2)/10^(RSB/10)
bruit = sqrt(sigma_carre)*randn(1,Nbits);
signal_emis = bruit + bits_modules;
bits_detectes = (sign(s*reshape(signal_emis,N,[]))+1)/2;

texte_decode = d_source(bits_detectes,dict)

%2)
N = 20;
signal = sin(2*pi*n)'; 
sigma = eye(N);
p = pi_theorique(signal,sigma,N);
plot(p)
