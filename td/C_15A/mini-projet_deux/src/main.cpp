#include <iostream>
#include <string.h>
#include <stdlib.h>
#include <cstdio>
#include <unistd.h>
#include <vector>
#include <algorithm>
#include "genealog.h"

using namespace std;

int main(){
    personne * A = creerArbreInitial();

    cout << "\t\t\t Arbre" << endl;
    afficherArbre(*A);

    int choix(0),n(0);
    bool fin=false;
    while (!fin) {
        cout << "Que voulez-vous faire ?" << endl;
        cout << "0) Sortir" << endl;
        cout << "1) Ajouter une personne à l’arbre" << endl;
        cout << "2) Afficher l’arbre" << endl;
        cout << "3) Retrouver une personne" << endl;
        cout << "4) Afficher les ascendants d’une personne" << endl;
        cout << "5) Afficher les enfants d’une personne" << endl;
        cout << "6) Afficher les frères & sœurs d’une personne" << endl;
        cout << "7) Afficher les cousins et cousines d’une personne" << endl;
        cout << "8) Écrire l’arbre dans un fichier" << endl;
        cout << "==>";
        cin >> choix;
        switch (choix) {
            case 0:
                fin=true;
                break;
            case 1:
                ajouterPersonne(*A);
                break;
            case 2:
                afficherArbre(*A);
                break;
            case 3:
                retrouverPersonne(*A,true);
                break;
            case 4:
                cout << "Vous voulez les ascendants sur combien de générations ?" << endl << "==>";
                cin >> n;
                ascendants(*retrouverPersonne(*A),n);
                break;
            case 5:
                enfants(*A,*retrouverPersonne(*A));
                break;
            case 6:
                soeursFreres(*A,*retrouverPersonne(*A));
                break;
            case 7:
                cousins(*A,*retrouverPersonne(*A));
                break;
            case 8:
                ecrire(*A);
                break;
            default :
                cout << "Try Again…" << endl;
        } 
    }
    return 0;
}
