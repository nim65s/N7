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

def erreurs(cc):
    erreur = [0,0,0]
    if not cc.Zs.mini >= Zs.mini:
        erreur[0] = Zs.mini - cc.Zs.mini
    if not cc.Zs.maxi <= Zs.maxi:
        erreur[1] = cc.Zs.maxi - Zs.maxi
    if not cc.DS.mini >= DS:
        erreur[2] = DS - cc.DS.mini
    return erreur

def erreurssi(cc):
    r = erreurs(cc)
    return [si(r[0]),si(r[1]),si(r[2])]

ZERO = set()

def trouvermieuxboucle(Rb1,Rb2,Re1,Re2,Rc,nom,Rg,Zl,meilleur,meilleur_score):
    """ ce qu’il se passe dans la boucle de trouvermieux """
    score = 0
    cc = CollecteurCommun(Rb1=Rb1,Rb2=Rb2,Rc=Rc,Re1=Re1,Re2=Re2,nom=nom,Rg=Rg,Zl=Zl)
    print 'TMB\t',Rb1,Rb2,Re1,Re2,Rc,nom,Rg,Zl,meilleur_score
    for nRb1 in Rb1.mini, Rb1.maxi:
        for nRb2 in Rb2.mini, Rb2.maxi:
            for nRe1 in Re1.mini, Re1.maxi:
                for nRe2 in Re2.mini, Re2.maxi:
                    ncc = CollecteurCommun(Rb1=nRb1,Rb2=nRb2,Rc=Rc,Re1=nRe1,Re2=nRe2,nom=nom,Rg=Rg,Zl=Zl)
                    erreur = erreurs(ncc)
                    nscore = erreur[0] + erreur[1] + erreur[2]
                    #print nscore
                    if nscore > score:
                        #print 'nscore > score \o/'
                        score = nscore
                        cc = ncc
    print 'pire score de ce cc:', score
    if score == 0:
        connu = False
        for ccc in ZERO:
            if cc == ccc:
                connu = True
                break
        if not connu:
            ZERO.add(cc)
            print Rb1.s,Rb2.s,Re1.s,Re2.s,si(score),erreurssi(cc)
    elif score < meilleur_score:
        meilleur_score = score
        meilleur = cc
        print score
    return (meilleur,meilleur_score)


def trouvermieux(icc):
    meilleur = icc
    erreur = erreurs(icc)
    meilleur_score = erreur[0] + erreur[1] + erreur[2]

    iRb1 = E(icc.Rb1)
    iRb2 = E(icc.Rb2)
    iRe1 = E(icc.Re1)
    iRe2 = E(icc.Re2)

    for Rb1 in [iRb1-1,iRb1,iRb1+1]:
        for Rb2 in [iRb2-1,iRb2,iRb2+1]:
            for Re1 in [iRe1-1,iRe1,iRe1+1]:
                for Re2 in [iRe2-1,iRe2,iRe2+1]:
                    meilleur,meilleur_score = trouvermieuxboucle(Rb1,Rb2,Re1,Re2,icc.Rc,icc.nom,icc.Rg,icc.Zl,meilleur,meilleur_score)
    if not ZERO:
        print meilleur_score
    return meilleur

def marge(cc):
    return [ cc.Zs.mini - Zs.mini, Zs.maxi - cc.Zs.maxi, cc.DS.mini - DS ]

def margesi(cc):
    r = marge(cc)
    return [si(r[0]),si(r[1]),si(r[2])]

def trouverlemeilleur(ZERO):
    meilleur_score = 0
    meilleur = ''
    for cc in ZERO:
        scores = marge(cc)
        score = scores[0] + scores[1] + scores[2] 
        if score > meilleur_score:
            meilleur_score = score
            meilleur = cc
            print cc.Rb1,cc.Rb2,cc.Re1,cc.Re2,si(score),margesi(cc)
    return meilleur



print init
print erreurs(init)
print

premier = trouvermieux(init)
deuxieme = trouvermieux(premier)

print len(ZERO)

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
