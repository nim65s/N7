#!/usr/bin/python2
#-*- coding: utf-8 -*-

from mplib import *

E12 = [10]
v = [12,15,18,22,27,33,39,47,56,68,82,100]
for p in range(5):
    for r in v:
        E12.append(r*10**p)

class E:
    def __init__(self,v=0,n=0):
        if n !=0:
            self.n = n
            self.v = float(E12[n])
        else:
            if isinstance(v,minimaxi):
                v = (v.mini+v.maxi)/2
            if not v in E12:
                raise ValueError
            for i in range(len(E12)):
                if v == E12[i]:
                    self.n = i
                    break
            self.v = float(v)
        self.s=si(self.v)
        self.minimaxi = minimaxi(self.v*0.9,self.v*1.1)
        self.mini = self.v*0.9
        self.maxi = self.v*1.1

    def __str__(self):
        return 'valeur n°%i:%i' % (self.n,self.v)

    def __float__(self):
        return self.v

    def __add__(self,n):
        if self.n in [0, len(E12)-1]:
            return self
        return E(n=self.n+n)

    def __sub__(self,n):
        if self.n in [0, len(E12)-1]:
            return self
        return E(n=self.n-n)
