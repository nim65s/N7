#include <iostream>

/* TODO
 * jours = 365*(annee - 1960)
 * for (i = annee, i <> 1960.... if bissex then jours +=1
 */

using namespace std;

int main() {
    int jour=0;
    int mois=0;
    int annee=0;
    int jours=0; // nombre de jours entre jour/mois/annee et 1/1/1960
    int duree[13] = {0,31,28,31,30,31,30,31,31,30,31,30,31};
    string dow[8] = { "Vendredi.", "Samedi.", "Dimanche.", "Lundi.", "Mardi.", "Mercredi.", "Jeudi.", "Vendredi."};
    while (jour<1 || jour > 31) {
        cout << "Jour : ";
        cin >> jour;
    }
    while (mois<1 || mois > 12) {
        cout << "Mois : ";
        cin >> mois;
    }
    while (annee<1) {
        cout << "Annee : ";
        cin >> annee;
    }

    if ( annee < 1960 ) {
        jours = duree[mois] - jour +1;

        while (mois != 1 || annee != 1960) {
            if (mois != 12)
                mois++;
            else {
                annee++;
                mois=1;
            }

            cout << annee << "\t" << mois << "\t" << duree[mois] << endl;

            jours += duree[mois];

            if ( mois == 2 && ( annee % 400 == 0 || ( annee % 100 != 0 && annee % 4 == 0 )))// Bissextiles
                jours++;
        }

        jours -= duree[1];

        cout << endl << "Il s'est passe " << jours << " jours : c'est un " << dow[7-(jours % 7)] << endl;
    }
    else {
        jours = jour - 1;

        while ( mois != 1 || annee != 1960 ) {
            if ( mois != 1 )
                mois--;
            else {
                annee--;
                mois = 12;
            }

            cout << annee << "\t" << mois << "\t" << duree[mois] << endl;

            jours += duree[mois];

            if ( mois == 2 && ( annee % 400 == 0 || ( annee % 100 != 0 && annee % 4 == 0 ))) // Bissextiles
                jours++;
        }

        cout << endl << "Il s'est passe " << jours << " jours : c'est un " << dow[jours % 7] << endl;
    }
}
