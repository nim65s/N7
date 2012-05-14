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
Re1=E(68)
Re2=E(3300)
Rc=E(100)
Rg=5600
Zl=5000

init = CollecteurCommun(Rb1=Rb1,Rb2=Rb2,Rc=Rc,Re1=Re1,Re2=Re2,nom=nom,Rg=Rg,Zl=Zl)

