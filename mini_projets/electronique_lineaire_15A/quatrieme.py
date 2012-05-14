#!/usr/bin/python2
#-*- coding: utf-8 -*-

from cc import *
from mplib import *
from serieeuhdouze import *
import shelve, os.path, sys
from logging import warning, error

# Init
nom='4CC'
Rb1=E(180000)
Rb2=E(150000)
Rc=E(100)
Re=E(3300)
Rg=47000
Zl=5000

init = CollecteurCommun(Rb1=Rb1,Rb2=Rb2,Rc=Rc,Re=Re,nom=nom,Rg=Rg,Zl=Zl)


