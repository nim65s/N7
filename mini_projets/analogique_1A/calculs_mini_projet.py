#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import time
resistances = []

for j in range(1,5):
    for i in 1.0, 1.2, 1.5, 1.8, 2.2, 2.7, 3.3, 3.9, 4.7, 5.6, 6.8, 8.2:
        resistances.append(i*10**j)

resistances.append(10**6)

Vcc = 12.0
Vbe = 0.62
Ut = 0.026
Rg = 50.0

def par(a,b):
    return a*b/(a+b)

def para(a,b,c):
    return(par(par(a,b),c))

def courantcollecteur(Rb1,Rb2,Re,b):
    return (Vcc/(1+Rb1/Rb2)-Vbe)/(Re+par(Rb1,Rb2)/b)

def cc(Rb1,Rb2,Rc,Re,b,Zl,Rg):
    Rb = par(Rb1,Rb2)
    Ic = courantcollecteur(Rb1,Rb2,Re,b)
    gm = Ic/Ut
    rb = b/gm

    Ze = par(Rb,rb+b*par(Re,Zl))
    Zs = par(Re,(rb+par(Rg,Rb))/b)
    #G = b*par(Re,Zl)/(rb+b*par(Re,Zl))
    G = 1.0

    

    return (Rb1,Rb2,Rc,Re,b,Zl,Ze,Zs,G)

print cc(54500,66500,100,4700,380,5000,2700)[7]
print cc(54500,66500,100,4700,800,5000,2700)[7]


def ec(Rb1,Rb2,Re,b,Zl,dds):
    Rb = par(Rb1,Rb2)
    Ic = courantcollecteur(Rb1,Rb2,Re,b)
    gm = Ic/Ut
    rb = b/gm

    #Vcet = -Ic * par(Rc,Zl)

    av = -gm*par(Rc,Zl)
    Ze = par(Rb,rb)
    Zs = Rc
    
    Dvbemax = dds / av

    return (Rb1,Rb2,Rc,Re,b,Zl,Ze,Zs,av,dds)

def ad(Rb1,Rb2,Rc,Re,b,dds):
    Vth = -Vcc/(1+Rb1/Rb2)
    Ic3 = courantcollecteur(Rb1,Rb2,Re,b)
    Ic = Ic3/2.0
    gm = Ic/Ut
    rb = b/gm

    av = gm*Rc/2.0
    #Ze = rb + (par(Zs,rb)*(1+gm*rb))/(1-gm*par(Zs,rb))
    Ze = 2.0*rb
    Zs = Rc
    return (Rb1,Rb2,Rc,Re,b,Zl,Ze,Zs,av)

#VcedM = Icq-Vceq/alpha
#Vcem = 0,4


#for b in 380,800:
#    for Rb11 in resistances:
#        for Rb21 in resistances:
#            for Re1 in resistances:
#                for Rb12 in resistances:
#                    for Rb22 in resistances:
#                        for Re2 in resistances:
#                            Zl = para(Rb12,Rb22,b*Ut/courantcollecteur(Rb21,Rb22,Re2,b))
#                            Impedancedentree = para(Rb11,Rb21,b*Ut/courantcollecteur(Rb11,Rb21,Re1,b)+b*par(Re1,Zl))
#                            if Impedancedentree >= 55 and Impedancedentree <=65:
#                                print "ZE OK"
                             #   for Rc3 in resistances:
                              #      for Rb14 in resistances:
                               #         for Rb24 in resistances:
                                #            for Re4 in resistances:
                                 #               for Rc4 in resistances:
                                  #                  Impedancedesortie = par(Re4,(b*Ut/((Vth4-Vbe)/(Re4+par(Rb14,Rb24)/b))) + par(Rc3,Rb4)/b)
                                   #                 if Impedancedesortie >= 85 and Impedancedesortie <= 115:
                                    #                    for Rc1 in resistances:
                            #                                for Rc2 in resistances:
                             #                                   for Rb13 in resistances:
                              #                                      for Rb23 in resistances:
                                #                                         for Re3 in resistances:
                                #                                            Gain = ((Vcc/(1+Rb12/Rb22)-Vbe)/(Re2+par(Rb12,Rb22)/b))*Rc2*Rc3*b/(Ut*(Rc2+4*b*Ut/((-Vcc/(A+Rb13/Rb23)-Vbe)/(Re3+par(Rb13,Rb23)/b))))
                                 #                                           print time.time()
                                    #                                              if Gain >= 563 and Gain <= 1178:
                                     #                                             print WIN
#ta résistance d'emetteur fera jamais 10k
#et ton pont de base feras jamais moins de 5k
