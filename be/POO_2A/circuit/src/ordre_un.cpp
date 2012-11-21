#include <iostream>
#include <cstdio>
#include <string>
#include <vector>
#include <math.h>
#include <assert.h>
#include "euler.h"
#include "source.h"
#include "ordre_un.h"

using namespace std;

// Ordre 1

ordre_un::ordre_un(int const & nmax, float const & epsilon, float const & init, source* src) : euler(nmax, epsilon, init), src(src) {}

void ordre_un::affiche() const {
    cout << "classe Ordre_un…" << endl;
    cout << "a la source suivante:" << endl;
    src->affiche();
    cout << "fille de la méthode d’euler suivante:" << endl;
    euler::affiche();
}

// Circuit 1

circuit_un::circuit_un(int const & nmax, float const & epsilon, float const & init, source* src, float const & R, float const & C) : ordre_un(nmax, epsilon, init, src), R(R), C(C) {
    exacte_isknown = false;
}

float circuit_un::u_prime(int const & i) const {
    return (src->Ve(i*epsilon) - u[i]) / (R*C);
}

float circuit_un::exacte(int const & i) const {
    // Cette méthode devrait être pure…
    assert(false);
    return i;
}

void circuit_un::affiche() const {
    cout << "classe Circuit_un:" << endl;
    cout << "\tR:\t" << R << endl;
    cout << "\tC:\t" << C << endl;
    cout << "fille de l’ordre un suivant:" << endl;
    ordre_un::affiche();
}

// Circuit 2

circuit_deux::circuit_deux(int const & nmax, float const & epsilon, float const & init, source* src, float const & R1, float const & R2, float const & C) : ordre_un(nmax, epsilon, init, src), R1(R1), R2(R2), C(C) {
    exacte_isknown = false;
}

float circuit_deux::u_prime(int const & i) const {
    float I(0);
    float Ve(src->Ve(i*epsilon));
    if (Ve - u[i] > 0.6) I = (src->Ve(i*epsilon) - 0.6 - u[i])/R1;
    return (I - u[i]/R2)/C;
}

float circuit_deux::exacte(int const & i) const {
    assert(false);
    return i;
}

void circuit_deux::affiche() const {
    cout << "classe Circuit_deux:" << endl;
    cout << "\tR1:\t" << R1 << endl;
    cout << "\tR2:\t" << R2 << endl;
    cout << "\tC:\t" << C << endl;
    cout << "fille de l’ordre un suivant:" << endl;
    ordre_un::affiche();
}

// vim: set foldmethod=marker:
