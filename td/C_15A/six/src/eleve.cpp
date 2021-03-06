#include <iostream>
#include <cstdio>
#include <string.h>
#include "eleve.h"

using namespace std;

Eleve::Eleve() : m_nom("Joe"), m_prenom("black"), m_classe("/dev/null") {
    for (int i=0;i<9;i++) m_notes[i] = 0;
}

Eleve::Eleve(std::string const & nom, std::string const & prenom, std::string const & classe; float const & notes[9]) : m_nom(nom), m_prenom(prenom), m_classe(classe), m_notes(notes) {}

Eleve::afficher(){
    cout << "Fiche Élève" << endl << "  Nom : " << m_nom << endl;
    cout << "  Prénom" << m_prenom << endl << "  Promo : " << m_classe << endl;
    for (int i=0;i<9;i++) cout <<  "  Note " << i << " : " << m_notes[i] << endl;
}

vector<Eleve> lire(string filename){{{
    f = fopen(filename,"rt");
    assert(f != NULL);

    vector<Eleve> promo;
    string nom,prenom,classe,temp("pipo");
    float notes[9];

    fgets(nom,30,f);
    fgets(prenom,30,f);
    fgets(classe,30,f);
    for(int i=0;i<9;i++) notes[i] = atof(fgets(temp,5,f));
    while(temp != NULL) {
        promo.push_back(new Eleve(nom,prenom,classe,notes));
        fgets(nom,30,f);
        fgets(prenom,30,f);
        fgets(classe,30,f);
        for(int i=0;i<9;i++) notes[i] = atof(fgets(temp,5,f));
    }
    fclose(f);
    return promo;
}}}
