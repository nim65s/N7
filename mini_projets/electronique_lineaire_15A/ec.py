#!/usr/bin/python2
#-*- coding: utf-8 -*-

from aa import *
import math

class EmetteurCommun(AbstractAmplifier):

    Rb = AmplifierProperty('_Rbi', False)
    Re = AmplifierProperty('_Rei', False)
    Eb = AmplifierProperty('_Ebi', False)
    Ic = AmplifierProperty('_Ici', False)
    gm = AmplifierProperty('_gmi', False)
    rb = AmplifierProperty('_rbi', False)
    Ze = AmplifierProperty('_Zei', False)
    Zs = AmplifierProperty('_Zsi', False)
    Ad = AmplifierProperty('_Adi', False)
    DS = AmplifierProperty('_DSi', False)
    Fc = AmplifierProperty('_Fci', False)
    Rbe = AmplifierProperty('_Rb', False)
    Ree = AmplifierProperty('_Re', False)
    Ebe = AmplifierProperty('_Eb', False)
    Ice = AmplifierProperty('_Ic', False)
    gme = AmplifierProperty('_gm', False)
    rbe = AmplifierProperty('_rb', False)
    Zee = AmplifierProperty('_Ze', False)
    Zse = AmplifierProperty('_Zs', False)
    Ade = AmplifierProperty('_Ad', False)
    DSe = AmplifierProperty('_DS', False)
    Fce = AmplifierProperty('_Fc', False)

    def __init__(self,Rb1,Rb2,Rc,Re1,Re2,Rg,Ce,nom='',Ve=0,Zl=5000):
        super(EmetteurCommun, self).__init__(Rb1=Rb1,Rb2=Rb2,Rc=Rc,Re1=Re1,Re2=Re2,Cc=0,Ce=Ce,nom=nom,Ve=Ve,Zl=Zl,Rg=Rg)
        self.update(init=True)

    def update(self, init=False):
        a = {}
        for s in ['','i']:
            a['_Rb'+s] = par(self.__dict__['_Rb1'+s],self.__dict__['_Rb2'+s])
            a['_Re'+s] = self.__dict__['_Re1'+s] + self.__dict__['_Re2'+s]
            a['_Eb'+s] = 12/(1+self.__dict__['_Rb1'+s]/self.__dict__['_Rb2'+s])
            a['_Ic'+s] = (a['_Eb'+s]-0.6)/(a['_Re'+s]+a['_Rb'+s]/self._b)
            a['_gm'+s] = a['_Ic'+s]/0.026
            a['_rb'+s] = self._b/a['_gm'+s]
            a['_Ze'+s] = par(a['_Rb'+s], a['_rb'+s]+self._b*self.__dict__['_Re1'+s])
            a['_r2'+s] = 130/a['_Ic'+s]
            a['_Zs'+s] = par(self.__dict__['_Rc'+s],a['_r2'+s]+self.__dict__['_Re1'+s]*(a['_rb'+s]*(1-a['_gm'+s]*a['_r2'+s])+par(a['_Rb'+s],self._Rg))/(self.__dict__['_Re1'+s]+a['_rb'+s]+par(a['_Rb'+s],self._Rg)))
            a['_Ad'+s] = a['_gm'+s]*par(self.__dict__['_Zl'+s],self.__dict__['_Rc'+s])/(1+self.__dict__['_Re1'+s]*(a['_gm'+s]+1/a['_rb'+s]))
            a['_DS'+s] = 2*a['_Ic'+s]*par(self.__dict__['_Rc'+s],self.__dict__['_Zl'+s])
            a['_Fc'+s] = (1+a['_gm'+s]*self.__dict__['_Re1'+s])/(2*math.pi*self.__dict__['_Re2'+s]*self.__dict__['_Ce'+s])
 
        nouveauxAttributs = ['_Rb','_Re','_Eb','_Ic','_gm','_rb','_Ze','_Zs','_Ad','_DS','_Fc']

        if not init:
            for i in nouveauxAttributs:
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

        for n in nouveauxAttributs:
            self.__dict__[n] = a[n]
            self.__dict__[n+'i'] = a[n+'i']

    def __str__(self):
        s = '=' * 22 + self.nom + '=' * 22
        if self._Ve > 0:
            if self._Ve*self._Ad/self._DS > 0.9:
                s += '\nOuch ça sent la distorsion !'
        if self._Rg/self._Ze > 0.01:
            s += '\n Rg et Ze mal fichus dans %s' % self.nom
        if self._Zs/self._Zl > 0.01:
            s += '\n Zs et Zl mal fichus dans %s' % self.nom
        for i in ['b','Rb1','Rb2','Re1','Re2','Rc','Ce','Ve','Zl','Rb','Re','Eb','Ic','gm','rb','Ze','Zs','Ad','DS','Fc']:
            if self.__dict__['_'+i] != 0:
                s += '\n{:^7s}:  {:^18s}  {:^18s}'.format(i,si(self.__dict__['_'+i+'i']),si(self.__dict__['_'+i]))
        return s

    def __eq__(self, a):
        if not isinstance(a,EmetteurCommun):
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

