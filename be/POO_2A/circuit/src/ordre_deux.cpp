#include <iostream>
#include <cstdio>
#include <string>
#include <vector>
#include <math.h>
#include <assert.h>
#include "euler.h"
#include "source.h"
#include "ordre_deux.h"

using namespace std;

// Ordre 2

ordre_deux::ordre_deux(int const & nmax, float const & epsilon, float const & init, float const & init_p,  source* src) : euler(nmax, epsilon, init), init_p(init_p), src(src) {}

void ordre_deux::main_loop() {
    u.push_back(init);
    u_p.push_back(init_p);
    cout << "Calcul principal…" << endl;
    for (int i(0);i<nmax;i++) {
        u.push_back(u[i-1] + epsilon*u_p[i-1]);
        u_p.push_back(u_p[i-1] + epsilon*u_seconde(i-1));
        cout << i << ": approchée:\t" << u[i];
        if (exacte_isknown) cout << "\texacte:\t" << exacte(i);
        cout << endl;
    }
    cout << endl;
}

float ordre_deux::u_seconde(int const & i) const {
    assert(false);
    return i;
}

// Circuit 3

circuit_trois::circuit_trois(int const & nmax, float const & epsilon, float const & init, source* src, float const & R, float const & L, float const & C) : ordre_deux(nmax, epsilon, init, init_p, src), R(R), L(L), C(C) {
    exacte_isknown = false;
}

float circuit_trois::u_seconde(int const & i) const {
    return (src->Ve(i*epsilon) - u[i] - R * C * u_p[i]) / (L*C);
}
