#include <iostream>
#include <fstream>
#include <math.h>
#include "source.h"

using namespace std;

/********************** Constructeurs, destructeurs et fonctions d’affichage ***************************/

// Source

source::source(float const & V, float const & phi): V(V), phi(phi) {}

source::source() {
    cout << "Constructeur de source:" << endl;
    cout << "\tV: ";
    cin >> V;
    cout << "\tphi: ";
    cin >> phi;
    cout << " OK." << endl;
}

//source::~source() {}

void source::affiche() const {
    ofstream fichier("../rapport/genere.tex", ios::app);
    fichier << "classe abstraite Source…" << endl;
    fichier << "\tV:\t" << V << endl;
    fichier << "\tphi:\t" << phi << endl;
}

// Impulsion

impulsion::impulsion(float const & V, float const & phi, float const & T): source(V, phi), T(T) {}

impulsion::impulsion(): source() {
    cout << "constructeur d’impulsion:";
    cout << endl << "\tT: ";
    cin >> T;
    cout << " OK." << endl;
}

//impulsion::~impulsion() {}

void impulsion::affiche() const {
    ofstream fichier("../rapport/genere.tex", ios::app);
    fichier << "classe Impulsion…" << endl;
    fichier << "\tT:\t" << T << endl;
    fichier << "fille de la source suivante:" << endl;
    source::affiche();
}

// Echelon

echelon::echelon(float const & V, float const & phi): source(V, phi) {}

echelon::echelon(): source() {}

//echelon::~echelon() {}

void echelon::affiche() const {
    ofstream fichier("../rapport/genere.tex", ios::app);
    fichier << "classe Échelon" << endl;
    fichier << "fille de la source suivante:" << endl;
    source::affiche();
}

// Periodique

periodique::periodique(float const & V, float const & phi, float const & P): source(V, phi), P(P) {}

periodique::periodique(): source() {
    cout << "Constructeur de périodique:" << endl;
    cout << "\tP: ";
    cin >> P;
    cout << " OK." << endl;
}

//periodique::~periodique() {}

void periodique::affiche() const {
    ofstream fichier("../rapport/genere.tex", ios::app);
    fichier << "classe abstraite Périodique" << endl;
    fichier << "\tP:\t" << P << endl;
    fichier << "fille de la source suivante:" << endl;
    source::affiche();
}

// Triangle

// Il faut appeler le constructeur de source dirctement à cause du l’héritage virtuel à cause du diamant
triangle::triangle(float const & V, float const & phi, float const & P): source(V, phi), periodique(V, phi, P) {}

triangle::triangle(): source(), periodique() {}

//triangle::~triangle() {}

void triangle::affiche() const {
    ofstream fichier("../rapport/genere.tex", ios::app);
    fichier << "classe Triangle" << endl;
    fichier << "fille de la source périodique suivante:" << endl;
    periodique::affiche();
}

// Sinus

// Il faut appeler le constructeur de source dirctement à cause du l’héritage virtuel à cause du diamant
sinus::sinus(float const & V, float const & phi, float const & P): source(V, phi), periodique(V, phi, P) {}

sinus::sinus(): source(), periodique() {}

//sinus::~sinus() {}

void sinus::affiche() const {
    ofstream fichier("../rapport/genere.tex", ios::app);
    fichier << "classe Sinus" << endl;
    fichier << "fille de la source périodique suivante:" << endl;
    periodique::affiche();
}

// Impulsion périodique

// Il faut appeler le constructeur de source dirctement à cause du l’héritage virtuel à cause du diamant
impulsion_periodique::impulsion_periodique(float const & V, float const & phi, float const & P, float const & T): source(V, phi), impulsion(V, phi, T), periodique(V, phi, P) {}

impulsion_periodique::impulsion_periodique(): source(), impulsion(), periodique() {}

//impulsion_periodique::~impulsion_periodique() {}

void impulsion_periodique::affiche() const {
    ofstream fichier("../rapport/genere.tex", ios::app);
    fichier << "classe Impulsion Périodique" << endl;
    fichier << "fille de la source périodique et de l’impulsion suivants:" << endl;
    periodique::affiche();
    impulsion::affiche();
}

/********************** Tensions et dérivées  ***************************/

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

float sinus::Ve(float t) {
    if (t < 0) return 0;
    return V * sin(t);
}

float sinus::Ve_p(float t, float epsilon) {
    if (t < 0) return 0;
    return - 2 * cos(t);
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
