#!/usr/bin/python2
#-*- coding: utf-8 -*-

from mplib import *

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
            print '%s de %s modifié…' % (self.nom.replace('_',''),obj.nom)
            obj.update()
        else:
            error('Vous essayez de modifier %s, qui ne se modifie pas à la main…' % self.nom.replace('_',''))

class AbstractAmplifier(object):
    
    Rb1 = AmplifierProperty('_Rb1')
    Rb2 = AmplifierProperty('_Rb2')
    Re1 = AmplifierProperty('_Re1')
    Re2 = AmplifierProperty('_Re2')
    Rc = AmplifierProperty('_Rc')
    Ve = AmplifierProperty('_Ve')
    Zl = AmplifierProperty('_Zl')
    Rg = AmplifierProperty('_Rg')
    b = AmplifierProperty('_b')

    def __init__(self,Rb1,Rb2,Rc,Re1,Re2,Cc=0,Ce=0,nom='',Ve=0,Zl=0,Rg=50):
        self.nom = nom
        self._b = minimaxi(400,800)
        self._Rb1 = float(Rb1)
        self._Rb2 = float(Rb2)
        self._Re1 = float(Re1)
        self._Re2 = float(Re2)
        self._Rc = float(Rc)
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


