#include <iostream>
#include <vector>
#include "math.h"

using namespace std;

int produitintermediaire(int nombre) {
    if ( nombre < 10 )
        return nombre;
    else
        return ( nombre % 10 ) * produitintermediaire( nombre / 10 );
}

int calculpersistance(int nombre) {
    int produit = nombre;
    int resultat = 0;
    while ( produit > 9 ) {
        cout << "\t" << produit << endl;
        produit = produitintermediaire(produit);
        resultat++;
    }
    return resultat;
}

bool useless(int resultat) {
    int i=0;
    int temp=0;
    vector<int> petits_chiffres;
    while (resultat > pow(10,i)) {
        temp = floor(resultat/pow(10,i));
        switch(temp%10) {
            case 0:
                return true;
                break;
            case 1:
                return true;
                break;
            case 2:
                for(int j=0;j<petits_chiffres.size();j++) {
                    if (2*petits_chiffres[j] <10)
                        return true;
                }
                petits_chiffres.push_back(2);
                break;
            case 3:
                for(int j=0;j<petits_chiffres.size();j++) {
                    if (2*petits_chiffres[j] <10)
                        return true;
                }
                petits_chiffres.push_back(3);
                break;
            case 4:
                for(int j=0;j<petits_chiffres.size();j++) {
                    if (2*petits_chiffres[j] <10)
                        return true;
                }
                petits_chiffres.push_back(4);
                break;
        }
        i++;
    }
    return false;
}

int main() {
    int choix=0;
    int nombre=0;
    int produit=0;
    int persistance=0;
    int resultat=0;
    cout << "Bonjour. Que voulez-vous faire ? " << endl;
    cout << "1 : Calculer la persistance d'un nombre." << endl;
    cout << "2 : Determiner le plus petit nombre d'une persistance donnee." << endl;
    cout << "==>";
    cin >> choix;
    switch (choix) {
        case 1:
            cout << "Tres bien. Quel nombre ? ";
            cin >> nombre;
            resultat = calculpersistance(nombre);
            cout << "La persistance de " << nombre << " est " << resultat << endl;
            break;
        case 2:
            cout << "Ok. Quelle persistance ? ";
            cin >> persistance;
            resultat = 10;
            if (persistance > 1) {
                while (calculpersistance(resultat) < persistance) {
                    do {
                        resultat++;
                    } while (useless(resultat));
                } 
            }
            else
                resultat = 10;
            cout << endl << "Et voila : " << resultat << endl;
            break;
        case 42:
            cout << "Trop fort, je m'incline. Bravo." << endl << endl;
            break;
        default:
            cout << "Faut mieux choisir que ca, la prochaine fois !" << endl << endl;
            break;
    }
    return 0;
}
