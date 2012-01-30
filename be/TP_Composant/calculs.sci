printf('\nI-II-a\n')
Rb1=47E3
Rb2=22E3
Rc=2.7E3
Re=2.2E3
EC=12
b=400

Vb=EC*Rb2/(Rb1+Rb2)
Ve=Vb-0.6
Ie=Ve/Re
Ib=Ie/(b+1)
Ic=b*Ib
Vc=EC-Rc*Ic

printf('Vb = %.2e\n',Vb)
printf('Ie = %.2e\n',Ie)
printf('Ib = %.2e\n',Ib)
printf('Ic = %.2e\n',Ic)
printf('Vc = %.2e\n',Vc)
printf('Courant dans les résistances de base = %.2e\n',EC/(Rb1+Rb2))

exit
