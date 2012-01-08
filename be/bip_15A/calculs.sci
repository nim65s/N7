// Constantes
ni = 1.6E10
q = 1.6E-19
Ut = 26E-3
epsilon = 1E-12

N_e = 2E18
N_b = 3E16
N_c = 9E14
N_cpp = 5E19

X_e = 1E-4
X_b = 1E-4
X_c = 5E-4
X_cpp = 2E-2

A_e = 500E-8
A_c = 5000E-8

// I.1 : tableau
printf('\n\t tableau')

mu_e = 125
mu_b = 1000
mu_c = 560

D_e = Ut*mu_e
D_b = Ut*mu_b
D_c = Ut*mu_c

tau_e = 1E10/N_e
tau_b = 1E10/N_b
tau_c = 1E10/N_c

L_e = sqrt(D_e*tau_e)
L_b = sqrt(D_b*tau_b)
L_c = sqrt(D_c*tau_c)

X_L_e = X_e/L_e
X_L_b = X_e/L_b
X_L_c = X_e/L_c

printf('\nD_e : %.2e\n',D_e)
printf('D_b : %.2e\n',D_b)
printf('D_c : %.2e\n',D_c)
printf('tau_e : %.2e\n',tau_e)
printf('tau_b : %.2e\n',tau_b)
printf('tau_c : %.2e\n',tau_c)
printf('L_e : %.2e\n',L_e)
printf('L_b : %.2e\n',L_b)
printf('L_c : %.2e\n',L_c)
printf('X_L_e : %.2e\n',X_L_e)
printf('X_L_b : %.2e\n',X_L_b)
printf('X_L_c : %.2e\n',X_L_c)

// I.1 : gains direct et inverse, courant de saturation, résistance série collecteur
printf('\n\t gains direct et inverse, courant de saturation, résistance série collecteur')

Ge = 1 - (D_e*N_b*X_b)/(D_b*N_e*L_e*tanh(X_e/L_e))
a = 1 - X_b*X_b/(2*L_b*L_b)
an = Ge*a
bn = an/(1-an)
Gc = 1/(1+(D_c*N_b*X_b)/(D_b*N_c*X_c))
bi = Gc/(1-Gc)
Is = q*A_e*ni*ni*D_b/(N_b*X_b)
Rsc = X_c/(q*mu_c*N_c*A_c)

printf('\nGe : %.2e\n',Ge)
printf('a : %.2e\n',a)
printf('an : %.2e\n',an)
printf('bn : %.2e\n',bn)
printf('Gc : %.2e\n',Gc)
printf('bi : %.2e\n',bi)
printf('Is : %.2e\n',Is)
printf('Rsc : %.2e\n',Rsc)

// I.2 : hauteurs de barrière, largeur des zones de charge d'espace
printf('\n\t hauteurs de barrière, largeur des zones de charge d espace')

Phi_eb = Ut*log(N_e*N_b/ni/ni)
Phi_bc = Ut*log(N_b*N_c/ni/ni)
N_eb = N_e*N_b/(N_e+N_b)
N_bc = N_b*N_c/(N_b+N_c)
V_be = 0.68
V_cb = 8-0.68
d_eb = sqrt((2*epsilon*(Phi_eb-V_be))/(q*N_eb))
d_bc = sqrt((2*epsilon*(Phi_bc+V_cb))/(q*N_bc))
d_bc_b = d_bc/(1+N_b/N_c)
d_bc_c = d_bc - d_bc_b

printf('\nPhi_eb : %.2e\n',Phi_eb)
printf('Phi_bc : %.2e\n',Phi_bc)
printf('N_eb : %.2e\n',N_eb)
printf('N_bc : %.2e\n',N_bc)
printf('V_be : %.2e\n',V_be)
printf('V_cb : %.2e\n',V_cb)
printf('d_eb : %.2e\n',d_eb)
printf('d_bc : %.2e\n',d_bc)
printf('d_bc_b : %.2e\n',d_bc_b)
printf('d_bc_c : %.2e\n',d_bc_c)

// I.2 : longeurs électriques
printf('\n\t longeurs électriques')

W_b = X_b - d_eb - d_bc_b
W_c = X_c - d_bc_c
W_e = X_e

printf('\nW_b : %.2e\n',W_b)
printf('W_c : %.2e\n',W_c)

// I.2 : gains direct et inverse, courant de saturation, résistance série collecteur
printf('\n\t gains direct et inverse, courant de saturation, résistance série collecteur')

Ge = 1 - (D_e*N_b*W_b)/(D_b*N_e*L_e*tanh(W_e/L_e))
a = 1 - W_b*W_b/(2*L_b*L_b)
an = Ge*a
bn = an/(1-an)
Gc = 1/(1+(D_c*N_b*W_b)/(D_b*N_c*W_c))
bi = Gc/(1-Gc)
Is = q*A_e*ni*ni*D_b/(N_b*W_b)
Rsc = W_c/(q*mu_c*N_c*A_c)

printf('\nGe : %.2e\n',Ge)
printf('a : %.2e\n',a)
printf('an : %.2e\n',an)
printf('bn : %.2e\n',bn)
printf('Gc : %.2e\n',Gc)
printf('bi : %.2e\n',bi)
printf('Is : %.2e\n',Is)
printf('Rsc : %.2e\n',Rsc)

// I.3 : courants
printf('\n\t courants')

I_b = Is*(exp(V_be/Ut)-1)
I_c = bn*I_b

printf('\nI_b : %.2e\n',I_b)
printf('I_c : %.2e\n',I_c)

// I.4 : Early
printf('\n\t Early')

mu = -(Ut/W_b)*sqrt((epsilon*N_bc)/(2*q*N_b*N_b*(Phi_bc+V_cb)))
r_c = -Ut/(mu*I_c)
Va = -r_c*I_c

printf('\nmu : %.2e\n',mu)
printf('r_c : %.2e\n',r_c)
printf('Va : %.2e\n',Va)

// I.5 : TODO
printf('\n\t TODO')

// I.6 : PNP
printf('\n\t PNP')

mu_e = 200
mu_b = 380
mu_c = 1360
D_e = Ut*mu_e
D_b = Ut*mu_b
D_c = Ut*mu_c
L_e = sqrt(D_e*tau_e)
L_b = sqrt(D_b*tau_b)
L_c = sqrt(D_c*tau_c)
Ge = 1 - (D_e*N_b*X_b)/(D_b*N_e*L_e*tanh(X_e/L_e))
a = 1 - X_b*X_b/(2*L_b*L_b)
an = Ge*a
bn = an/(1-an)
Is = q*A_e*ni*ni*D_b/(N_b*X_b)

printf('\nGe : %.2e\n',Ge)
printf('a : %.2e\n',a)
printf('an : %.2e\n',an)
printf('bn : %.2e\n',bn)
printf('Is : %.2e\n',Is)

// II.1 : variables
printf('\n\t variables')

V_be = 0.6
R_sc = 42.7
R_c = 1000
R_b = 12000

// II.1.2 : point de fonctionnement
printf('\n\t point de fonctionnement')

E_b = 1
E = 5
bn = 452
I_b = (E_b-V_be)/R_b
I_c = bn*I_b
I_csat = E/R_c
V_ce = R_sc*I_csat
printf('\nI_b : %.2e\n',I_b)
printf('I_c : %.2e\n',I_c)
printf('I_csat : %.2e\n',I_csat)
printf('V_ce : %.2e\n',V_ce)

// II.1.3 : point de fonctionnement
printf('\n\t point de fonctionnement')

E_b = 5
I_b = (E_b-V_be)/R_b
I_c = bn*I_b
I_csat = E/R_c
V_ce = R_sc*I_csat
printf('\nI_b : %.2e\n',I_b)
printf('I_c : %.2e\n',I_c)
printf('I_csat : %.2e\n',I_csat)
printf('V_ce : %.2e\n',V_ce)

// II.2 : E_b limite
printf('\n\t E_b limite')

I_b = I_csat/bn
E_b = V_be +R_b*I_b
printf('\nE_b : %.2e\n',E_b)

exit
