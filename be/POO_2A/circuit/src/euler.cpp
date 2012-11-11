#include <iostream>
#include <cstdio>
#include <string>
#include <vector>
#include <math.h>
#include <assert.h>
#include "euler.h"
#include "source.h"

using namespace std;

// Euler

euler::euler(int const & nmax, float const & epsilon, float const & init): nmax(nmax), epsilon(epsilon), init(init) {
    exacte_isknown = false;
}

float euler::u_prime(int const & i) const {
    if (i == 0) return init;
    return (u[i + 1] - u[i]) / epsilon;
}

float euler::exacte(int const & i) const {
    // Cette méthode devrait être pure…
    assert(false);
    return i;
}

void euler::main_loop() {
    u.push_back(init);
    for (int i(0);i<nmax;i++) {
        u.push_back(u[i] + epsilon*u_prime(i));
        cout << endl << "approchée:\t" << u[i] + epsilon*u_prime(i);
        if (exacte_isknown) cout << "\texacte:\t" << exacte(i);
    }
    cout << endl;
}

void euler::affiche() const {
    cout << "classe Euler:" << endl;
    cout << "\tnmax:\t" << nmax << endl;
    cout << "\tepsilon:\t" << epsilon << endl;
    cout << "\tinit:\t" << init << endl;
    cout << "\ti\tu:" << endl;
    for (int i(1);i<nmax;i++) cout << "\t" << i << "\t" << u[i] << endl;
}

// Application

application::application(int const & nmax, float const & epsilon, float const & init): euler(nmax, epsilon, init) {
    euler::exacte_isknown = true;
}

float application::u_prime(int const & i) const {
    if (i == 0) return init;
    return - 3 * u[i] - 3  * epsilon * i;
}

float application::exacte(int const & i) const {
    return (init - 1/3) * exp(-3*i*epsilon) - i*epsilon + 1 / 3;
}

void application::affiche() const {
    cout << "classe Application…" << endl;
    cout << "fille de la euler suivante:" << endl;
    euler::affiche();
}

// Ordre 1

ordre_un::ordre_un(int const & nmax, float const & epsilon, float const & init, source* src) : euler(nmax, epsilon, init), src(src) {}

void ordre_un::affiche() const {
    cout << "classe Ordre_un…" << endl;
    cout << "a la source suivante:" << endl;
    src->affiche();
}

// Circuit 1

circuit_un::circuit_un(int const & nmax, float const & epsilon, float const & init, source* src, float const & R, float const & C) : ordre_un(nmax, epsilon, init, src), R(R), C(C) {
    exacte_isknown = false;
}

float circuit_un::u_prime(int const & i) const {
    if (i == 0) return init;
    cout << endl << "circuit_un::u_prime, i: " << i;
    cout << "\t Ve(i*epsilon): " << src->Ve(i*epsilon);
    cout << "\t u[i]: " << u[i];
    cout << "\t R*C: " << R*C << endl;
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
    cout << "fille de la l’ordre un suivant:" << endl;
    ordre_un::affiche();
}

// vim: set foldmethod=marker:
