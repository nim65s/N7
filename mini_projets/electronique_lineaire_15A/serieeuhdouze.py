#!/usr/bin/python2
#-*- coding: utf-8 -*-

E12 = [10]
v = [12,15,18,22,27,33,39,47,56,68,82,100]
for p in range(5):
    for r in v:
        E12.append(r*10**p)

class E:
    def __init__(self,v=0,n=0):
        if n !=0:
            self.n = n
            self.v = float(E12(n))
        else:
            if not v in E12:
                raise ValueError
            for i in range(len(E12)):
                if v == E12[i]:
                    self.n = i
                    break
            self.v = float(v)

    def __str__(self):
        return 'valeur n°%i:%i' % (self.n,self.v)

    def __float__(self):
        return self.v

    def __iadd__(self,n):
        if n != 1:
            raise ValueError
        return E(n=self.n+1)

    def __isub__(self,n):
        if n != 1:
            raise ValueError
        return E(n=self.n-1)
