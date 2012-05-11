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
    Rb2 = AmplifierProperty('_Rb1')
    Rc = AmplifierProperty('_Rc')
    Re = AmplifierProperty('_Re')
    b = AmplifierProperty('_b')
    Ve = AmplifierProperty('_Ve')

    def __init__(self,Rb1,Rb2,Rc,Re,Cc=0,Ce=0,nom='',Ve=0):
        b = minimaxi(400,800)

        self.nom = nom
        self._Rb1 = Rb1
        self._Rb2 = Rb2
        self._Rc = Rc
        self._Re = Re
        self._Cc = Cc
        self._b = b
        self._Ve = Ve
        super(AbstractAmplifier, self).__init__()

    def __repr__(self):
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

    def __init__(self,Rb1,Rb2,Rc,Re,Cc=0,nom='',Ve=0):
        super(CollecteurCommun, self).__init__(Rb1,Rb2,Rc,Re,Cc,0,nom,Ve)
        self.update(init=True)

    def update(self, init=False):
        a = {}
        a['_Rb'] = par(self._Rb1,self._Rb2)
        a['_Eb'] = 12/(1+self._Rb1/self._Rb2)
        a['_Ic'] = (a['_Eb']-0.6)/(self._Re+a['_Rb']/self._b)
        a['_gm'] = a['_Ic']/0.026
        a['_rb'] = self._b/a['_gm']

        if not init:
            for i in ['_Rb','_Eb','_Ic','_gm','_rb']:
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
            print 'update done'
        self._Rb = a['_Rb']
        self._Eb = a['_Eb']
        self._Ic = a['_Ic']
        self._gm = a['_gm']
        self._rb = a['_rb']

    def Ze(self,zl):
        """ Impédance d’entrée"""
        return par(self._Rb, self._rb + self._b*(par(self._Re,zl)))

    def Zs(self,Rg=0):
        """ Impédance de sortie"""
        if Rg == 0:
            warning('Approximation de Rg=0 dans le calcul de Zs de %s' % self.nom)
        return par(self._Re,(self._rb+par(Rg,self._Rb))/self._b)

    def Ad(self,zl):
        """ Gain """
        return 1/(1+self._rb/(self._b*par(self._Re,zl)))

    def DS(self,zl):
        """ Dynamique de sortie """
        DS = 2*self._Ic*par(self._Re,zl)
        if self._Ve > 0:
            if self._Ve*self.Ad(zl)/DS > 0.9:
                error('Ouch ça sent la distorsion !')
                print '{:^6s}: {:^17s}'.format('Ve', si(self._Ve))
                print '{:^6s}: {:^17s}'.format('Ad', si(self.Ad(zl)))
                print '{:^6s}: {:^17s}'.format('DS', si(DS))
        return DS

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

def affiche(etage):
    """ affiche un étage """
    print etage['o']
    for i in ['Ze','Zs','Ad','DS']:
        print '{:^6s}: {:^17s}'.format(i, si(etage[i]))
    print

CC1 = {}
CC1['o'] = CollecteurCommun(56000.0,68000.0,100.0,20000.0,nom='CC1')
CC1['Ze'] = CC1['o'].Ze(15000)
CC1['Zs'] = CC1['o'].Zs(50)
CC1['Ad'] = CC1['o'].Ad(15000)
CC1['DS'] = CC1['o'].DS(15000)

CC4 = {}
CC4['o'] = CollecteurCommun(54500.0,66500.0,100.0,4700.0,nom='CC4')
CC4['Ze'] = CC4['o'].Ze(5000)
CC4['Zs'] = CC4['o'].Zs(2690)
CC4['Ad'] = CC4['o'].Ad(5000)
CC4['DS'] = CC4['o'].DS(5000)

affiche(CC1)
affiche(CC4)

CC1['o'].Rb1 = 55000
affiche(CC1)

if len(sys.argv) > 1:
    if sys.argv[1] == 'u':
        warning('SHELVE UPDATE')
        old['CC1'] = CC1
        old['CC4'] = CC4

if old_shelve:
    if 'CC1' in old:
        if old['CC1'] == CC1:
            print 'CC1: OK'
        else:
            print 'CC1: KO'
    else:
        old['CC1'] = CC1
    if 'CC4' in old:
        if old['CC4'] == CC4:
            print 'CC2: OK'
        else:
            print 'CC2: KO'
    else:
        old['CC4'] = CC4

if old_shelve:
    old.close()
