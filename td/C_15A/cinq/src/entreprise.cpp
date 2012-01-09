#include <iostream>
#include <string.h>
#include "entreprise.h"

using namespace std;

employe::employe(string const & nom, employe * patron) : nom(nom), suivant(NULL), patron(patron) {};

entreprise::entreprise(string const & nom_boss) : boss(nom_boss) {};

void entreprise::ajouterEmploye(string const & nom, employe * patron) {{{
    employe * temp = & boss;
    while(temp->suivant != NULL) temp = temp->suivant;
    temp->suivant = new employe(nom,patron);
}}}

void entreprise::licencieEmploye(string const & nom) {{{
    employe * temp  = & boss;
    while(0 == strcmp(temp->suivant->nom,nom)) temp = temp->suivant;
    temp->suivant = temp->suivant->suivant;
}}}

/*entreprise creerArbreInitial(string const & nom_boss, string const & nom_un, string const & nom_deux) {{{
    entreprise mycompany = new entreprise(nom_boss);
    mycompany->ajouterEmploye(nom_un,mycompany->boss);
    mycompany->ajouterEmploye(nom_deux,&mycompany->suivant);
    return mycompany;
}}}*/
