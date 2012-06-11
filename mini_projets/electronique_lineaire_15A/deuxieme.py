#!/usr/bin/python2
#-*- coding: utf-8 -*-

from ec import *
from mplib import *
from serieeuhdouze import *
import shelve, os.path, sys
from logging import warning, error

ORDRE = 0

# Init
nom='2EC'
a = {}
iRb1=E(47000)
iRb2=E(47000)
iRe1=E(33000)
iRe2=E(33000)
Rc=E(5600)
Zl=16000
Ve=0.006
C = 0.000001

init = EmetteurCommun(Rb1=iRb1,Rb2=iRb2,Rc=Rc,Re1=iRe1,Re2=iRe2,Rg=10,Ce=C,nom=nom,Zl=Zl,Ve=Ve)
print init

Ad = minimaxi(30,60)

def erreurs(cc):
    erreur = 0
    if not cc.Ad >= Ad:
        erreur = abs(Ad - cc.Ad)
    return erreur

def erreurssi(cc):
    r = erreurs(cc)
    return si(r[0])

ZERO = set()

def trouvermieuxboucle(Rb1,Rb2,Re1,Re2,Rc,nom,Zl,meilleur,meilleur_score):
    """ ce qu’il se passe dans la boucle de trouvermieux """
    cc = EmetteurCommun(Rb1=Rb1,Rb2=Rb2,Rc=Rc,Re1=Re1,Re2=Re2,Rg=10,Ce=C,nom=nom,Zl=Zl,Ve=Ve)
    score = erreurs(cc)
    if score == 0:
        ZERO.add((Rb1.v,Rb2.v,Rc.v,Re1.v,Re2.v))
    elif score < meilleur_score:
        meilleur_score = score
        meilleur = cc
    return (meilleur,meilleur_score)

def trouvermieux(icc):
    meilleur = icc
    meilleur_score = 1000000000000

    iRb1 = E(icc.Rb1)
    iRb2 = E(icc.Rb2)
    iRc = E(icc.Rc)
    iRe1 = E(icc.Re1)
    iRe2 = E(icc.Re2)
    sRb1 = [iRb1]
    sRb2 = [iRb2]
    sRc = [iRc]
    sRe1 = [iRe1]
    sRe2 = [iRe2]
    for i in range(1,5):
        sRb1 += [iRb1 + i]
        sRb1 += [iRb1 - i]
        sRb2 += [iRb2 + i]
        sRb2 += [iRb2 - i]
        sRc += [iRc + i]
        sRc += [iRc - i]
        sRe1 += [iRe1 + i]
        sRe1 += [iRe1 - i]
        sRe2 += [iRe2 + i]
        sRe2 += [iRe2 - i]

    for Rb1 in sRb1:
        for Rb2 in sRb2:
            for Rc in sRc:
                for Re1 in sRe1:
                    for Re2 in sRe2:
                        meilleur,meilleur_score = trouvermieuxboucle(Rb1,Rb2,Re1,Re2,Rc,icc.nom,icc.Zl,meilleur,meilleur_score)
    if not ZERO:
        print meilleur_score
    return meilleur, meilleur_score

def marge(cc):
    return [ cc.Ad.mini - Ad.mini, Ad.maxi - cc.Ad.maxi]

def margesi(cc):
    r = marge(cc)
    return [si(r[0]),si(r[1])]

def trouverlemeilleur(ZERO):
    meilleur_score = 0
    meilleur = ''
    for zRb1,zRb2,zRc,zRe1,zRe2 in ZERO:
        cc = EmetteurCommun(Rb1=zRb1,Rb2=zRb2,Rc=zRc,Re1=zRe1,Re2=zRe2,Rg=10,Ce=C,nom=nom,Zl=Zl,Ve=Ve)
        scores = marge(cc)
        score = scores[0]+scores[1]
        if score > meilleur_score:
            meilleur_score = score
            meilleur = cc
            print cc.Rb1,cc.Rb2,cc.Re,cc.Rc,si(score),margesi(cc)
    return meilleur

scores = marge(init)
score = scores[0]+scores[1]
meilleur,meilleur_score = trouvermieux(init)
print meilleur
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
        for zRb1,zRb2,zRc,zRe1,zRe2 in ZEROcp:
            trouvermieux(EmetteurCommun(Rb1=zRb1,Rb2=zRb2,Rc=zRc,Re1=zRe1,Re2=zRe2,Rg=10,Ce=C,nom=nom,Zl=Zl,Ve=Ve))
        print len(ZERO)
    meilleur = trouverlemeilleur(ZERO)
    print meilleur
