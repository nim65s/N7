#!/usr/bin/python2
#-*- coding: utf-8 -*-

from aa import *
from mplib import *
from serieeuhdouze import *

class ConnectProperty(object):
    """ Classe remplançant la fonction buildin «property», histoire d’éviter la duplication de code.
    Entièrement copié collé de 
    http://stackoverflow.com/questions/1380566/can-i-add-parameters-to-a-python-property-to-reduce-code-duplication """
    def __init__(self, nom, modifiable=True):
        self.nom = nom
        if nom.endswith('i'):
            self.modifiable = modifiable
        else:
            self.modifiable = False

    def __get__(self, obj, objtype):
        return getattr(obj, self.nom)

    def __set__(self, obj, val):
        if self.modifiable:
            setattr(obj, self.nom, float(val))
            setattr(obj, self.nom[:-1], float(val))
            print 'Connect: %s de %s modifié…' % (self.nom.replace('_',''),obj.nom)
            obj.update()
        else:
            error('Vous essayez de modifier %s, qui ne se modifie pas à la main…' % self.nom.replace('_',''))


class Connect():
    e = ConnectProperty('_e')
    Rg = ConnectProperty('_Rg')
    C1 = ConnectProperty('_C1')
    a1 = ConnectProperty('_a1')
    C2 = ConnectProperty('_C2')
    a2 = ConnectProperty('_a2')
    C3 = ConnectProperty('_C3')
    Zl = ConnectProperty('_Zl')

    def __init__(self,e,Rg,C1,a1,C2,a2,C3,Zl,nom):
        self._e = e
        self._Rg = Rg
        self._C1 = C1
        self._a1 = a1
        self._C2 = C2
        self._a2 = a2
        self._C3 = C3
        self._Zl = Zl
        self.nom = nom
        self.update()

    def update(self):
        a1Zl = self.a2.Ze
        a2Ze = self.a1.Zs
        self.a1.Rg = self.Rg
        self.a1.Ve = self.e
        self.a2.Zl = self.Zl
        if a1Zl == self.a2.Ze:
            print '1match1'
        if a2Ze == self.a1.Zs:
            print '1match2'
        a1Zl = self.a2.Ze
        a2Ze = self.a1.Zs
        if a1Zl == self.a2.Ze:
            print '2match1'
        if a2Ze == self.a1.Zs:
            print '2match2'
