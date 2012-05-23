#!/usr/bin/python2
#-*- coding: utf-8 -*-

from cc import *
from mplib import *
from serieeuhdouze import *
import shelve, os.path, sys
from logging import warning, error

ORDRE = 5

# Init
nom='4CC'
a = {}
iRb1=E(47000)
iRb2=E(680000)
iRe1=E(100)
iRe2=E(820)
Rc=E(100)
Rg=5600
Zl=5000

init = CollecteurCommun(Rb1=iRb1,Rb2=iRb2,Rc=Rc,Re1=iRe1,Re2=iRe2,nom=nom,Rg=Rg,Zl=Zl)

Zs = minimaxi(85,115)
DS = 6

def erreurs(cc):
    erreur = [0,0,0]
    if not cc.Zs.mini >= Zs.mini:
        erreur[0] = abs(Zs.mini - cc.Zs.mini)
    if not cc.Zs.maxi <= Zs.maxi:
        erreur[1] = abs(cc.Zs.maxi - Zs.maxi)
    if not cc.DS.mini >= DS:
        erreur[2] = abs(DS - cc.DS.mini)
    return erreur

def erreurssi(cc):
    r = erreurs(cc)
    return [si(r[0]),si(r[1]),si(r[2])]

ZERO = set()

def trouvermieuxboucle(Rb1,Rb2,Re1,Re2,Rc,nom,Rg,Zl,meilleur,meilleur_score):
    """ ce qu’il se passe dans la boucle de trouvermieux """
    cc = CollecteurCommun(Rb1=Rb1,Rb2=Rb2,Rc=Rc,Re1=Re1,Re2=Re2,nom=nom,Rg=Rg,Zl=Zl)
    erreur = erreurs(cc)
    score = erreur[0] + erreur[1] + erreur[2]
    if score == 0:
            ZERO.add((Rb1,Rb2,Re1,Re2))
    elif score < meilleur_score:
        meilleur_score = score
        meilleur = cc
    return (meilleur,meilleur_score)

def trouvermieux(icc):
    meilleur = icc
    meilleur_score = 1000

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
        sRb2 += [iRb1 + i]
        sRb2 += [iRb1 - i]
        sRe1 += [iRe1 + i]
        sRe1 += [iRe1 - i]
        sRe2 += [iRe1 + i]
        sRe2 += [iRe1 - i]


    for Rb1 in sRb1:
        for Rb2 in sRb2:
            for Re1 in sRe1:
                for Re2 in sRe2:
                    meilleur,meilleur_score = trouvermieuxboucle(Rb1,Rb2,Re1,Re2,icc.Rc,icc.nom,icc.Rg,icc.Zl,meilleur,meilleur_score)
    if not ZERO:
        print meilleur_score
    return meilleur, meilleur_score

def marge(cc):
    return [ cc.Zs.mini - Zs.mini, Zs.maxi - cc.Zs.maxi, cc.DS.mini - DS ]

def margesi(cc):
    r = marge(cc)
    return [si(r[0]),si(r[1]),si(r[2])]

def trouverlemeilleur(ZERO):
    meilleur_score = 0
    meilleur = ''
    for zRb1,zRb2,zRe1,zRe2 in ZERO:
        cc = CollecteurCommun(Rb1=zRb1,Rb2=zRb2,Rc=Rc,Re1=zRe1,Re2=zRe2,nom=nom,Rg=Rg,Zl=Zl)
        scores = marge(cc)
        score = scores[0] + scores[1] + scores[2] 
        if score > meilleur_score:
            meilleur_score = score
            meilleur = cc
            print cc.Rb1,cc.Rb2,cc.Re1,cc.Re2,si(score),margesi(cc)
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
        for cc in ZEROcp:
            trouvermieux(cc)
        print len(ZERO)

    j=0
    for cc in ZEROcp:
        i = 0
        for ccp in ZEROcp:
            if cc == ccp:
                i += 1
        if i > 1:
            j += 1
    print len(ZERO), j

    print trouverlemeilleur(ZERO)
