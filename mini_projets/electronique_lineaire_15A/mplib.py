#!/usr/bin/python2
#-*- coding: utf-8 -*-

def par(a,b,c=0): 
    if c:
        return par(par(a,b),c)
    else:
        return (a*b)/(a+b)

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
 
class minimaxi:
    def __init__(self,mini,maxi=0):
        if maxi == 0:
            if isinstance(mini, minimaxi):
                self.mini = mini.mini
                self.maxi = mini.maxi
            else:
                self.mini = float(mini)
                self.maxi = float(mini)
        else:
            if isinstance(mini, minimaxi):
                self.mini = mini.mini
                self.maxi = maxi.maxi
            else:
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
            p = (self.mini-a.mini,self.maxi-a.maxi)
            return minimaxi(min(p),max(p))
        return minimaxi(self.mini-float(a),self.maxi-float(a))

    def __rsub__(self,a):
        return -(self - a)

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

    def __abs__(self):
        if self.mini > 0:
            return minimaxi(abs(self.mini),abs(self.maxi))
        return minimaxi(abs(self.maxi),abs(self.mini))

    def contains(self,a):
        if isinstance(a, minimaxi):
            return a.mini >= self.mini and a.maxi <= self.maxi
        return a >= self.mini and  a <= self.maxi

    def __str__(self):
        if self.mini == self.maxi or (self.maxi-self.mini)/self.mini < 0.01:
            return si(self.mini)
        return '%s à %s'%(si(self.mini),si(self.maxi))


