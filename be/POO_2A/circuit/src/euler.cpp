#include <iostream>
#include <fstream>
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

euler::euler() {
    cout << "Constructeur de euler…" << endl;
    cout << "\tnmax: ";
    cin >> nmax;
    cout << "\tepsilon: ";
    cin >> epsilon;
    cout << "\tinit: ";
    cin >> init;
    exacte_isknown = false;
    cout << " OK." << endl;
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
        cout << i << ": approchée:\t" << u[i];
        if (exacte_isknown) cout << "\texacte:\t" << exacte(i);
        cout << endl;
    }
    cout << endl;
}

void euler::affiche() const {
    ofstream fichier("../rapport/genere.tex", ios::app);
    fichier << "classe Euler:" << endl;
    fichier << "\tnmax:\t" << nmax << endl;
    fichier << "\tepsilon:\t" << epsilon << endl;
    fichier << "\tinit:\t" << init << endl;
    //fichier << "\ti\tu:" << endl;
    ofstream matlab("../rapport/genere.m", ios::app);
    matlab << "t = 0:" << epsilon << ":" << nmax/epsilon << endl;
    matlab << "Vs = [ ";
    for (int i(1);i<nmax;i++) matlab << u[i] << " ";
    matlab << "]" << endl;
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
    ofstream fichier("../rapport/genere.tex", ios::app);
    fichier << "classe Application…" << endl;
    fichier << "fille de la euler suivante:" << endl;
    euler::affiche();
}

// vim: set foldmethod=marker:
