#include <iostream>
#include <math.h>

using namespace std;

float squareroot(float n, int lim, bool debug) {{{
    float r=n,s=n;
    int i=0;
    bool continuer=true;
    if (debug) cout << "DEBUG - Calcul de la racine carrée de '" << n << "'." << endl;
    while (continuer){
        if (debug) cout << "DEBUG - \t i='" << i << "', r='" << r << "'." << endl;
        r = (r+n/r)/2;
        if (lim>0) {
            if (++i<lim) continuer=false;
        }
        else {
            if (s-r<pow(10,-6)) continuer=false;
            else s=r;
        }
    }
    return r;
}}}

float squareroot(float n, int lim) {{{
    return squareroot(n, lim, false);
}}}

float squareroot(float n) {{{
    return squareroot(n, -1, false);
}}}

//vim:set foldmethod=marker:
