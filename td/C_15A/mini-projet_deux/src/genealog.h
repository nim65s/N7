#ifndef GENEALOG_H_INCLUDED
#define GENEALOG_H_INCLUDED

typedef struct personne { // {{{
    std::string nom;
    std::string prenom;
    bool genre;
    int age;
    personne * suivant;
    personne * pere;
    personne * mere;
    int show(int i=0, bool parents=0);
            
} personne; //}}}

personne * creerArbreVide();

int ajouterPersonne(personne & A, personne & P);

personne * creerArbreInitial();

int ajouterPersonne(personne &A);

int afficherArbre(personne & A);

personne * retrouverPersonne(personne & A, bool afficher=false);

int ascendants(personne & pers, int nbgene);

std::vector<personne *> enfants(personne & A, personne & pers, bool show=true);

std::vector<personne *> soeursFreres(personne & A, personne & pers);

std::vector<personne *> cousins(personne & A, personne & pers);

int ecrire(personne & A, std::string file="arbre.txt");

#endif

