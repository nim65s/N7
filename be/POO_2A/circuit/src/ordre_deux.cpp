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
    for (int i(1);i<nmax;i++) {
        u.push_back(u[i-1] + epsilon*u_p[i-1]);
        u_p.push_back(u_p[i-1] + epsilon*u_seconde(i-1));
        //cout << i << ": approchée:\t" << u[i];
        //if (exacte_isknown) cout << "\texacte:\t" << exacte(i);
        //cout << endl;
    }
    cout << endl;
}

float ordre_deux::u_seconde(int const & i) const {
    assert(false);
    return i;
}

void ordre_deux::affiche() const {
    cout << "classe Ordre_deux…" << endl;
    cout << "\tinit_p:\t" << init_p << endl;
    cout << "a la source suivante:" << endl;
    src->affiche();
    cout << "fille de la méthode d’euler suivante:" << endl;
    euler::affiche();
}

// Circuit 3

circuit_trois::circuit_trois(int const & nmax, float const & epsilon, float const & init, float const & init_p, source* src, float const & R, float const & L, float const & C) : ordre_deux(nmax, epsilon, init, init_p, src), R(R), L(L), C(C) {
    exacte_isknown = false;
}

float circuit_trois::u_seconde(int const & i) const {
    return (src->Ve(i*epsilon) - u[i] - R * C * u_p[i]) / (L*C);
}

void circuit_trois::affiche() const {
    cout << "classe Circuit_trois:" << endl;
    cout << "\tR:\t" << R << endl;
    cout << "\tL:\t" << L << endl;
    cout << "\tC:\t" << C << endl;
    cout << "fille de l’ordre deux suivant:" << endl;
    ordre_deux::affiche();
}

// Circuit 4

circuit_quatre::circuit_quatre(int const & nmax, float const & epsilon, float const & init, float const & init_p, source* src, float const & R, float const & L, float const & C) : ordre_deux(nmax, epsilon, init, init_p, src), R(R), L(L), C(C) {
    exacte_isknown = false;
}

float circuit_quatre::u_seconde(int const & i) const {
    return ((src->Ve_p(i*epsilon, epsilon) - u_p[i]) / R - u[i] / L) / C;
}

void circuit_quatre::affiche() const {
    cout << "classe Circuit_quatre:" << endl;
    cout << "\tR:\t" << R << endl;
    cout << "\tL:\t" << L << endl;
    cout << "\tC:\t" << C << endl;
    cout << "fille de l’ordre deux suivant:" << endl;
    ordre_deux::affiche();
}


