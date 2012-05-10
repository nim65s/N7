#!/usr/bin/python2
#-*- coding: utf-8 -*-

import shelve, os.path
from logging import warning, error

old_shelve = False

try:
    old = shelve.open(os.path.expanduser('~/.js_shelve'), writeback=True)
    old_shelve = True
except:
    error('Ratage de l’ouverture du shelve')
    old = {}


def par(a,b): return (a*b)/(a+b)

kSI = ' kMGT'
mSI = 'munp'
def si(a):
    if isinstance(a,str):
        return a
    if isinstance(a,minimaxi):
        return str(a)
    if a == 0 or abs(a) > 0.9 and abs(a) < 1.1:
        return '%.2f' % a
    if abs(a) > 1:
        for i in range(len(kSI)):
            if abs(a) < 1000:
                break
            a /= 1000
        if i==0:
            return '%.2f' % a
        else:
            return '%.2f%s' % (a, kSI[i])
    else:
        for i in range(len(mSI)):
            a *= 1000
            if abs(a) > 0.1:
                break
        return '%.2f%s' % (a, mSI[i])
     
def testsi():
    for i in range(-12,+12):
        print 0.9*10**i, si(0.9*10**i)
        print 10**i, si(10**i)
        print 1.1*10**i, si(1.1*10**i)
 
class AmplifierProperty(object):
    """ Classe remplançant la fonction buildin «property»,
    histoire d’éviter la duplication de code.
    Entièrement copié collé de http://stackoverflow.com/questions/1380566/can-i-add-parameters-to-a-python-property-to-reduce-code-duplication """
    def __init__(self, name):
        self.name = name

    def __get__(self, obj, objtype):
        return getattr(obj, self.name)

    def __set__(self, obj, val):
        setattr(obj, self.name, float(val))
        obj.update()

class minimaxi:
    def __init__(self,mini,maxi):
        self.mini = float(mini)
        self.maxi = float(maxi)

    def __eq__(self,a):
        if isinstance(a,minimaxi):
            return a.mini == self.mini and a.maxi == self.maxi
        return a >= self.mini and a <= self.maxi

    def __req__(self,a):
        return self == a
    
    def __ne__(self,a):
        return not self == a

    def __rne__(self,a):
        return self != a

    def __gt__(self,a):
        if isinstance(a,minimaxi):
            return self.mini > a.mini and self.maxi > a.maxi
        return self.mini > a

    def __rgt__(self,a):
        return self <= a

    def __lt__(self,a):
        if isinstance(a,minimaxi):
            return self.mini < a.mini and self.maxi < a.maxi
        return self.maxi < a

    def __rlt__(self,a):
        return self >= a

    def __ge__(self,a):
        return self == a or self > a

    def __rge__(self,a):
        return self < a

    def __le__(self,a):
        return self == a or self < a

    def __rle__(self,a):
        return self > a

    def __neg__(self):
        return minimaxi(-self.maxi, -self.mini)

    def __add__(self,a):
        if isinstance(a,minimaxi):
            return minimaxi(self.mini+a.mini,self.maxi+a.maxi)
        return minimaxi(self.mini+float(a),self.maxi+float(a))

    def __radd__(self,a):
        return self.__add__(float(a))

    def __iadd__(self,a):
        return self + a

    def __sub__(self,a):
        if isinstance(a,minimaxi):
            return minimaxi(self.mini+a.mini,self.maxi+a.maxi)
        return minimaxi(self.mini-float(a),self.maxi-float(a))

    def __rsub__(self,a):
        return self.__sub__(float(a))

    def __isub__(self,a):
        return self - a

    def __mul__(self,a):
        p = ''
        if isinstance(a,minimaxi):
            p = (
                    self.mini*a.mini,
                    self.mini*a.maxi,
                    self.maxi*a.mini,
                    self.maxi*a.maxi)
        else:
            p = ( self.mini*float(a), self.maxi*float(a))
        return minimaxi(min(p),max(p))

    def __rmul__(self,a):
        return self.__mul__(float(a))

    def __imul__(self,a):
        return self * a

    def __div__(self,a):
        p = ''
        if isinstance(a,minimaxi):
            p = (
                    self.mini/a.mini,
                    self.mini/a.maxi,
                    self.maxi/a.mini,
                    self.maxi/a.maxi)
        else:
            p = (self.mini/float(a), self.maxi/float(a))
        return minimaxi(min(p),max(p))

    def __rdiv__(self,a):
        p = ''
        if isinstance(a,minimaxi):
            p = (
                    a.mini/self.mini,
                    a.mini/self.maxi,
                    a.maxi/self.mini,
                    a.maxi/self.maxi)
        else:
            p = (float(a)/self.mini, float(a)/self.maxi)
        return minimaxi(min(p),max(p))


    def __idiv__(self,a):
        return self/a

    def __invert__(self):
        return minimaxi(1/self.maxi,1/self.mini)

    def __repr__(self):
        if self.mini == self.maxi or (self.maxi-self.mini)/self.mini < 0.01:
            return si(self.mini)
        return '%s à %s'%(si(self.mini),si(self.maxi))

class AbstractAmplifier(object):
    def __init__(self,Rb1,Rb2,Rc,Re,Cc=0,Ce=0,nom='',ve=0):
        b = minimaxi(400,800)

        self.nom = nom
        self._Rb1 = Rb1
        self._Rb2 = Rb2
        self._Rc = Rc
        self._Re = Re
        self._Cc = Cc
        self._b = b
        self._ve = ve
        super(AbstractAmplifier, self).__init__()

    def __repr__(self):
        s = '=' * 10 + self.nom + '=' * 10
        for i in self.__dict__:
            if i != 'nom' and self.__dict__[i] != 0:
                s += '\n{:^6s}: {:^17s}'.format(i.replace('_',''),si(self.__dict__[i]))
        return s

class CollecteurCommun(AbstractAmplifier):
    def __init__(self,Rb1,Rb2,Rc,Re,Cc=0,nom='',ve=0):
        super(CollecteurCommun, self).__init__(Rb1,Rb2,Rc,Re,Cc,0,nom,ve)
        self.update()

    def update(self):
        Rb = par(self._Rb1,self._Rb2)
        Eth = 12/(1+self._Rb1/self._Rb2)
        Ic = (Eth-0.6)/(self._Re+Rb/self._b)
        gm = Ic/0.026
        rb = self._b/gm

        self._Rb = Rb
        self._Eth = Eth
        self._Ic = Ic
        self._gm = gm
        self._rb = rb
        print 'update done'

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
        if self._ve > 0:
            if self._ve*self.Ad(zl)/DS > 0.9:
                error('Ouch ça sent la distorsion !')
                print '{:^6s}: {:^17s}'.format('Ve', si(self._ve))
                print '{:^6s}: {:^17s}'.format('Ad', si(self._Ad(zl)))
                print '{:^6s}: {:^17s}'.format('DS', si(DS))
        return DS

    def __eq__(self, a):
        if not isinstance(a,CollecteurCommun):
            return False
        for i in self.__dict__:
            if i != 'nom' and not self.__dict__[i] == a.__dict__[i]:
                return False
        return True

    def __req__(self,a):
        return self == a

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

if old_shelve:
    if 'CC1' in old:
        if old['CC1'] == CC1:
            print 'OK'
        else:
            print 'KO'
    else:
        old['CC1'] = CC1
    if 'CC4' in old:
        if old['CC4'] == CC4:
            print 'OK'
        else:
            print 'KO'
    else:
        old['CC4'] = CC4
