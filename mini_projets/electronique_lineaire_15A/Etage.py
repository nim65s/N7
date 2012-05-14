#!/usr/bin/python2
#-*- coding: utf-8 -*-

import shelve, os.path, sys
from mplib import *
from logging import warning, error

old_shelve = False

try:
    old = shelve.open(os.path.expanduser('~/N7/mini_projets/electronique_lineaire_15A/shelve.ignore'), writeback=True)
    old_shelve = True
except:
    error('Ratage de l’ouverture du shelve')
    old = {}

class AmplifierProperty(object):
    """ Classe remplançant la fonction buildin «property»,
    histoire d’éviter la duplication de code.
    Entièrement copié collé de http://stackoverflow.com/questions/1380566/can-i-add-parameters-to-a-python-property-to-reduce-code-duplication """
    def __init__(self, nom, modifiable=True):
        self.nom = nom
        self.modifiable = modifiable

    def __get__(self, obj, objtype):
        return getattr(obj, self.nom)

    def __set__(self, obj, val):
        if self.modifiable:
            setattr(obj, self.nom, float(val))
            obj.update()
        else:
            error('Vous essayez de modifier %s, qui ne se modifie pas à la main…' % self.nom.replace('_',''))

class AbstractAmplifier(object):
    
    Rb1 = AmplifierProperty('_Rb1')
    Rb2 = AmplifierProperty('_Rb2')
    Rc = AmplifierProperty('_Rc')
    Re = AmplifierProperty('_Re')
    Ve = AmplifierProperty('_Ve')
    Zl = AmplifierProperty('_Zl')
    Rg = AmplifierProperty('_Rg')
    b = AmplifierProperty('_b')

    def __init__(self,Rb1,Rb2,Rc,Re,Cc=0,Ce=0,nom='',Ve=0,Zl=0,Rg=50):
        self.nom = nom
        self._b = minimaxi(400,800)
        self._Rb1 = float(Rb1)
        self._Rb2 = float(Rb2)
        self._Rc = float(Rc)
        self._Re = float(Re)
        self._Cc = float(Cc)
        self._Ve = float(Ve)
        self._Zl = float(Zl)
        self._Rg = float(Rg)
        super(AbstractAmplifier, self).__init__()

    def __str__(self):
        s = '=' * 10 + self.nom + '=' * 10
        for i in self.__dict__:
            if i != 'nom' and self.__dict__[i] != 0:
                s += '\n{:^6s}: {:^17s}'.format(i.replace('_',''),si(self.__dict__[i]))
        return s

class CollecteurCommun(AbstractAmplifier):

    Rb = AmplifierProperty('_Rb', False)
    Eb = AmplifierProperty('_Eb', False)
    Ic = AmplifierProperty('_Ic', False)
    gm = AmplifierProperty('_gm', False)
    rb = AmplifierProperty('_rb', False)
    Ze = AmplifierProperty('_Ze', False)
    Zs = AmplifierProperty('_Zs', False)
    Ad = AmplifierProperty('_Ad', False)
    DS = AmplifierProperty('_DS', False)

    def __init__(self,Rb1,Rb2,Rc,Re,Cc=0,nom='',Ve=0,Rg=50,Zl=5000):
        super(CollecteurCommun, self).__init__(Rb1=Rb1,Rb2=Rb2,Rc=Rc,Re=Re,Cc=Cc,Ce=0,nom=nom,Ve=Ve,Zl=Zl,Rg=Rg)
        self.update(init=True)

    def update(self, init=False):
        a = {}
        a['_Rb'] = par(self._Rb1,self._Rb2)
        a['_Eb'] = 12/(1+self._Rb1/self._Rb2)
        a['_Ic'] = (a['_Eb']-0.6)/(self._Re+a['_Rb']/self._b)
        a['_gm'] = a['_Ic']/0.026
        a['_rb'] = self._b/a['_gm']
        a['_Ze'] = par(a['_Rb'], a['_rb'] + self._b*(par(self._Re,self._Zl)))
        a['_Zs'] = par(self._Re,((a['_rb']+par(self._Rg,a['_Rb']))/self._b))
        a['_Ad'] = 1/(1+a['_rb']/(self._b*par(self._Re,self._Zl)))
        a['_DS'] = 2*a['_Ic']*par(self._Re,self._Zl)
 
        if not init:
            for i in ['_Rb','_Eb','_Ic','_gm','_rb','_Ze','_Zs','_Ad']:
                if self.__dict__[i] != a[i]:
                    diff = abs(self.__dict__[i] - a[i])
                    pourcentage = 100*diff/self.__dict__[i]
                    action = 'augmenté'
                    if self.__dict__[i] > a[i]:
                        action = 'diminué'
                    if isinstance(diff,minimaxi): # ouch caymoche !
                        print '%s: %s a %s de %s (%s %%)' % (self.nom, i.replace('_',''), action, diff, pourcentage)
                    else:
                        print '%s: %s a %s de %.2f (%.2f %%)' % (self.nom, i.replace('_',''), action, diff, pourcentage)

        self._Rb = a['_Rb']
        self._Eb = a['_Eb']
        self._Ic = a['_Ic']
        self._gm = a['_gm']
        self._rb = a['_rb']
        self._Ze = a['_Ze']
        self._Zs = a['_Zs']
        self._Ad = a['_Ad']
        self._DS = a['_DS']

    def __str__(self):
        s = '=' * 10 + self.nom + '=' * 10
        if self._Rg == 0:
            s += '\nApproximation de Rg=0 dans le calcul de Zs de %s' % self.nom
        if self._Ve > 0:
            if self._Ve*self._Ad/self._DS > 0.9:
                s += '\nOuch ça sent la distorsion !'
        for i in ['b','Rb1','Rb2','Re','Rc','Cc','Ve','Rg','Zl','Rb','Eb','Ic','gm','rb','Ze','Zs','Ad','DS']:
            if self.__dict__['_'+i] != 0:
                s += '\n{:^6s}: {:^17s}'.format(i,si(self.__dict__['_'+i]))
        return s

    def __eq__(self, a):
        if not isinstance(a,CollecteurCommun):
            return False
        for i in self.__dict__:
            if i != 'nom' and not self.__dict__[i] == a.__dict__[i]:
                return False
        return True

    def __req__(self, a):
        return self == a

    def __neq__(self, a):
        return not self == a

    def __rneq__(self, a):
        return not self == a

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
