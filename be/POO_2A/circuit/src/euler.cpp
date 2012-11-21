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
    assert(false);
    return i;
}

float euler::exacte(int const & i) const {
    // Cette méthode devrait être pure…
    assert(false);
    return i;
}

void euler::main_loop() {
    u.push_back(init);
    cout << "Calcul principal…" << endl;
    for (int i(0);i<nmax;i++) {
        u.push_back(u[i-1] + epsilon*u_prime(i-1));
        //cout << i << ": approchée:\t" << u[i];
        //if (exacte_isknown) cout << "\texacte:\t" << exacte(i);
        //cout << endl;
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

// TODO: sûr que la dérivée en 0 est égale à l’init ? o_O
float application::u_prime(int const & i) const {
    if (i == 0) return init;
    return - 3 * u[i-1] - 3  * epsilon * i;
}

float application::exacte(int const & i) const {
    return (init - 1/3) * exp(-3*i*epsilon) - i*epsilon + 1 / 3;
}

void application::affiche() const {
    cout << "classe Application…" << endl;
    cout << "fille de la euler suivante:" << endl;
    euler::affiche();
}

// vim: set foldmethod=marker:
