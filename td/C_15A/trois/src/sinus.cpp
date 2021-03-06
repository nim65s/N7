#include <iostream>
#include <math.h>

using namespace std;

float sinus(float x, bool debug) {{{
    int n=0;
    float v= - (x*x)/((2*n+3)*(2*n+2))*x;
    float s=x;
    if (debug) cout << "DEBUG - calcul du sinus de " << x << endl;
    while (fabs(v) > pow(10,-6)) {
        if (debug) cout << "DEBUG - v_" << n << " = " << v << endl;
        if (debug) cout << "DEBUG - s_" << n << " = " << s << endl;
        n++;
        s += v;
        v = - (x*x)/((2*n+3)*(2*n+2))*v;
    }
    return s;
}}}

float sinus(float x) {{{
    return sinus(x, false);
}}}

//vim:set foldmethod=marker:
