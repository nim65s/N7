#!/usr/bin/python2
#-*- coding: utf-8 -*-

from logging import warning

def par(a,b): return (a*b)/(a+b)

kSI = ' kMGT'
mSI = 'munp'
def si(a):
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
        self.Rb1 = Rb1
        self.Rb2 = Rb2
        self.Rc = Rc
        self.Re = Re
        self.Cc = Cc
        self.b = b
        self.ve = ve
        super(AbstractAmplifier, self).__init__()

    def __repr__(self):
        s = '=' * 10 + self.nom + '=' * 10
        for i in self.__dict__:
            if i != 'nom' and self.__dict__[i] != 0:
                s += '\n{:^6s}: {:^17s}'.format(i,si(self.__dict__[i]))
        return s

class CollecteurCommun(AbstractAmplifier):
    def __init__(self,Rb1,Rb2,Rc,Re,Cc=0,nom='',ve=0):
        super(CollecteurCommun, self).__init__(Rb1,Rb2,Rc,Re,Cc,0,nom,ve)
        b = self.b
        Rb = par(Rb1,Rb2)
        Eth = 12/(1+Rb1/Rb2)
        Ic = (Eth-0.6)/(Re+Rb/b)
        gm = Ic/0.026
        rb = b/gm

        self.Rb = Rb
        self.Eth = Eth
        self.Ic = Ic
        self.gm = gm
        self.rb = rb

    def Ze(self,zl):
        return par(self.Rb, self.rb + self.b*(par(self.Re,zl)))

    def Zs(self,Rg=0):
        if Rg == 0:
            warning('Approximation de Rg=0 dans le calcul de Zs de %s' % self.nom)
        return par(self.Re,(self.rb+par(Rg,self.Rb))/self.b)

    def gain(self,zl):
        return 1/(1+self.rb/(self.b*par(self.Re,zl)))

    def dds(self,zl):
        dds = 2*self.Ic*par(self.Re,zl)
        if self.ve > 0:
            if self.ve*self.gain(zl)/self.dds > 0.9:
                error('Ouch ça sent la distorsion !')
                print '{:^6s}: {:^17s}'.format('Ve', si(self.ve))
                print '{:^6s}: {:^17s}'.format('gain', si(self.gain(zl)))
                print '{:^6s}: {:^17s}'.format('dds', si(self.dds))
        return dds

CC1 = CollecteurCommun(56000.0,68000.0,100.0,20000.0,nom='CC1')
CC4 = CollecteurCommun(54500.0,66500.0,100.0,4700.0,nom='CC4')
print CC1
print '{:^6s}: {:^17s}'.format('Ze', si(CC4.Ze(15000)))
print '{:^6s}: {:^17s}'.format('Zs', si(CC4.Zs(50)))
print '{:^6s}: {:^17s}'.format('gain', si(CC4.gain(15000)))
print '{:^6s}: {:^17s}'.format('dds', si(CC4.dds(15000)))
print
print CC4
print '{:^6s}: {:^17s}'.format('Ze', si(CC4.Ze(5000)))
print '{:^6s}: {:^17s}'.format('Zs', si(CC4.Zs(2690)))
print '{:^6s}: {:^17s}'.format('gain', si(CC4.gain(5000)))
print '{:^6s}: {:^17s}'.format('dds', si(CC4.dds(5000)))
print

