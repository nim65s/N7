printf('\tConstantes\n');
ni = 1.6E10
q = 1.6E-19
Ut = 26E-3
epsilon = 1E-12

Na = 2E18
Xp = 1E-5
Nd = 3E15
Xn = 3E-4
Aj = 1.5E-3

printf('ni = %.2e\n',ni)
printf('q = %.2e\n',q)
printf('Ut = %.2e\n',Ut)
printf('epsilon = %.2e\n',epsilon)
printf('Na = %.2e\n',Na)
printf('Xp = %.2e\n',Xp)
printf('Nd = %.2e\n',Nd)
printf('Xn = %.2e\n',Xn)

printf('\tI-3 : Calculs de la largeur de la zone de charge d''espace globale\n')
PhiNP = Ut*log(Na*Nd/ni**2)
Ne = Na*Nd/(Na+Nd)
delta = sqrt(2*epsilon*PhiNP/q/Ne)

printf('PhiNP = %.2e\n',PhiNP)
printf('Ne = %.2e\n',Ne)
printf('delta = %.2e\n',delta)

printf('\tI-3 : Calculs de la largeur de la zone de charge d''espace dans chacune des deux régions\n')
delta_n = delta/(Nd/Na +1)
delta_p = delta - delta_n

printf('delta_n = %.2e\n',delta_n)
printf('delta_p = %.2e\n',delta_p)

printf('\tI-3 : Calculs de la longueur électrique de chacune des deux régions\n')
Wp = Xp - delta_p
Wn = Xn - delta_n

printf('W_n = %.2e\n',Wn)
printf('W_p = %.2e\n',Wp)

printf('\tI-4 : Calcul du courant de saturation de la diode\n')
mu_p = 450
tau_p = 1E10/(3E15)
D_p = mu_p*Ut
L_p = sqrt(D_p*tau_p)

printf('mu_p = %.2e\n',mu_p)
printf('tau_p = %.2e\n',tau_p)
printf('D_p = %.2e\n',D_p)
printf('L_p = %.2e\n',L_p)

Is=q*Aj*ni*ni*D_p/Nd/Wn

printf('Is = %.2e\n',Is)

printf('\tII-1 : Calcul de Vfni\n')
Vfni = Ut*log(Nd*Nd/ni/ni +1)
Ifni = Is*exp(Vfni/Ut -1)

printf('Vfni = %.2e\n',Vfni)
printf('Ifni = %.2e\n',Ifni)

printf('\tII-2 : Caractéristique I(V), tableau et graphe\n')
printf('    V    |    I  \n')
for v=list (0.55,0.56,0.57,0.58,0.59,0.6,0.61,0.62,0.63,0.64,0.65,0.66,0.67,0.68,0.69,0.7),
printf('%.2e | %.2e\n',v,Is*(%e^(v/Ut)-1)), end

v=[0.55:0.01:0.64]
f = gcf()
plot(v,Is*(%e^(v/Ut)-1))
xs2png(f,"II-2.png")

printf('\tII-3 : Calcul des valeurs des composants pour un courant de 7mA\n')
I = 7E-3
rd = Ut/I
Cd = I*Wn*Wn/(2*D_p*Ut)

printf('rd = %.2e\n',rd)
printf('Cd = %.2e\n',Cd)

printf('\tII-4 : Calcul de la fréquence de coupure\n')
tau = rd*Cd
fc = 1/(2*%pi*tau)

printf('tau = %.2e\n',tau)
printf('fc = %.2e\n',fc)

printf('\tIII-2 : Tracé de Delta\n')
v=[0.60:0.005:0.68]
plot(v,Is*(%e^(v/Ut)-1),v,(3-v)/50)
xs2png(f,"III-2.png")

printf('\tIII-3 : Calcul de la puissance maximale admissible par la diode')
J = 300
mu_n = 200
rho_n = 1 / ( q*Nd*mu_n) rho_p = 1 / (q*Na*mu_p) P = (rho_n*Xn + rho_p*Xp)*Aj*J*J

printf('J = %.2e\n',J)
printf('mu_n = %.2e\n',mu_n)
printf('rho_n = %.2e\n',rho_n)
printf('rho_p = %.2e\n',rho_p)
printf('P = %.2e\n',P)

exit
