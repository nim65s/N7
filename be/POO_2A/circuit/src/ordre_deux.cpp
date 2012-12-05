#include <iostream>
#include <fstream>
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

void ordre_deux::affiche() const {
    ofstream fichier("../rapport/genere.tex", ios::app);
    fichier << "classe Ordre deux…" << endl;
    fichier << "\tinit-p:\t" << init_p << endl;
    fichier << "a la source suivante:" << endl;
    src->affiche();
    ofstream matlab("../rapport/genere.m", ios::app);
    matlab << "Ve = [ ";
    for (int i(1);i<nmax;i++) matlab << src->Ve(i*epsilon) << " ";
    matlab << "];" << endl;
    fichier << "fille de la méthode d’euler suivante:" << endl;
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
    ofstream fichier("../rapport/genere.tex", ios::app);
    fichier << "classe Circuit trois:" << endl;
    fichier << "\tR:\t" << R << endl;
    fichier << "\tL:\t" << L << endl;
    fichier << "\tC:\t" << C << endl;
    fichier << "fille de l’ordre deux suivant:" << endl;
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
    ofstream fichier("../rapport/genere.tex", ios::app);
    fichier << "classe Circuit quatre:" << endl;
    fichier << "\tR:\t" << R << endl;
    fichier << "\tL:\t" << L << endl;
    fichier << "\tC:\t" << C << endl;
    fichier << "fille de l’ordre deux suivant:" << endl;
    ordre_deux::affiche();
}

// Validation

validation::validation(int const & nmax, float const & epsilon, float const & init, float const & init_p, source* src, float const & lambda): ordre_deux(nmax, epsilon, init, init_p, src), lambda(lambda) {
    exacte_isknown = true;
}

float validation::exacte(int const & i) const {
    return (init_p*sin(sqrt(lambda)*i*epsilon) + init*cos(sqrt(lambda)*i*epsilon)) / sqrt(lambda);
}

float validation::u_seconde(int const & i) const {
    return - lambda * u[i];
}

void validation::affiche() const {
    ofstream fichier("../rapport/genere.tex", ios::app);
    fichier << "classe Validation:" << endl;
    fichier << "\tlambda:\t" << lambda << endl;
    fichier << "fille de l’ordre deux suivant:" << endl;
    ordre_deux::affiche();
}

