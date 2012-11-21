#include <iostream>
#include "source.h"

using namespace std;

source::source(float const & V, float const & phi): V(V), phi(phi) {}

void source::affiche() const {
    cout << "classe abstraite Source…" << endl;
    cout << "\tV:\t" << V << endl;
    cout << "\tphi:\t" << phi << endl;
}

impulsion::impulsion(float const & V, float const & phi, float const & T): source(V, phi), T(T) {}

void impulsion::affiche() const {
    cout << "classe Impulsion…" << endl;
    cout << "\tT:\t" << T << endl;
    cout << "fille de la source suivante:" << endl;
    source::affiche();
}

echelon::echelon(float const & V, float const & phi): source(V, phi) {}

void echelon::affiche() const {
    cout << "classe Échelon" << endl;
    cout << "fille de la source suivante:" << endl;
    source::affiche();
}

periodique::periodique(float const & V, float const & phi, float const & P): source(V, phi), P(P) {}

void periodique::affiche() const {
    cout << "classe abstraite Périodique" << endl;
    cout << "\tP:\t" << P << endl;
    cout << "fille de la source suivante:" << endl;
    source::affiche();
}

// Il faut appeler le constructeur de source dirctement à cause du l’héritage virtuel à cause du diamant
triangle::triangle(float const & V, float const & phi, float const & P): source(V, phi), periodique(V, phi, P) {}

void triangle::affiche() const {
    cout << "classe Triangle" << endl;
    cout << "fille de la source périodique suivante:" << endl;
    periodique::affiche();
}

// Il faut appeler le constructeur de source dirctement à cause du l’héritage virtuel à cause du diamant
impulsion_periodique::impulsion_periodique(float const & V, float const & phi, float const & P, float const & T): source(V, phi), impulsion(V, phi, T), periodique(V, phi, P) {}

void impulsion_periodique::affiche() const {
    cout << "classe Impulsion Périodique" << endl;
    cout << "fille de la source périodique et de l’impulsion suivants:" << endl;
    periodique::affiche();
    impulsion::affiche();
}

float impulsion::Ve(float t) {
    if (t > phi and t < phi + T) return V;
    return 0;
}

float impulsion::Ve_p(float t, float epsilon) {
    if (t >= phi and t < phi + epsilon) return V / epsilon;
    if (t >= phi + T and t < phi + T + epsilon) return - V / epsilon;
    return 0;
}

float echelon::Ve(float t) {
    if (t > phi) return V;
    return 0;
}

float echelon::Ve_p(float t, float epsilon) {
    if (t >= phi and t < phi + epsilon) return V / epsilon;
    return 0;
}

// TODO phi
float triangle::Ve(float t) {
    if (t < 0) return 0;
    if (t > P) return Ve(t - P);
    if (t < P/2) return 2 * V * t / P;
    return 2 * V * (1 - t / P);
}

float triangle::Ve_p(float t, float epsilon) {
    if (t < 0) return 0;
    if (t > P) return Ve_p(t - P, epsilon);
    if (t < P/2) return 2 * V / P;
    return - 2 * V / P;
}

// TODO phi
float impulsion_periodique::Ve(float t) {
    if (t < 0) return 0;
    if (t > P) return Ve(t - P);
    if (t < T) return V;
    return 0;
}

float impulsion_periodique::Ve_p(float t, float epsilon) {
    if (t < 0) return 0;
    if (t > P) return Ve_p(t - P, epsilon);
    if (t >= 0 and t < epsilon) return V / epsilon;
    if (t >= T and t < T + epsilon) return - V / epsilon;
    return 0;
}

// vim: set foldmethod=marker:
