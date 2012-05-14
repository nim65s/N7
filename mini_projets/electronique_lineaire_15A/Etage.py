#!/usr/bin/python2
#-*- coding: utf-8 -*-

from cc import *
from mplib import *
import shelve, os.path, sys
from logging import warning, error

old_shelve = False

try:
    old = shelve.open(os.path.expanduser('~/N7/mini_projets/electronique_lineaire_15A/shelve.ignore'), writeback=True)
    old_shelve = True
except:
    error('Ratage de l’ouverture du shelve')
    old = {}

def affiche(etage=''):
    """ affiche un étage ou le circuit complet """
    if etage:
        print Ampli[etage]
    else:
        for etage in Ampli:
            affiche(etage)
    print

A1CC = CollecteurCommun(Rb1=56000,Rb2=68000,Rc=100,Re=20000,nom='1CC',Rg=50,Zl=15000)

A4CC = CollecteurCommun(Rb1=180000,Rb2=150000,Rc=100,Re=3300,nom='4CC',Rg=47000,Zl=5000)

Ampli = {}
Ampli['1CC'] = A1CC
Ampli['4CC'] = A4CC

affiche()

A4CC.Rb1 = 330000
A4CC.Rb2 = 220000

Ampli['4CC'] = A4CC
affiche('4CC')


if len(sys.argv) > 1:
    if sys.argv[1] == 'u':
        warning('SHELVE UPDATE')
        old['Ampli'] = Ampli

if old_shelve:
    for i in Ampli:
        if i in old:
            if old[i] == Ampli[i]:
                print '%s: OK' % Ampli[i].nom
            else:
                print '%s: KO' % Ampli[i].nom
        else:
            old[i] = Ampli[i]

if old_shelve:
    old.close()
