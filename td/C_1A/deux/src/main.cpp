#include <iostream>

using namespace std;

int produitintermediaire(int nombre)
{
    if ( nombre < 10 )
    {
        return nombre;
    }
    else
    {
        return ( nombre % 10 ) * produitintermediaire(nombre / 10 );
    }
}

int calculpersistance(int nombre)
{
    int produit = nombre;
    int resultat = 1;
    while ( produit > 9 )
    {
        cout << "\t" << produit << endl;
        produit = produitintermediaire(produit);
        resultat++;
    }
    return resultat;
}

int main()
{
    int choix=0;
    int nombre=0;
    int produit=0;
    int persistance=0;
    int resultat=0;
    cout << "Bonjour. Que voulez-vous faire ? " << endl;
    cout << "1 : Calculer la produit d'un nombre." << endl;
    cout << "2 : Determiner tres bourrinement le plus petit nombre d'une produit donnee." << endl;
    cout << "==>";
    cin >> choix;
    switch (choix)
    {
        case 1:
            cout << "Tres bien. Quel nombre ? ";
            cin >> nombre;
            cout << "La persistance de " << nombre << " est " << calculpersistance(nombre) << endl;
            break;
        case 2:
            cout << "Ok. Quelle persistance ? ";
            cin >> persistance;
            resultat = 0;
            while ( calculpersistance(resultat) < persistance )
            {
                resultat++;
                cout << endl;
            }
            cout << endl << "Et voila : " << resultat << endl;
            break;
        default:
            cout << "Faut mieux choisir que ca, la prochaine fois !" << endl << endl;
            break;
    }

    cout << "Fin du magnifique programme 'TD de C n°2' " << endl << endl;
    return 0;
}
