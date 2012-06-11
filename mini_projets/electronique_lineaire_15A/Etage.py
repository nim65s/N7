#!/usr/bin/python2
#-*- coding: utf-8 -*-

from cc import *
from ec import *
from ad import *
from mplib import *
from serieeuhdouze import *
import shelve, os.path, sys
from logging import warning, error

#old_shelve = False

#try:
    #old = shelve.open(os.path.expanduser('~/N7/mini_projets/electronique_lineaire_15A/shelve.ignore'), writeback=True)
    #old_shelve = True
#except:
    #error('Ratage de l’ouverture du shelve')
    #old = {}

#def affiche(etage=''):
    #""" affiche un étage ou le circuit complet """
    #if etage:
        #print Ampli[etage]
    #else:
        #for etage in Ampli:
            #affiche(etage)
    #print

e = 0.006
Rg = 50
Zl = 5000
C=0.000001

jeu = {}
jeu['A1Rb1'] = E(560000)
jeu['A1Rb2'] = E(1000000)
jeu['A1Re1'] = E(27)
jeu['A1Re2'] = E(15)
jeu['A2Rb1'] = E(47000)
jeu['A2Rb2'] = E(47000)
jeu['A2Re1'] = E(5600)
jeu['A2Re2'] = E(10)
jeu['A3Rb1'] = E(10000)
jeu['A3Rb2'] = E(2200)
jeu['A4Rb1'] = E(47000)
jeu['A4Rb2'] = E(560000)
jeu['A4Re1'] = E(100)
jeu['A4Re2'] = E(820)
jeu['A2Rc']  = E(33000)
jeu['A3Rc']  = E(2200)
jeu['A3Re']  = E(330)

A1 = CollecteurCommun(Rb1=jeu['A1Rb1'],Rb2=jeu['A1Rb2'],Rc=100,Re1=jeu['A1Re1'],Re2=jeu['A1Re2'],nom='1:CC',Rg=Rg,Zl=1,Ve=e)
A2 = EmetteurCommun(Rb1=jeu['A2Rb1'],Rb2=jeu['A2Rb2'],Rc=jeu['A2Rc'],Re1=jeu['A2Re1'],Re2=jeu['A2Re2'],Rg=A1.Zs,Ce=C,nom='2:EC',Ve=A1.Ve*A1.Ad,Zl=1)
A3 = AmplificateurDifferentiel(Rb1=jeu['A3Rb1'],Rb2=jeu['A3Rb2'],Rc=jeu['A3Rc'],Re=jeu['A3Re'],Cc=C,nom='3:AD',Ve=A2.Ve*A2.Ad,Rg=A2.Zs,Zl=1)
A4 = CollecteurCommun(Rb1=jeu['A4Rb1'],Rb2=jeu['A4Rb2'],Rc=100,Re1=jeu['A4Re1'],Re2=jeu['A4Re2'],nom='4:CC',Rg=A3.Zs,Ve=A3.Ve*A3.Ad,Zl=5000)

print
print

print A1
print A2
print A3
print A4
print A4.Ve*A4.Ad

A1.Zl = A2.Ze
A2.Rg = A1.Zs
A2.Ve = A1.Ve*A1.Ad
A2.Zl = A3.Ze
A3.Rg = A2.Zs
A3.Ve = A2.Ve*A2.Ad
A3.Zl = A4.Ze
A4.Rg = A3.Zs
A4.Ve = A3.Ve*A3.Ad

print A1
print A2
print A3
print A4
print A4.Ve*A4.Ad


#Ampli = {}
#Ampli['1CC'] = A1
#Ampli['2EC'] = A2
#Ampli['4CC'] = A4

#affiche()

#A4.Rb1 = 330000
#A4.Rb2 = 220000
#A4.Rg = 5600
#Ampli['4CC'] = A4
#affiche('4CC')

#A4.Re1=68
#Ampli['4CC'] = A4
#affiche('4CC')


#if len(sys.argv) > 1:
    #if sys.argv[1] == 'u':
        #warning('SHELVE UPDATE')
        #old['Ampli'] = Ampli

#if old_shelve:
    #for i in Ampli:
        #if i in old:
            #if old[i] == Ampli[i]:
                #print '%s: OK' % Ampli[i].nom
            #else:
                #print '%s: KO' % Ampli[i].nom
        #else:
            #old[i] = Ampli[i]

#if old_shelve:
    #old.close()
