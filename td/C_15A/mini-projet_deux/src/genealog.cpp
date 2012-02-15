#include <iostream>
#include <string.h>
#include <stdlib.h>
#include <cstdio>
#include <unistd.h>
#include <vector>
#include <algorithm>
#include "genealog.h"

using namespace std;

int personne::show(int i, bool parents){{{
    if (i == 0) cout << "------------------------------------------" << endl;
    else if (i < 10 && i > 0) cout << "--------------" << i << "---------------------------" << endl;
    else if (i < 100 && i > 0) cout << "-------------" << i << "---------------------------" << endl;
    else if (i > 99 && i > 0) cout << "------------" << i << "---------------------------" << endl;
    cout << "Nom :\t\t" << nom << endl;
    cout << "Prénom :\t" << prenom << endl;
    if (genre) cout << "Genre :\t\tHomme" << endl;
    else cout << "Genre :\t\tFemme" << endl;
    cout << "Âge :\t\t" << age << " ans" << endl;
    if (pere != NULL && parents){
        cout << "-----------PÈRE---------------------------" << endl;
        pere->show(-1);
    }
    if (mere != NULL && parents){
        cout << "-----------MÈRE---------------------------" << endl;
        mere->show(-1);
    }
    cout << endl;
    return 0;
}}}

personne * creerArbreVide(){{{
    personne * A = new personne;
    A->nom = "";
    A->prenom = "";
    A->genre = 1;
    A->age = 0;
    A->pere = NULL;
    A->mere = NULL;
    A->suivant = NULL;
    return A;
}}}

int ajouterPersonne(personne & A, personne & P){{{
    if (&A==NULL) {
        cout << "Si on ne donne pas un arbre à cette fonction, elle va avoir du mal à ajouter quelqu’un dedans !" << endl;
        return 1;
    }
    if (&P==NULL) {
        cout << "Si on ne donne pas une personne à cette fonction, elle va avoir du mal à l’ajouter dans l’arbre !" << endl;
        return 1;
    }
    personne * temp = &A;
    while (temp->suivant !=NULL) temp = temp->suivant;
    temp->suivant = &P;
    return 0;
}}}

personne * creerArbreInitial() {{{
    personne * A = creerArbreVide();

    personne * papip = new personne;
    papip->nom = "Saurel";
    papip->prenom = "Pierre";
    papip->genre = 1;
    papip->age = 80;

    ajouterPersonne(*A,*papip);

    personne * mamiep = new personne;
    mamiep->nom = "Saurel";
    mamiep->prenom = "Juliette";
    mamiep->genre = 0;
    mamiep->age = 80;

    ajouterPersonne(*A,*mamiep);

    personne * papa = new personne;
    papa->nom = "Saurel";
    papa->prenom = "Philippe";
    papa->genre = 1;
    papa->age = 50;
    papa->pere = papip;
    papa->mere = mamiep;
    
    ajouterPersonne(*A,*papa);

    personne * papim = new personne;
    papim->nom = "Dujols";
    papim->prenom = "André";
    papim->genre = 1;
    papim->age = 85;

    ajouterPersonne(*A,*papim);

    personne * mamiem = new personne;
    mamiem->nom = "Dujols";
    mamiem->prenom = "Luce";
    mamiem->genre = 0;
    mamiem->age = 82;

    ajouterPersonne(*A,*mamiem);

    personne * maman = new personne;
    maman->nom = "Dujols";
    maman->prenom = "Christine";
    maman->genre = 0;
    maman->age = 55;
    maman->pere = papim;
    maman->mere = mamiem;
    
    ajouterPersonne(*A,*maman);

    personne * tonton = new personne;
    tonton->nom = "Lucquet";
    tonton->prenom = "Dominique";
    tonton->age = 45;
    tonton->genre = 1;

    ajouterPersonne(*A,*tonton);

    personne * tata = new personne;
    tata->nom = "Dujols";
    tata->prenom = "Françoise";
    tata->age = 42;
    tata-> genre = 0;
    tata->pere = papim;
    tata->mere = mamiem;

    ajouterPersonne(*A,*tata);

    personne * cousin = new personne;
    cousin->nom = "Dujols-Lucquet";
    cousin->prenom = "Arthur";
    cousin->age = 12;
    cousin->genre = 1;
    cousin->pere = tonton;
    cousin->mere = tata;

    ajouterPersonne(*A,*cousin);
    
    personne * moi = new personne;
    moi->nom = "Saurel-Dujols";
    moi->prenom = "Guilhem";
    moi->age = 20;
    moi->genre = 1;
    moi->pere = papa;
    moi->mere = maman;

    ajouterPersonne(*A,*moi);

    personne * frere = new personne;
    frere->nom = "Saurel-Dujols";
    frere->prenom = "Luc";
    frere->age = 19;
    frere->genre = 1;
    frere->pere = papa;
    frere->mere = maman;

    ajouterPersonne(*A,*frere);

    return A;
}}}

int ajouterPersonne(personne &A){{{
    if (&A==NULL) {
        cout << "Si on ne donne pas un arbre à cette fonction, elle va avoir du mal à ajouter quelqu’un dedans !" << endl;
        return 1;
    }
    personne * P = new personne;
    char reponse;

    cout << "Nom ? =>";
    cin >> P->nom;
    cout << "Prénom ? =>";
    cin >> P->prenom;
    cout << "Age ? =>";
    cin >> P->age;
    cout << "Sexe ? (0 pour femme, 1 pour homme) =>";
    cin >> P->genre;
    cout << "Ajouter un père ? [o/N] =>";
    cin >> reponse;
    if (reponse == 'o' || reponse == 'O') P->pere=retrouverPersonne(A);
    else P->pere = NULL;

    cout << "Ajouter une mère ? [o/N] =>";
    cin >> reponse;
    if (reponse == 'o' || reponse == 'O') P->mere=retrouverPersonne(A);
    else P->mere = NULL;

    personne * temp = &A;
    while (temp->suivant !=NULL) temp = temp->suivant;
    temp->suivant = P;
    return 0;
}}}

int afficherArbre(personne & A){{{
    if (&A==NULL) {
        cout << "Si on ne donne pas un arbre à cette fonction, elle va avoir du mal à l’afficher !" << endl;
        return 1;
    }
    cout << endl << "\t\tAffichage de l'arbre : "<< endl;
    int retcode=0;
    personne * temp = &A;
    while (temp->suivant !=NULL){
        temp = temp->suivant;
        temp->show(++retcode,1);
    }
    return retcode;
}}}

personne * retrouverPersonne(personne & A, bool afficher){{{
    if (&A==NULL) {
        cout << "Si on ne donne pas un arbre à cette fonction, elle va avoir du mal à trouver des gens dedans !" << endl;
        return NULL;
    }
    personne * p=NULL;
    personne * temp;
    int critere, age, numero, choix=-1, place, cmpt=0;
    string nom, prenom;
    bool genre, sortie=false;

    cout << "\t\tRetrouvage de personne : "<< endl;
    while(!sortie) {
        temp=&A;
        choix=-1;
        numero=0;
        cout << "Vous voulez chercher à partir de quelle donnée ?" << endl;
        cout << "1) nom" << endl;
        cout << "2) prénom" << endl;
        cout << "3) genre" << endl;
        cout << "4) age" << endl;
        cout << "5) numéro" << endl;
        cout << "==>";
        cin >> critere;
        switch (critere){
            case 1:
                cout << "Entrez le nom de la personne" << endl << "==>";
                cin >> nom;
                
                while (temp->suivant !=NULL){
                    temp = temp->suivant;
                    if (nom==temp->nom) temp->show(++numero);
                }
                break;
            case 2:
                cout << "Entrez le prénom de la personne" << endl << "==>";
                cin >> prenom;
                
                while (temp->suivant !=NULL){
                    temp = temp->suivant;
                    if (prenom==temp->prenom) temp->show(++numero);
                }
                break;
            case 3:
                cout << "Entrez 1 pour homme ou 0 pour femme (oui, c'est sexiste.)" << endl << "==>";
                cin >> genre;
                
                while (temp->suivant !=NULL){
                    temp = temp->suivant;
                    if (genre == temp->genre) temp->show(++numero);
                }
                break;
            case 4:
                cout << "Entrez l'age de la personne" << endl << "==>";
                cin >> age;
                
                while (temp->suivant !=NULL){
                    temp = temp->suivant;
                    if (age == temp->age) temp->show(++numero);
                }
                break;
            case 5:
                cout << "Entrez le numéro de la personne" << endl << "==>";
                cin >> place;

                numero=1;
                while (++cmpt != place+1 && temp->suivant != NULL) {
                    temp = temp->suivant;
                    if (temp->suivant == NULL) {
                        cout << "Vous avez entré un numéro ne correspondant pas à une personne…" << endl;
                        numero=-1;
                    }
                }
                p=temp;
                sortie=true;

                break;
            default:
                cout << "Try again…" << endl;
                break;
        }
        if (numero<=0) {
            char continuer;
            cout << "Rien trouvé…" << endl << "Recommencer la recherche ? [O/n]" << endl << "==>";
            cin >> continuer;
            if (continuer == 'n' || continuer == 'N') sortie=true;
        }
        else {
            while (choix<0||choix>numero) {
                if (numero==1) choix=1;
                else {
                    cout << "Entrez le numéro de la personne que vous cherchez, ou 0 pour recommencer :" << endl << "==>";
                    cin >> choix;
                }
                if (choix>0||choix<numero){
                    cmpt=0;
                    temp=&A;
                    switch (critere){
                        case 1:
                            while (temp->suivant !=NULL){
                                temp = temp->suivant;
                                if (nom==temp->nom && ++cmpt == choix) {
                                    p=temp;
                                    sortie=true;
                                }
                            }
                            break;
                        case 2:
                            while (temp->suivant !=NULL){
                                temp = temp->suivant;
                                if (prenom==temp->prenom && ++cmpt == choix) {
                                    p=temp;
                                    sortie=true;
                                }
                            }
                            break;
                        case 3:
                            while (temp->suivant !=NULL){
                                temp = temp->suivant;
                                if (genre == temp->genre && ++cmpt == choix) {
                                    p=temp;
                                    sortie=true;
                                }
                            }
                            break;
                        case 4:
                            while (temp->suivant !=NULL){
                                temp = temp->suivant;
                                if (age == temp->age && ++cmpt == choix) {
                                    p=temp;
                                    sortie=true;
                                }
                            }
                            break;
                    }
                }
            }
        }
    }
    if (afficher) p->show();
    return p;
}}}

int ascendants(personne & pers, int nbgene){{{
    if (&pers==NULL) {
        cout << "Si on ne donne pas une personne à cette fonction, elle va avoir du mal à en trouver les ascendants !" << endl;
        return 1;
    }
    personne * P = &pers;
    P->show(0,true);
    if (nbgene>0) {
        if (P->mere != NULL) ascendants(*P->mere,nbgene-1);
        if (P->pere != NULL) ascendants(*P->pere,nbgene-1);
    }
    return 0;
}}}

vector<personne *> enfants(personne & A, personne & pers, bool show) {{{
    vector<personne *> venfants;
    personne * P = &pers;
    if (&A==NULL) {
        cout << "Si on ne donne pas un arbre à cette fonction, elle va avoir du mal à trouver des gens dedans !" << endl;
        return venfants;
    }
    if (P==NULL) {
        cout << "Si on ne donne pas une personne à cette fonction, elle va avoir du mal à en trouver les enfants !" << endl;
        return venfants;
    }
    if (show) {
        cout << endl << "\t\tAffichage des enfants de : "<< endl;
        P->show();
    }

    int retcode=0;
    personne * temp = &A;
    while (temp->suivant !=NULL){
        temp = temp->suivant;
        if (temp->pere==P||temp->mere==P) {
            venfants.push_back(temp);
            if (show) temp->show(++retcode);
            else retcode++;
        }
    }
    return venfants;
}}}

vector<personne *> soeursFreres(personne & A, personne & pers) {{{
    vector<personne *> vsoeursfreres;
    vector<personne *> venfants;
    vector<personne *>::iterator it;
    personne * P = &pers;
    if (&A==NULL) {
        cout << "Si on ne donne pas un arbre à cette fonction, elle va avoir du mal à trouver des gens dedans !" << endl;
        return vsoeursfreres;
    }
    if (P==NULL) {
        cout << "Si on ne donne pas une personne à cette fonction, elle va avoir du mal à en trouver les frères et sœurs !" << endl;
        return vsoeursfreres;
    }
    cout << endl << "\t\tAffichage des frères, sœurs, demi-frères et demi-sœurs de (ie des enfants des parents de): "<< endl;
    P->show(-1,false);

    if (P->mere != NULL) {
        venfants = enfants(A,*P->mere,false);
        vsoeursfreres.insert(vsoeursfreres.end(), venfants.begin(), venfants.end());
    }
    if (P->pere != NULL) {
        venfants = enfants(A,*P->pere,false);
        vsoeursfreres.insert(vsoeursfreres.end(), venfants.begin(), venfants.end());
    }

    sort(vsoeursfreres.begin(), vsoeursfreres.end());
    vsoeursfreres.erase(unique(vsoeursfreres.begin(), vsoeursfreres.end() ), vsoeursfreres.end());

    it=vsoeursfreres.begin();
    while (*it != P) it++;
    vsoeursfreres.erase(it);

    for (int i(0); i<int(vsoeursfreres.size()); ++i) vsoeursfreres[i]->show(i+1);

    return vsoeursfreres;
}}}

vector<personne *> cousins(personne & A, personne & pers) {{{
    personne * P = &pers;
    personne * temp = &pers;
    vector<personne *> venfants;
    vector<personne *> onclestantes;
    vector<personne *> vcousins;
    if (&A==NULL) {
        cout << "Si on ne donne pas un arbre à cette fonction, elle va avoir du mal à trouver des gens dedans !" << endl;
        return vcousins;
    }
    if (P==NULL) {
        cout << "Si on ne donne pas une personne à cette fonction, elle va avoir du mal à en trouver les cousins !" << endl;
        return vcousins;
    }
    cout << endl << "\t\tAffichage des cousins et cousines de (ie des petits-enfants des grands-parents de): "<< endl;
    P->show(-1,false);

    if (P->mere != NULL) {
        temp = P->mere;
        if (temp->mere != NULL) {
            venfants = enfants(A,*temp->mere,false);
            onclestantes.insert(onclestantes.end(), venfants.begin(), venfants.end());
        }
        if (temp->pere != NULL) {
            venfants = enfants(A,*temp->pere,false);
            onclestantes.insert(onclestantes.end(), venfants.begin(), venfants.end());
        }
    }
    if (P->pere != NULL) {
        temp = P->pere;
        if (temp->mere != NULL) {
            venfants = enfants(A,*temp->mere,false);
            onclestantes.insert(onclestantes.end(), venfants.begin(), venfants.end());
        }
        if (temp->pere != NULL) {
            venfants = enfants(A,*temp->pere,false);
            onclestantes.insert(onclestantes.end(), venfants.begin(), venfants.end());
        }
    }

    for (int i(0); i<int(onclestantes.size()); ++i) {
        if (onclestantes[i] != P->pere && onclestantes[i] != P->mere) {
            venfants = enfants(A,*onclestantes[i],false);
            vcousins.insert(vcousins.end(), venfants.begin(), venfants.end());
        }
    }

    sort(vcousins.begin(), vcousins.end());
    vcousins.erase(unique(vcousins.begin(), vcousins.end() ), vcousins.end());

    for (int i(0); i<int(vcousins.size()); ++i) vcousins[i]->show(i+1);

    return vcousins;
}}}

// vim: set foldmethod=marker:
