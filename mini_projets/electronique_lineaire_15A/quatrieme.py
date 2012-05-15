#!/usr/bin/python2
#-*- coding: utf-8 -*-

from cc import *
from mplib import *
from serieeuhdouze import *
import shelve, os.path, sys
from logging import warning, error

# Init
nom='4CC'
a = {}
iRb1=E(180000)
iRb2=E(150000)
iRe1=E(68)
iRe2=E(3300)
Rc=E(100)
Rg=5600
Zl=5000

init = CollecteurCommun(Rb1=iRb1,Rb2=iRb2,Rc=Rc,Re1=iRe1,Re2=iRe2,nom=nom,Rg=Rg,Zl=Zl)

Zs = minimaxi(85,115)
DS = 6

def quatrieme(cc):
    erreur = [0,0,0]
    if not cc.Zs.mini >= Zs.mini:
        erreur[0] = Zs.mini - cc.Zs.mini
    if not cc.Zs.maxi <= Zs.maxi:
        erreur[1] = cc.Zs.maxi - Zs.maxi
    if not cc.DS.mini >= DS:
        erreur[2] = DS - cc.DS.mini
    return erreur

def quatriemesi(cc):
    r = quatrieme(cc)
    return [si(r[0]),si(r[1]),si(r[2])]

zero = set()

def trouvermieux(icc):
    meilleur = icc
    erreur = quatrieme(icc)
    meilleur_score = erreur[0] + erreur[1] + erreur[2]

    iRb1 = E(icc.Rb1)
    iRb2 = E(icc.Rb2)
    iRe1 = E(icc.Re1)
    iRe2 = E(icc.Re2)

    for Rb1 in [iRb1-1,iRb1,iRb1+1]:
        for Rb2 in [iRb2-1,iRb2,iRb2+1]:
            for Re1 in [iRe1-1,iRe1,iRe1+1]:
                for Re2 in [iRe2-1,iRe2,iRe2+1]:
                    cc = CollecteurCommun(Rb1=Rb1,Rb2=Rb2,Rc=Rc,Re1=Re1,Re2=Re2,nom=nom,Rg=Rg,Zl=Zl)
                    erreur = quatrieme(cc)
                    score = erreur[0] + erreur[1] + erreur[2]
                    if score == 0:
                        zero.add(cc)
                        print Rb1.s,Rb2.s,Re1.s,Re2.s,si(score),quatriemesi(cc)
                    elif score < meilleur_score:
                        meilleur_score = score
                        meilleur = cc
                        print score
    if not zero:
        print meilleur_score
    return meilleur



print init
print quatrieme(init)
print

premier = trouvermieux(init)
deuxieme = trouvermieux(premier)
zerocp = zero.copy()
print len(zero)
for cc in zerocp:
    trouvermieux(cc)
print len(zero)
zerocp = zero.copy()
for cc in zerocp:
    trouvermieux(cc)
print len(zero)
zerocp = zero.copy()
for cc in zerocp:
    trouvermieux(cc)
print len(zero)

#meilleur = init
#meilleur_score = 10000

#for Rb1 in [iRb1-1,iRb1,iRb1+1]:
    #for Rb2 in [iRb2-1,iRb2,iRb2+1]:
        #for Re1 in [iRe1-1,iRe1,iRe1+1]:
            #for Re2 in [iRe2-1,iRe2,iRe2+1]:
                #cc = CollecteurCommun(Rb1=Rb1,Rb2=Rb2,Rc=Rc,Re1=Re1,Re2=Re2,nom=nom,Rg=Rg,Zl=Zl)
                #erreur = quatrieme(cc)
                #score = erreur[0] + erreur[1] + erreur[2]
                #print Rb1.s,Rb2.s,Re1.s,Re2.v,score,quatriemesi(cc)
                #if score == 0:
                    #zero.add(cc)
                #elif score < meilleur_score:
                    #meilleur_score = score
                    #meilleur = cc
                    #print score
#print meilleur
#print meilleur_score

#iRb1 = E(meilleur.Rb1)
#iRb2 = E(meilleur.Rb2)
#iRe1 = E(meilleur.Re1)
#iRe2 = E(meilleur.Re2)

#for Rb1 in [iRb1-1,iRb1,iRb1+1]:
    #for Rb2 in [iRb2-1,iRb2,iRb2+1]:
        #for Re1 in [iRe1-1,iRe1,iRe1+1]:
            #for Re2 in [iRe2-1,iRe2,iRe2+1]:
                #cc = CollecteurCommun(Rb1=Rb1,Rb2=Rb2,Rc=Rc,Re1=Re1,Re2=Re2,nom=nom,Rg=Rg,Zl=Zl)
                #erreur = quatrieme(cc)
                #score = erreur[0] + erreur[1] + erreur[2]
                #print Rb1.s,Rb2.s,Re1.s,Re2.s,si(score),quatriemesi(cc)
                #if score == 0:
                    #zero.add(cc)
                #elif score < meilleur_score:
                    #meilleur_score = score
                    #meilleur = cc
                    #print score
#print meilleur
#print meilleur_score

#for i in zero
