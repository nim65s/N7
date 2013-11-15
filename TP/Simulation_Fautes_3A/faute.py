#!/usr/bin/env python2
#-*- coding: utf-8 -*-

from __future__ import print_function, with_statement

import os, re

R = False
W = True

fichier = 'ram.v'


def b(n, s=2):
    """ renvoie un entier qui est la représentation binaire de n, que n soit un int, un bool ou un str """
    if isinstance(n, str):
        return n
    if s == 4:
        return '%04i' % int(bin(int(n))[2:])
    elif s == 1:
        return '%01i' % int(bin(int(n))[2:])
    return '%02i' % int(bin(int(n))[2:])

def test(liste):
    with open(fichier, 'w') as f:
        for rw, addr, data in liste:
            #print('%s\t%s\t%s' % (rw, addr, data))
            if rw:
                if isinstance(data, str):
                    print('`v %s_%s_%s' % (b(rw, 1), b(addr), b(data, 4)), file=f)
                else:
                    print('`v %s_%s_%s' % (b(rw, 1), b(addr), b(data, 4)), file=f)
            else:
                print('`v %s_%s_zzzz' % (b(rw, 1), b(addr)), file=f)
    os.system('./test.sh')
    with open('toto.txt') as f:
        for line in f:
            return line

def check_patterns(patterns):
    liste = []
    for pattern in patterns:
        for i in range(4):
            liste.append((W, i, pattern[i * 4: i * 4 + 4]))
        for i in range(4):
            liste.append((R, i, 'zzzz'))
    return liste

def get_all_the_possibilities():
    liste = []
    for rw in [W, R]:
        for addr in range(4):
            if rw:
                for data in range(16):
                    liste.append((rw, addr, data))
            else:
                liste.append((rw, addr, 'zzzz'))
    return liste

def get_pepino(fichier='ram100.v'):
    w_regex = re.compile(r'^`v 1_(\d\d)_(\d\d\d\d)')
    r_regex = re.compile(r'^`v 0_(\d\d)_zzzz')
    liste = []
    with open(fichier) as f:
        for line in f:
            write = w_regex.search(line)
            read = r_regex.search(line)
            if write:
                write = write.groups()
                liste.append((W, str(write[0]), str(write[1])))
            elif read:
                read = read.groups()
                liste.append((R, str(read[0]), 'zzzz'))
    return liste


def optimize(initial):
    listes = []
    index = 0
    for possibilite in initial:
        liste = initial[:]
        liste.pop(index)
        #print(test(liste))
        ligne = test(liste)
        if ligne and ligne[-2] == '%':
            listes.append((int(ligne[-6:-3]), possibilite, index, liste))
        index += 1
    return listes

def developpe(initial):
    best = max(optimize(initial))
    reussite, enleve, index, liste = best
    listes = []
    for possibilite in get_all_the_possibilities():
        liste_ = liste[:]
        liste_.insert(index, possibilite)
        ligne = test(liste_)
        if ligne and ligne[-2] == '%':
			listes.append((int(ligne[-6:-3]), possibilite, index, liste))
    return listes

#listes = optimize(get_all_the_possibilities())
#print(max(listes))
#print(min(listes))

#listes = optimize(get_pepino())
#print(max(listes))
#print(min(listes))

best = 0
new_best = 1
listes = developpe(get_pepino('minimal.v'))
while new_best > best:
	best = new_best
	ml = max(listes)
	print(ml)
	listes = developpe(ml[3])
	new_best = ml[0]




#test(check_patterns(['0000111100001111', '0101010101010101']))
