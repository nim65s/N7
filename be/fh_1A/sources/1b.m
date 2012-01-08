Zant = 75-25i;
Pd = 10^6.3

Ze = Z11 - (Z12*Z21)/(Z22+Zant)

Rc = 50;
Eg = sqrt(8*Rc*Pd)
V1 = Eg*Ze/(Ze+Rc)
I1=V1/Ze

Sortie = inv(M)*[V1;I1];
V2 = Sortie(1)
I2 = -Sortie(2)


a1 = (V1 + Zc*I1)/2
a2 = (V2 + Zc*I2)/2

b1 = (V1 - Zc*I1)/2
b2 = (V2 - Zc*I2)/2

Gue = b1/a1
Gus = b2/a2

Pray = V2*conj(I2)/2
Pref = abs(b1)^2/2

Pf = Pray+Pref

RL = 20*log(Pd/Prf)
IL = 20*log(Pd/Pf)
