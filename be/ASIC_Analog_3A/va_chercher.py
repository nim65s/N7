from __future__ import division

VOULUE = 1.207

def par(a,b,c=0):
    if c:
        return par(par(a,b),c)
    return a*b/(a+b)



def get_rapport(a, b, c, d):
    return min(a, b, c, d) / max(a, b, c, d)


def get_ratio(a, b, c, d):
    ab = a*b/(a+b)
    cd = c*d/(c+d)
    return cd/(ab+cd)

def get_erreur(a, b, c, d):
    return abs(2*get_ratio(a, b, c, d) - VOULUE)

def va_chercher(mini, maxi, erreur_max, rapport_min):
    ok = []
    for a in xrange(mini, maxi):
        print int(100*(a-mini)/(maxi-mini)), '%'
        for b in xrange(a, maxi):
            for c in xrange(mini, maxi):
                for d in xrange(c, maxi):
                    rapport = get_rapport(a, b, c, d)
                    if rapport > rapport_min:
                        erreur = get_erreur(a, b, c, d, VOULUE)
                        if erreur < erreur_max:
                            ok.append((rapport, erreur, a, b, c, d))
    print 'done'
    ok.sort()
    return ok

def finalise(a, b, c, d, I):
    ab = a*b/(a+b)
    cd = c*d/(c+d)

    R = ab + cd
    Rt = 2 / I
    k = Rt / R
    a, b, c, d = round(k*a), round(k*b), round(k*c), round(k*d)

    ab = a*b/(a+b)
    cd = c*d/(c+d)

    print abs((ab+cd)/cd - 2 / VOULUE), min(a, b, c, d) / max(a, b, c, d)
    print a, b, c, d

def f5(a,b,c,d,e,I):
    abc = par(a,b,c)
    de = par(d,e)

    R = abc+de
    Rt = 2/I
    k = Rt/R

    a,b,c,d,e = round(k*a),round(k*b),round(k*c),round(k*d),round(k*e)

    abc = par(a,b,c)
    de = par(d,e)

    print ge5(a,b,c,d,e), gr5(a,b,c,d,e)
    print a,b,c,d,e



def gr3(a,b,c):
    return min(a,b,c) / max(a,b,c)

def gra3(a,b,c):
    #bc = b*c/(b+c)
    #return bc/(a+bc)
    ab = a*b/(a+b)
    return c/(ab+c)

def ge3(a,b,c):
    return abs(2*gra3(a,b,c) - VOULUE)

def v3(mini, maxi, rapport_min, erreur_max):
    ok = []
    for a in xrange(mini, maxi):
        print int(100*(a-mini)/(maxi-mini)), '%'
        for b in xrange(a, maxi):
            for c in xrange(mini, maxi):
                rapport = gr3(a,b,c)
                if rapport > rapport_min:
                    erreur = ge3(a,b,c)
                    if erreur < erreur_max:
                        ok.append((rapport, erreur, a, b, c))
    ok.sort()
    return ok

def gr5(a,b,c,d,e):
    return min(a,b,c,d,e) / max(a,b,c,d,e)

def gra5(a,b,c,d,e):
    abc = a*b*c/(a*b+b*c+a*c)
    de = d*e/(d+e)
    return de/(abc+de)

def ge5(a,b,c,d,e):
    return abs(2*gra5(a,b,c,d,e) - VOULUE)

def v5(mini, maxi, rapport_min, erreur_max):
    ok = []
    for a in xrange(mini, maxi):
        print int(100*(a-mini)/(maxi-mini)), '%'
        for b in xrange(a, maxi):
            for c in xrange(b, maxi):
                for d in xrange(mini, maxi):
                    for e in xrange(d, maxi):
                        r = gr5(a,b,c,d,e)
                        if r > rapport_min:
                            erreur = ge5(a,b,c,d,e)
                            if erreur < erreur_max:
                                ok.append((r, erreur,a,b,c,d,e))
    ok.sort()
    return ok
