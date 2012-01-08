#include <iostream>

using namespace std;

int main()
{
    int jour=0;
    int mois=0;
    int annee=0;
    int jours=0; // nombre de jours entre jour/mois/année et 1/1/1960
    int duree[13]; // nombre de jours par mois
    duree[1] = 31;
    duree[2] = 28;
    duree[3] = 31;
    duree[4] = 30;
    duree[5] = 31;
    duree[6] = 30;
    duree[7] = 31;
    duree[8] = 31;
    duree[9] = 30;
    duree[10] = 31;
    duree[11] = 30;
    duree[12] = 31;
    string dow[7];
    dow[0] = "Vendredi.";
    dow[1] = "Samedi.";
    dow[2] = "Dimanche.";
    dow[3] = "Lundi.";
    dow[4] = "Mardi.";
    dow[5] = "Mercredi.";
    dow[6] = "Jeudi.";

    cout << "Jour : ";
    cin >> jour;
    cout << "Mois : ";
    cin >> mois;
    cout << "Année : ";
    cin >> annee;

    if ( annee < 1960 )
    {
        cout << "Années avant 1960 pas encore gérées" << endl;
    }
    else
    {
        jours = jour - 1;

        while ( mois != 1 || annee != 1960 )
        {
            if ( mois != 1 )
            {
                mois--;
            }
            else
            {
                annee--;
                mois = 12;
            }

            jours += duree[mois];

            if ( mois == 2 && ( annee % 400 == 0 || ( annee % 100 != 0 && annee % 4 == 0 ))) // Bissextiles
            {
                jours++;
            }
        }

        cout << endl << "Il s'est passé " << jours << " jours : c'est un " << dow[jours % 7] << endl;
    }
}
