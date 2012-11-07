#include <iostream>
#include <cstdio>
#include <string>
#include <assert.h>
#include "mobile.h"

using namespace std;

mobile::mobile() : position(0) {
    cout << "Création d’un nouveau mobile…" << endl;
    cout << "\tveuillez entrer son immatriculation: ";
    cin >> immatriculation;
    cout << "\tet sa vitesse: ";
    cin >> vitesse;
}

voiture::voiture() : mobile() {
    cout << "Données spécifiques aux voitures… " << endl;
    cout << "\tveuillez entrer sa masse: ";
    cin >> masse;
    cout << "\tet sa consommation: ";
    cin >> consommation;
}
scooter::scooter() : mobile() {
    cout << "Données spécifiques aux scooters… " << endl;
    cout << "\tveuillez entrer son prix: ";
    cin >> prix;
    cout << "\tet son type (1 - essence / 2 - electrique): ";
    cin >> type;
}

mobile::mobile(int const & immatriculation, float const & vitesse) : immatriculation(immatriculation), vitesse(vitesse), position(0) {}

voiture::voiture(int const & immatriculation, float const & vitesse) : mobile(immatriculation, vitesse) {}

scooter::scooter(int const & immatriculation, float const & vitesse) : mobile(immatriculation, vitesse) {}

float mobile::calcul_position(float const & temps) {
    position += vitesse * temps;
    cout << "Nouvelle position du mobile immatriculé «" << immatriculation << "» : " << position << endl;
    return position;
}

void mobile::recapitulation() const {
    cout << "\t données issues de la classe mobile:" << endl;
    cout << "\t\t Immatriculation: " << immatriculation << endl;
    cout << "\t\t Vitesse:         " << vitesse << endl;
    cout << "\t\t Position:        " << position << endl;
}

void voiture::recapitulation() const {
    cout << "Récapitulation de la voiture:" << endl;
    mobile::recapitulation();
    cout << "\t données issues de la classe voiture:" << endl;
    cout << "\t\t Masse:           " << masse << endl;
    cout << "\t\t consommation:    " << consommation << endl;
}

void scooter::recapitulation() const {
    cout << "Récapitulation du scooter:" << endl;
    mobile::recapitulation();
    cout << "\t données issues de la classe scooter:" << endl;
    cout << "\t\t Prix:            " << prix << endl;
    if (type == 1) cout << "\t\t Type:            " << "Essence" << endl;
    else cout << "\t\t Type:            " << "Électrique" << endl;
}


// vim: set foldmethod=marker:
