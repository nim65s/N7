Nmax = 10;

[U, Uideal] = exp_et_ideal(2);
erreur = norm(U-Uideal);

for N = 3:Nmax
    [U, Uideal] = exp_et_ideal(N);
    erreur = [erreur norm(U-Uideal)];
end

h = 1/(N+1);

x = h:h:(1-h);
x = x';

% hold on
% subplot(2,1,1)
% plot(erreur);
% subplot(2,1,2)
% plot(x,U,x,Uideal)
% hold off


% DENSITÉ DE FORCE CONSTANTE
k = 2;
%N = 5;
[U, Uideal] = exp_et_ideal_const(N,k);
erreur = norm(U-Uideal);

for N = 3:Nmax
    [U, Uideal] = exp_et_ideal_const(N,k);
    erreur = [erreur norm(U-Uideal)];
end

h = 1/(N+1);

x = h:h:(1-h);
x = x';

% hold on
% subplot(2,1,1)
% plot(erreur);
% subplot(2,1,2)
% plot(x,U,x,Uideal)
% hold off

% POISSON
delta = 5.8905e-5;
dn = delta/2;
dp = delta/2;
Nd = 1e16;
Na = 1e16;
Vn = 1.3879;
Vp = 0;
q = 1.6e-19;

[U, Uideal] = poisson(2, dn, dp, Nd, Na, Vn, Vp, q);
erreur = norm(U-Uideal);

for N = 3:Nmax
    [U, Uideal] = poisson(N, dn, dp, Nd, Na, Vn, Vp, q);
    erreur = [erreur norm(U-Uideal)];
end

h = (dp+dn)/(N+1);

x = (-dn+h):h:(dp-h);
x = x';

hold on
subplot(2,1,1)
plot(erreur);
subplot(2,1,2)
plot(x,U,x,Uideal)
hold off