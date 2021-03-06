#!/usr/bin/python2
#-*- coding: utf-8 -*-

from mplib import *
from serieeuhdouze import *

class AmplifierProperty(object):
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
            if isinstance(val, minimaxi):
                setattr(obj, self.nom, val)
            else:
                setattr(obj, self.nom, float(val))
            if self.nom[1:-1] in ['Rb1','Rb2','Re1','Re2','Rbp','Rep','Rc']:
                setattr(obj, self.nom[:-1], minimaxi(val*0.9,val*1.1))
            else:
                if isinstance(val, minimaxi):
                    setattr(obj, self.nom[:-1], val)
                else:
                    setattr(obj, self.nom[:-1], float(val))
            print '%s de %s modifié…' % (self.nom.replace('_',''),obj.nom)
            obj.update()
        else:
            error('Vous essayez de modifier %s, qui ne se modifie pas à la main…' % self.nom.replace('_',''))

class AbstractAmplifier(object):
    
    Rb1 = AmplifierProperty('_Rb1i')
    Rb2 = AmplifierProperty('_Rb2i')
    Re1 = AmplifierProperty('_Re1i')
    Re2 = AmplifierProperty('_Re2i')
    Rc = AmplifierProperty('_Rci')
    Ve = AmplifierProperty('_Vei')
    Zl = AmplifierProperty('_Zli')
    Rg = AmplifierProperty('_Rgi')
    b = AmplifierProperty('_bi')
    Rb1e = AmplifierProperty('_Rb1')
    Rb2e = AmplifierProperty('_Rb2')
    Re1e = AmplifierProperty('_Re1')
    Re2e = AmplifierProperty('_Re2')
    Rce = AmplifierProperty('_Rc')
    Vee = AmplifierProperty('_Ve')
    Zle = AmplifierProperty('_Zl')
    Rge = AmplifierProperty('_Rg')
    be = AmplifierProperty('_b')

    def __init__(self,Rb1,Rb2,Rc,Re1,Re2,Rbp=0,Rep=0,Cc=0,Ce=0,nom='',Ve=0,Zl=0,Rg=50):
        # TODO **kwargs
        self.nom = nom
        self._b = minimaxi(400,800)
        if isinstance(Rb1, E):
            self._Rb1 = Rb1.minimaxi
            self._Rb1i = (Rb1.mini+Rb1.maxi)/2
        else:
            self._Rb1 = minimaxi(Rb1*0.9,Rb1*1.1)
            self._Rb1i = Rb1
        if isinstance(Rb2, E):
            self._Rb2 = Rb2.minimaxi 
            self._Rb2i = (Rb2.mini+Rb2.maxi)/2
        else:
            self._Rb2 = minimaxi(Rb2*0.9,Rb2*1.1)
            self._Rb2i = Rb2
        if isinstance(Re1, E):
            self._Re1 = Re1.minimaxi 
            self._Re1i = (Re1.mini+Re1.maxi)/2
        else:
            self._Re1 = minimaxi(Re1*0.9,Re1*1.1)
            self._Re1i = Re1
        if isinstance(Re2, E):
            self._Re2 = Re2.minimaxi 
            self._Re2i = (Re2.mini+Re2.maxi)/2
        else:
            self._Re2 = minimaxi(Re2*0.9,Re2*1.1)
            self._Re2i = Re2
        if isinstance(Rbp, E):
            self._Rbp = Rbp.minimaxi 
            self._Rbpi = (Rbp.mini+Rbp.maxi)/2
        else:
            self._Rbp = minimaxi(Rbp*0.9,Rbp*1.1)
            self._Rbpi = Rbp
        if isinstance(Rep, E):
            self._Rep = Rep.minimaxi 
            self._Repi = (Rep.mini+Rep.maxi)/2
        else:
            self._Rep = minimaxi(Rep*0.9,Rep*1.1)
            self._Repi = Rep
        if isinstance(Rc, E):
            self._Rc = Rc.minimaxi 
            self._Rci = (Rc.mini+Rc.maxi)/2
        else:
            self._Rc = minimaxi(Rc*0.9,Rc*1.1)
            self._Rci = Rc
        if isinstance(Ve, minimaxi):
            self._Ve = Ve
        else:
            self._Ve = minimaxi(Ve)
        if isinstance(Rg, minimaxi):
            self._Rg = Rg
        else:
            self._Rg = minimaxi(Rg)
        self._Cc = float(Cc)
        self._Ce = float(Ce)
        self._Zl = float(Zl)
        for attribu in ['_b','_Cc','_Ce','_Ve','_Zl','_Rg']:
            self.__dict__[attribu + 'i'] = self.__dict__[attribu]

        super(AbstractAmplifier, self).__init__()

    def __str__(self):
        s = '=' * 19 + self.nom + '=' * 19
        for i in self.__dict__:
            if i != 'nom' and self.__dict__[i] != 0 and not i.endswith('i'):
                s += '\n{:^6s}: {:^17s} {:^17s}'.format(i.replace('_',''),si(self.__dict__[i]),si(self.__dict__[i+'i']))
        return s


