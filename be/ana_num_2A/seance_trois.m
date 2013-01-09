delta = 5.8905e-5;
dn = delta/2;
dp = delta/2;
Nd = 1e16;
Na = 1e16;
Vn = 1.3879;
Vp = 0;
q = 1.6e-19;

[Udf, Uideal] = poisson(20, dn, dp, Nd, Na, Vn, Vp, q);
Uef = elements_finis(20, dn, dp, Nd, Na, Vn, Vp, q);

plot(Udf)
hold on 
plot(Uef,'red')
plot(Uideal,'black')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%