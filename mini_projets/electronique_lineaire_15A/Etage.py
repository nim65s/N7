#!/usr/bin/python2
#-*- coding: utf-8 -*-

class minimaxi:
    def __init__(self,mini,maxi):
        self.mini = float(mini)
        self.maxi = float(maxi)

    def __eq__(self,a):
        return isinstance(a,minimaxi) and a.mini == self.mini and a.maxi == self.maxi

    def __add__(self,a):
        return minimaxi(self.mini+a.mini,self.maxi+a.maxi)

    def __sub__(self,a):
        return minimaxi(self.mini-a.mini,self.maxi-a.maxi)

    def __mul__(self,a):
        p = (
                self.mini*a.mini,
                self.mini*a.maxi,
                self.maxi*a.mini,
                self.maxi*a.maxi)
        return minimaxi(min(p),max(p))

    def __div__(self,a):
        p = (
                self.mini/a.mini,
                self.mini/a.maxi,
                self.maxi/a.mini,
                self.maxi/a.maxi)
        return minimaxi(min(p),max(p))

    def __invert__(self):
        return minimaxi(1/self.maxi,1/self.mini)

    def __repr__(self):
        if self.mini == self.maxi:
            return str(self.mini)
        return 'entre %s et %s'%(self.mini,self.maxi)


class CollecteurCommun:
    def __init__(self,Rb1,Rb2,Rc,Re,Cc=0):
        b = minimaxi(400,800)
        Rb1 = minimaxi(Rb1,Rb1)
        Rb2 = minimaxi(Rb2,Rb2)
        Rc = minimaxi(Rc,Rc)
        Re = minimaxi(Re,Re)
        Vcc = minimaxi(12,12)
        Vbe = minimaxi(0.6,0.6)
        Ut = minimaxi(0.026,0.026)
        un = minimaxi(1,1)

        Rb = (Rb1+Rb2)/(Rb1*Rb2)
        Eth = Vcc/(un+Rb1/Rb2)
        #self.Ic = ((self.Eth-0.6)/(Re+self.Rb/400),(self.Eth-0.6)/(Re+self.Rb/800)) #(min,max)
        Ic = (Eth-Vbe)/(Re+Rb/b)
        gm = Ic/Ut
        rb = b/gm

        self.b = {}
        self.b['Rb1'] = Rb1
        self.b['Rb2'] = Rb2
        self.b['Rc'] = Rc
        self.b['Re'] = Re
        self.b['Cc'] = Cc
        self.b['b'] = b
        self.b['Rb'] = Rb
        self.b['Eth'] = Eth
        self.b['Ic'] = Ic
        self.b['gm'] = gm
        self.b['rb'] = rb
        self.b['Cc'] = Cc

    def __repr__(self):
        s = ''
        for i in self.b:
            s += '%s: %s\n' %(i,self.b[i])
        return s

CC1 = CollecteurCommun(56000,68000,100,20000)
CC4 = CollecteurCommun(54500,66500,100,4700)
print CC1
print CC4
