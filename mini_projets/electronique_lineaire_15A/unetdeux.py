#!/usr/bin/python2
#-*- coding: utf-8 -*-

from cc import *
from ec import *
from mplib import *
from serieeuhdouze import *
import shelve, os.path, sys
from logging import warning, error

ORDRE = 0

# Init
nom='1CC'
a = {}

iR1b1=E(560000)
iR1b2=E(1000000)
iR1e1=E(27)
iR1e2=E(15)
R1c=E(100)

iR2b1=E(47000)
iR2b2=E(47000)
iR2e=E(33000)
iR2c=E(5600)
iC2e=0.000001
Rg=50
Zl=16000

iC01=0.000001
iC12=0.000001
iC23=0.000001

icc = CollecteurCommun(Rb1=iR1b1,Rb2=iR1b2,Rc=R1c,Re1=iR1e1,Re2=iR1e2,nom='1CC',Rg=Rg,Zl=10000,Ve=0.006)
iec = EmetteurCommun(Rb1=iR2b1,Rb2=iR2b3,Rc=iR2c,Re1=iR2e1,Re2=iR2e2,Ce=iC2e,nom='2CE',Rg=10000)
print init

Ze = minimaxi(30000,65000)
Fc = minimaxi(80,120)
Ad = minimaxi(30,60)

def erreurs(cc):
    erreur = [0,0]
    if not cc.Ze.mini >= Ze.mini:
        erreur[0] = abs(Ze.mini - cc.Ze.mini)
    if not cc.Ze.maxi <= Ze.maxi:
        erreur[1] = abs(cc.Ze.maxi - Ze.maxi)
    return erreur

def erreurssi(cc):
    r = erreurs(cc)
    return [si(r[0]),si(r[1])]

ZERO = set()

def trouvermieuxboucle(Rb1,Rb2,Re1,Re2,Rc,nom,Rg,Zl,meilleur,meilleur_score):
    """ ce qu’il se passe dans la boucle de trouvermieux """
    cc = CollecteurCommun(Rb1=Rb1,Rb2=Rb2,Rc=Rc,Re1=Re1,Re2=Re2,nom=nom,Rg=Rg,Zl=Zl,Ve=0.006)
    erreur = erreurs(cc)
    score = erreur[0] + erreur[1]
    if score == 0:
        ZERO.add((Rb1.v,Rb2.v,Re1.v,Re2.v))
    elif score < meilleur_score:
        meilleur_score = score
        meilleur = cc
    return (meilleur,meilleur_score)

def trouvermieux(icc):
    meilleur = icc
    meilleur_score = 1000000000000

    iRb1 = E(icc.Rb1)
    iRb2 = E(icc.Rb2)
    iRe1 = E(icc.Re1)
    iRe2 = E(icc.Re2)
    sRb1 = [iRb1]
    sRb2 = [iRb2]
    sRe1 = [iRe1]
    sRe2 = [iRe2]
    for i in range(1,5):
        sRb1 += [iRb1 + i]
        sRb1 += [iRb1 - i]
        sRb2 += [iRb2 + i]
        sRb2 += [iRb2 - i]
        sRe1 += [iRe1 + i]
        sRe1 += [iRe1 - i]
        sRe2 += [iRe2 + i]
        sRe2 += [iRe2 - i]

    for Rb1 in sRb1:
        for Rb2 in sRb2:
            for Re1 in sRe1:
                for Re2 in sRe2:
                    meilleur,meilleur_score = trouvermieuxboucle(Rb1,Rb2,Re1,Re2,icc.Rc,icc.nom,icc.Rg,icc.Zl,meilleur,meilleur_score)
    if not ZERO:
        print meilleur_score
    return meilleur, meilleur_score

def marge(cc):
    return [ cc.Ze.mini - Ze.mini, Ze.maxi - cc.Ze.maxi]

def margesi(cc):
    r = marge(cc)
    return [si(r[0]),si(r[1])]

def trouverlemeilleur(ZERO):
    meilleur_score = 0
    meilleur = ''
    for zRb1,zRb2,zRe1,zRe2 in ZERO:
        cc = CollecteurCommun(Rb1=zRb1,Rb2=zRb2,Rc=Rc,Re1=zRe1,Re2=zRe2,nom=nom,Rg=Rg,Zl=Zl,Ve=0.006)
        scores = marge(cc)
        score = scores[0] + scores[1]
        if score > meilleur_score:
            meilleur_score = score
            meilleur = cc
            print cc.Rb1,cc.Rb2,cc.Re,si(score),margesi(cc)
    return meilleur

meilleur,meilleur_score = trouvermieux(init)
while True:
    meilleur,nouveau_meilleur_score = trouvermieux(meilleur)
    if nouveau_meilleur_score == meilleur_score:
        break
    else:
        meilleur_score = nouveau_meilleur_score

print meilleur

print len(ZERO)

if len(ZERO):
    for i in range(ORDRE):
        ZEROcp = ZERO.copy()
        for zRb1,zRb2,zRe1,zRe2 in ZEROcp:
            trouvermieux(CollecteurCommun(Rb1=zRb1,Rb2=zRb2,Rc=Rc,Re1=zRe1,Re2=zRe2,nom=nom,Rg=Rg,Zl=Zl,Ve=0.006))
        print len(ZERO)
    meilleur = trouverlemeilleur(ZERO)
    print meilleur
