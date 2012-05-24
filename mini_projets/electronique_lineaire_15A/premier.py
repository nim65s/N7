#!/usr/bin/python2
#-*- coding: utf-8 -*-

from cc import *
from mplib import *
from serieeuhdouze import *
import shelve, os.path, sys
from logging import warning, error

ORDRE = 0

# Init
nom='1CC'
a = {}
#iRb1=E(56000)
#iRb2=E(68000)
#iRe2=E(22000)
iRb1=E(820000)
iRb2=E(1000000)
iRe2=E(39)
Rc=E(100)
Rg=50
Zl=15000

init = CollecteurCommun(Rb1=iRb1,Rb2=iRb2,Rc=Rc,Re1=0,Re2=iRe2,nom=nom,Rg=Rg,Zl=Zl,Ve=0.006)
print init

Ze = minimaxi(25500,34500)

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

def trouvermieuxboucle(Rb1,Rb2,Re2,Rc,nom,Rg,Zl,meilleur,meilleur_score):
    """ ce qu’il se passe dans la boucle de trouvermieux """
    cc = CollecteurCommun(Rb1=Rb1,Rb2=Rb2,Rc=Rc,Re1=0,Re2=Re2,nom=nom,Rg=Rg,Zl=Zl,Ve=0.006)
    erreur = erreurs(cc)
    score = erreur[0] + erreur[1]
    if score == 0:
        ZERO.add((Rb1.v,Rb2.v,Re2.v))
    elif score < meilleur_score:
        meilleur_score = score
        meilleur = cc
    return (meilleur,meilleur_score)

def trouvermieux(icc):
    meilleur = icc
    meilleur_score = 100000

    iRb1 = E(icc.Rb1)
    iRb2 = E(icc.Rb2)
    iRe2 = E(icc.Re)
    sRb1 = [iRb1]
    sRb2 = [iRb2]
    sRe2 = [iRe2]
    for i in range(1,5):
        sRb1 += [iRb1 + i]
        sRb1 += [iRb1 - i]
        sRb2 += [iRb2 + i]
        sRb2 += [iRb2 - i]
        sRe2 += [iRe2 + i]
        sRe2 += [iRe2 - i]

    for Rb1 in sRb1:
        for Rb2 in sRb2:
            for Re2 in sRe2:
                meilleur,meilleur_score = trouvermieuxboucle(Rb1,Rb2,Re2,icc.Rc,icc.nom,icc.Rg,icc.Zl,meilleur,meilleur_score)
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
        cc = CollecteurCommun(Rb1=zRb1,Rb2=zRb2,Rc=Rc,Re1=0,Re2=zRe2,nom=nom,Rg=Rg,Zl=Zl,Ve=0.006)
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
        for zRb1,zRb2,zRe2 in ZEROcp:
            trouvermieux(CollecteurCommun(Rb1=zRb1,Rb2=zRb2,Rc=Rc,Re1=0,Re2=zRe2,nom=nom,Rg=Rg,Zl=Zl,Ve=0.006))
        print len(ZERO)
    meilleur = trouverlemeilleur(ZERO)
    print meilleur
