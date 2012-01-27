//Calculs liés au BE de lignes de Transmissions

R = 80
Z_0 = 50
f = 2e9
L = 5e-9

z = (R + %i*L*2*%pi*f)/Z_0
Gamma = (z-1)/(z+1)

printf('\nImpedance normalisée = %f + %f i',real(z),imag(z))
printf('\nGamma = %f + %f i',real(Gamma),imag(Gamma))

printf('\n\nCalcul dans le cas quart d’onde')

Z_e = 1/z
Gamma2 = (Z_e-1)/(Z_e+1)

printf('\nImpedance = %f + %f i',real(Z_e),imag(Z_e))
printf('\nGamma = %f + %f i',real(Gamma2),imag(Gamma2))

Z_r = 50
Z_u = R
Z_c = sqrt(Z_r*Z_u);

printf('\nZ_c pour avoir Z_r de 50 Ohm = %f',Z_c)
 
exit
