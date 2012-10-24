#include <iostream>
#include <cstdio>
#include <string>
#include <assert.h>
#include "mobile.h"

using namespace std;

int main() {
    mobile m(123, 42);
    // à l’execution à ce niveau là, il ne se passe rien dans la console
    // un objet est créé, mais rien ne lui arrive de spécial.

    //m.vitesse = 2;
    //m.immatriculation = 2;
    // vitesse & immatriculation sont protégée & privée, on peut donc pas les modifier ici
    // Si on voulait le faire, il suffirait de créer des accesseurs dans cette classe

    float temps_ecoule(10);
    m.calcul_position(temps_ecoule);
    // à l’execution, ceci affiche «Nouvelle position du mobile immatriculé «123» :420», qui est bien le résultat 42*10

    voiture v(1234, 130);
    scooter s(12, 15);

    v.calcul_position(temps_ecoule);
    m.calcul_position(temps_ecoule);
    // affiche correctement les résultats des vitesses*10

    // menu :
    int choix(-1);
    mobile *vehicule = new mobile(0,0);
    while(choix != 0) {
        cout << endl << endl << "Voulez-vous créer :" << endl;
        cout << "\t1 - Une voiture" << endl;
        cout << "\t2 - Un scooter" << endl;
        cout << "\t0 - quitter" << endl;
        cout << "==> ";
        cin >> choix;

        if (choix == 1) vehicule = new voiture();
        else if (choix == 2) vehicule = new scooter();
        else if (choix == 0) cout << "Fin de la boucle principale…" << endl << endl;
        else cout << "Raté… Les choix disponibles sont pourtant relativement simple…" << endl;

        vehicule->recapitulation();
    }

    return 0;
}
