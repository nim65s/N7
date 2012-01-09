#include <iostream>
#include <string.h>
#include "entreprise.h"

using namespace std;

employe * new_employe(string const & nom, employe * patron){{{
    employe * E = new employe;
    E->nom = nom;
    E->patron = patron;
    E->suivant = NULL;
    return E;
}}}
    

employe * new_entreprise(string const & nom_entreprise){{{
    employe * E = new employe;
    E->nom = nom_entreprise;
    E->patron = NULL;
    E->suivant = NULL;
    return E;
}}}

employe * ajouter_employe(string const & nom, employe * patron, employe * entreprise){{{
    employe * E = new_employe(nom,patron);
    employe * temp = entreprise;
    //TODO assert temp->nom != nom
    while(temp->suivant != NULL) temp = temp->suivant;
    temp->suivant = E;
    return E;
}}}

void licencier_employe(string const & nom, employe * entreprise){{{
    //TODO : si c’est un patron, faut promouvoir…
    employe * temp  = entreprise;
    while(temp->suivant->nom != nom) temp = temp->suivant;
    delete temp->suivant;
    temp->suivant = temp->suivant->suivant;
}}}

employe * creer_entreprise_initial(string const & nom_entreprise, string const & nom_boss, string const & nom_un, string const & nom_deux){{{
    employe * entreprise = new_entreprise(nom_entreprise);
    employe * boss = ajouter_employe(nom_boss,entreprise,entreprise);
    employe * un = ajouter_employe(nom_un,boss,entreprise);
    ajouter_employe(nom_deux,un,entreprise);
    return entreprise;
}}}

void sous_fifres(string const & nom, employe * entreprise){{{
    employe * temp  = entreprise;
    while(temp->suivant != NULL){
        if (temp->patron->nom == nom) cout << temp->nom << endl;
        temp = temp->suivant;
    }
}}}

void afficher(employe * entreprise){{{
    //TODO
}}}
