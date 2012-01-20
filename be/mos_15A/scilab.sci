tox = 150E-8
Na = 5E16
Nd = 5E16
es = 1E-12
eox = es/3
q = 1.6E-19
Ut = 26E-3
ni = 1.6E10

printf('\n\t I.1')

Cox=eox/tox
G = sqrt(2*q*es*Na)/Cox
Phi_T = 2*Ut*log(Na/ni)
V_T0 = Phi_T+G*sqrt(Phi_T)

printf('\nPhi_T = %.2e\n',Phi_T)
printf('V_T0 = %.2e\n',V_T0)
printf('Gamma = %.2e\n',G)

printf('\n\t I.2')

Phi_mi = -0.56

Phi_ms = Phi_mi-Ut*log(Na/ni)

printf('\nPhi_ms = %.2e\n',Phi_ms)

Nss = 1E10

D_V0 = q*Nss*tox/eox

printf('\nD_V0 = %.2e\n',D_V0)

Vtp = V_T0-abs(Phi_ms)-abs(D_V0)
Vtn = V_T0+abs(Phi_ms)+abs(D_V0)

printf('\nVtp = %.2e\n',Vtp)
printf('Vtn = %.2e\n',Vtn)

printf('\n\t I.3')

D_Vtp = 0.7-Vtp
D_Vtn = Vtn-0.7
Nad_p = eox*D_Vtp/(tox*q)
Nad_n = eox*D_Vtn/(tox*q)

printf('\nNad_p = %.2e\n',Nad_p)
printf('Nad_n = %.2e\n',Nad_n)

printf('\n\t III.1')

Vcc=5
Vout=2
mu_0 = 875
W = 1E-4
L = 1E-4
Vg = 5
V_th=0.7
R = (5-2)/(mu_0*Cox*W/L*(Vg-V_th-Vout/2)*Vout)

printf('\nR = %.2e\n',R)

printf('\n\t III.2')

function [y]=fct(Vout) , y=Vcc-2*R*mu_0*Cox*W/L*(Vg-V_th-Vout/2)*Vout-Vout, endfunction

Vout=fsolve(0,fct)

printf('\nVout = %.2e\n',Vout)

printf('\n\t III.3')

Vg=1

Vout=Vcc-R*mu_0*Cox*W/L*(Vg-V_th)^2

printf('\nVout = %.2e\n',Vout)

exit
