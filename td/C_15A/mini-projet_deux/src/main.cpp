#include <iostream>
#include <string.h>
#include <stdlib.h>
#include <cstdio>
#include <unistd.h>
#include <assert.h>

using namespace std;

typedef struct personne { // {{{
    string nom;
    string prenom;
    bool genre;
    int age;
    personne * suivant;
    personne * pere;
    personne * mere;
    int show(int i=0, bool parents=0){
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
        return 0;
    }
            
} personne; //}}}

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
    maman->genre = 1;
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
    if (reponse == 'o' || reponse == 'O'){ // TODO on doit pouvoir utiliser la recherche
        int num=0;
        int cmpt=0;
        cout << "Quel est son numéro ? =>";
        cin >> num;
        personne * temp = &A;
        while (temp->suivant !=NULL && cmpt != num){
            cmpt++;
            temp = temp->suivant;
        }
        if (!temp->genre) cout << "Nan mais ça peut pas être son père, vu que c'est une femme !" << endl; // TODO : reboucler
        P->pere=temp;
    }
    else P->pere = NULL;

    cout << "Ajouter une mère ? [o/N] =>";
    cin >> reponse;
    if (reponse == 'o' || reponse == 'O'){
        int num=0;
        int cmpt=0;
        cout << "Quel est son numéro ? =>";
        cin >> num;
        personne * temp = &A;
        while (temp->suivant !=NULL && cmpt != num){
            cmpt++;
            temp = temp->suivant;
        }
        if (temp->genre) cout << "Nan mais ça peut pas être sa mère, vu que c'est un homme!" << endl;
        P->mere=temp;
    }
    else P->mere = NULL;


    personne * temp = &A;
    while (temp->suivant !=NULL) temp = temp->suivant;
    temp->suivant = P;
    return 0;
}}}

int afficherArbre(personne & A){{{
    cout << endl << "\t\tAffichage de l'arbre : "<< endl;
    int retcode=0;
    personne * temp = &A;
    while (temp->suivant !=NULL){
        temp = temp->suivant;
        temp->show(++retcode,1);
    }
    return retcode;
}}}

personne * retrouverPersonne(personne & A, bool utiliser=true){{{
    //TODO on doit pouvoir chercher par numéro, quitte a le faire dans une ss fonction
    personne * p=NULL;
    personne * temp;
    int critere, age, numero, choix=-1;
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
        else if(utiliser) {
            while (choix<0||choix>numero) {
                if (numero==1) choix=1;
                else {
                    cout << "Entrez le numéro de la personne que vous cherchez, ou 0 pour recommencer :" << endl << "==>";
                    cin >> choix;
                }
                if (choix>0||choix<numero){
                    int cmpt=0;
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
        else sortie=true;
    }
    return p;
}}}

int ascendants(personne & pers){{{
    if (&pers==NULL) {
        cout << "Si on ne donne pas une personne à cette fonction, elle va avoir du mal à en trouver les ascendants !" << endl;
        return 1;
    }
    cout << endl << "\t\tAffichage des Ascendants de : "<< endl; // TODO nombre de \t cohérents
    personne * P[5][32];
    P[0][0] = &pers;
    P[0][0]->show();
    if (P[0][0]->pere != NULL){
        P[1][0] = P[0][0]->pere;
        cout << "père" << endl;
        P[1][0]->show();
        if (P[1][0]->pere !=NULL){
            P[2][0] = P[1][0]->pere;
            cout << "Grand père paternel" << endl;
            P[2][0]->show();
        }
        if (P[1][0]->mere !=NULL){
            P[2][1] = P[1][0]->mere;
            cout << "Grand mère paternelle" << endl;
            P[2][1]->show();
        }
    }
    if (P[0][0]->mere != NULL){
        P[1][1] = P[0][0]->mere;
        cout << "mère" << endl;
        P[1][1]->show();
        if (P[1][1]->pere !=NULL){
            P[2][2] = P[1][1]->pere;
            cout << "Grand père maternel" << endl;
            P[2][2]->show();
        }
        if (P[1][1]->mere !=NULL){
            P[2][3] = P[1][1]->mere;
            cout << "Grand mère maternelle" << endl;
            P[2][3]->show();
        }
    }
    return 0;
}}}

int enfants(personne & A, personne & pers) {{{
    personne * P = &pers;
    if (P==NULL) {
        cout << "Si on ne donne pas une personne à cette fonction, elle va avoir du mal à en trouver les enfants !" << endl;
        return 1;
    }
    cout << endl << "\t\tAffichage des enfants de : "<< endl; // TODO nombre de \t cohérents
    P->show();

    int retcode=0;
    personne * temp = &A;
    while (temp->suivant !=NULL){
        temp = temp->suivant;
        if (temp==P) temp->show(++retcode,1);
    }
    return retcode;
}}}

int main(){{{
    personne * A = creerArbreInitial();

    cout << "\t\t\t Arbre" << endl;
    afficherArbre(*A);

    cout << "\t\t\t ascendants d’une personne recherchée" << endl;
    ascendants(*retrouverPersonne(*A));

    cout << "\t\t\t enfants d’une personne recherchée" << endl;
    enfants(*A,*retrouverPersonne(*A));

    cout << "\t\t\t Ajout personne " << endl;
    ajouterPersonne(*A);
    cout << "\t\t\t Arbre " << endl;
    afficherArbre(*A);
}}}

// vim: set foldmethod=marker:
