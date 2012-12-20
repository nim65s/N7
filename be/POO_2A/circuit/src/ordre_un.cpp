#include <iostream>
#include <fstream>
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

ordre_un::ordre_un(): euler() {
    int i(0);
    cout << "constructeur d’ordre_un:" << endl;
    cout << "quel type de source voulez-vous ?" << endl;
    cout << "\t1 - impulsion" << endl;
    cout << "\t2 - echelon" << endl;
    cout << "\t3 - triangle" << endl;
    cout << "\t4 - impulsion périodique" << endl;
    cout << "==> ";
    cin >> i;
    switch (i) {
        case 1:
            //impulsion i();
            src = new impulsion;
            break;
        case 2:
            //echelon e();
            src = new echelon;
            break;
        case 3:
            //triangle t();
            src = new triangle;
            break;
        case 4:
            //impulsion_periodique ip();
            src = new impulsion_periodique;
            break;
    }
}

//ordre_un::~ordre_un() {
    //delete src;
//}

void ordre_un::affiche() const {
    ofstream fichier("../rapport/genere.tex", ios::app);
    fichier << "classe Ordre un…\\\\" << endl;
    fichier << "a la source suivante:\\\\" << endl;
    src->affiche();
    ofstream matlab("../rapport/genere.m", ios::app);
    matlab << "Ve = [ 0 "; // on ajoute un 0 au début pour montrer que Ve est nul pour tout t < 0 sur les plots matlab
    for (int i(1);i<nmax-1;i++) matlab << src->Ve(i*epsilon) << " ";
    matlab << "];" << endl;
    fichier << "fille de la méthode d’euler suivante:\\\\" << endl;
    euler::affiche();
}

// Circuit 1

circuit_un::circuit_un(int const & nmax, float const & epsilon, float const & init, source* src, float const & R, float const & C) : ordre_un(nmax, epsilon, init, src), R(R), C(C) {
    exacte_isknown = false;
}

circuit_un::circuit_un(): ordre_un() {
    cout << "constructeur de circuit_un:";
    cout << endl << "\tR: ";
    cin >> R;
    cout << endl << "\tC: ";
    cin >> C;
    cout << " OK." << endl;
    exacte_isknown = false;
}

//circuit_un::~circuit_un() {}

float circuit_un::u_prime(int const & i) const {
    return (src->Ve(i*epsilon) - u[i]) / (R*C);
}

float circuit_un::exacte(int const & i) const {
    // Cette méthode devrait être pure…
    assert(false);
    return i;
}

void circuit_un::affiche() const {
    ofstream fichier("../rapport/genere.tex", ios::app);
    fichier << "classe Circuit un:\\\\" << endl;
    fichier << "\tR:\t" << R << " ohms\\\\" << endl;
    fichier << "\tC:\t" << C << " F\\\\" << endl;
    fichier << "fille de l’ordre un suivant:\\\\" << endl;
    ordre_un::affiche();
}

// Circuit 2

circuit_deux::circuit_deux(int const & nmax, float const & epsilon, float const & init, source* src, float const & R1, float const & R2, float const & C) : ordre_un(nmax, epsilon, init, src), R1(R1), R2(R2), C(C) {
    exacte_isknown = false;
}

circuit_deux::circuit_deux(): ordre_un() {
    cout << "constructeur de circuit_deux:";
    cout << endl << "\tR1: ";
    cin >> R1;
    cout << endl << "\tR2: ";
    cin >> R2;
    cout << endl << "\tC: ";
    cin >> C;
    cout << " OK." << endl;
    exacte_isknown = false;
}

//circuit_deux::~circuit_deux() {}

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
    ofstream fichier("../rapport/genere.tex", ios::app);
    fichier << "classe Circuit deux:\\\\" << endl;
    fichier << "\tR1:\t" << R1 << " ohms\\\\" << endl;
    fichier << "\tR2:\t" << R2 << " ohms\\\\" << endl;
    fichier << "\tC:\t" << C << " F\\\\" << endl;
    fichier << "fille de l’ordre un suivant:\\\\" << endl;
    ordre_un::affiche();
}

// vim: set foldmethod=marker:
