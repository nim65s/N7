#!/usr/bin/python2
#-*- coding: utf-8 -*-

from aa import *

class CollecteurCommun(AbstractAmplifier):

    Rb = AmplifierProperty('_Rb', False)
    Re = AmplifierProperty('_Re', False)
    Eb = AmplifierProperty('_Eb', False)
    Ic = AmplifierProperty('_Ic', False)
    gm = AmplifierProperty('_gm', False)
    rb = AmplifierProperty('_rb', False)
    Ze = AmplifierProperty('_Ze', False)
    Zs = AmplifierProperty('_Zs', False)
    Ad = AmplifierProperty('_Ad', False)
    DS = AmplifierProperty('_DS', False)

    def __init__(self,Rb1,Rb2,Rc,Re1,Re2,Cc=0,nom='',Ve=0,Rg=50,Zl=5000):
        super(CollecteurCommun, self).__init__(Rb1=Rb1,Rb2=Rb2,Rc=Rc,Re1=Re1,Re2=Re2,Cc=Cc,Ce=0,nom=nom,Ve=Ve,Zl=Zl,Rg=Rg)
        self.update(init=True)

    def update(self, init=False):
        a = {}
        a['_Rb'] = par(self._Rb1,self._Rb2)
        a['_Re'] = self._Re1+self._Re2
        a['_Eb'] = 12/(1+self._Rb1/self._Rb2)
        a['_Ic'] = (a['_Eb']-0.6)/(a['_Re']+a['_Rb']/self._b)
        a['_gm'] = a['_Ic']/0.026
        a['_rb'] = self._b/a['_gm']
        a['_Ze'] = par(a['_Rb'], a['_rb'] + self._b*(par(a['_Re'],self._Zl)))
        a['_Zs'] = par(self._Re2,(self._Re1+(a['_rb']+par(self._Rg,a['_Rb']))/self._b))
        a['_Ad'] = 1/(1+a['_rb']/(self._b*par(a['_Re'],self._Zl)))
        a['_DS'] = 2*a['_Ic']*par(self._Re2,self._Zl)
 
        if not init:
            for i in ['_Rb','_Re','_Eb','_Ic','_gm','_rb','_Ze','_Zs','_Ad']:
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
        self._Re = a['_Re']
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
        for i in ['b','Rb1','Rb2','Re1','Re2','Rc','Cc','Ve','Rg','Zl','Rb','Re','Eb','Ic','gm','rb','Ze','Zs','Ad','DS']:
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


