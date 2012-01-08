#include <iostream>
#include <string.h>
#include <stdlib.h>
#include <cstdio>
#include <unistd.h>

using namespace std;

typedef struct personne {
    string nom;
    string prenom;
    bool genre;
    int age;
    personne * suivant;
    personne * pere;
    personne * mere;
    int show(int i=0, bool parents=0){
        if (i == 0) cout << "------------------------------------------" << endl;
        else if (i < 10 && i>0) cout << "--------------" << i << "---------------------------" << endl;
        else if (i < 100 && i>0) cout << "-------------" << i << "---------------------------" << endl;
        else if (i > 99 && i>0 ) cout << "------------" << i << "---------------------------" << endl;
        cout << "Nom :\t\t" << nom << endl;
        cout << "Prénom :\t" << prenom << endl;
        if (genre) cout << "Genre :\t\tHomme" << endl;
        else cout << "Genre :\t\tFemme" << endl;
        cout << "Âge :\t\t" << age << " ans" << endl;
        if (pere != NULL && parents){
            cout << "-----------PERE---------------------------" << endl;
            pere->show(-1);
        }
        if (mere != NULL && parents){
            cout << "-----------MERE---------------------------" << endl;
            mere->show(-1);
        }
        return 0;
    }
            
} personne;

int ajpers(personne & A, personne & P){
    personne * temp = &A;
    while (temp->suivant !=NULL) temp = temp->suivant;
    temp->suivant = &P;
    return 0;
}

int ajpersmanuel(personne &A){
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
    if (reponse == 'o' || reponse == 'O'){
        int num=0;
        int cmpt=0;
        cout << "Quel est son numero ? =>";
        cin >> num;
        personne * temp = &A;
        while (temp->suivant !=NULL && cmpt != num){
            cmpt++;
            temp = temp->suivant;
        }
        if (!temp->genre) cout << "Nan mais ça peut pas être son père, vu que c'est une femme !" << endl;
        P->pere=temp;
    }
    else P->pere = NULL;

    cout << "Ajouter une mère ? [o/N] =>";
    cin >> reponse;
    if (reponse == 'o' || reponse == 'O'){
        int num=0;
        int cmpt=0;
        cout << "Quel est son numero ? =>";
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
}

int afficherArbre( personne & A){
    cout << endl << "\t\tAffichage de l'arbre : "<< endl;
    int retcode=0;
    personne * temp = &A;
    while (temp->suivant !=NULL){
        temp = temp->suivant;
        temp->show(++retcode,1);
    }
    return retcode;
}

int retrouverPersonne(personne & A){
    cout << "\t\tRetrouvage de personne : "<< endl;
    int retcode=0;
    personne * temp = &A;
    int choix;
    cout << "Vous voulez chercher à partir de quelle donnée ?" << endl;
    cout << "1) nom" << endl;
    cout << "2) prenom" << endl;
    cout << "3) genre" << endl;
    cout << "4) age" << endl;
    cout << "==>";
    cin >> choix;
    switch (choix){
        case 1:{
            string nom;
            cout << "Entrez le nom de la personne" << endl << "==>";
            cin >> nom;
            
            while (temp->suivant !=NULL){
                temp = temp->suivant;
                if (!strcmp(nom.c_str(),temp->nom.c_str())) temp->show(++retcode);
            }
            break;}
        case 2:{
            string prenom;
            cout << "Entrez le prenom de la personne" << endl << "==>";
            cin >> prenom;
            
            while (temp->suivant !=NULL){
                temp = temp->suivant;
                if (!strcmp(prenom.c_str(),temp->prenom.c_str())) temp->show(retcode);
            }
            break;}
        case 3:{
            bool genre;
            cout << "Entrez 1 pour homme ou 0 pour femme (oui, c'est sexiste.)" << endl << "==>";
            cin >> genre;
            
            while (temp->suivant !=NULL){
                temp = temp->suivant;
                if (genre == temp->genre) temp->show(++retcode);
            }
            break;}
        case 4:{
            int age;
            cout << "Entrez l'age de la personne" << endl << "==>";
            cin >> age;
            
            while (temp->suivant !=NULL){
                temp = temp->suivant;
                if (age == temp->age) temp->show(++retcode);
            }
            break;}
    }
    return retcode;
}

int ascendants(personne & pers){
    cout << "---------ascendants----------" << endl;
    personne * P[5][32];
    P[0][0] = &pers;
    if (P[0][0]->pere != NULL){
        P[1][0] = P[0][0]->pere;
        cout << "pere" << endl;
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
        cout << "mere" << endl;
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
}
/*    for(int i=1;i<=ngene;i++){
        pere
*/




int main(){
    personne * A = new personne;
    A->suivant = NULL;

    personne * papip = new personne;
    papip->nom = "Saurel";
    papip->prenom = "Pierre";
    papip->genre = 1;
    papip->age = 80;

    ajpers(*A,*papip);

    personne * mamiep = new personne;
    mamiep->nom = "Saurel";
    mamiep->prenom = "Juliette";
    mamiep->genre = 0;
    mamiep->age = 80;

    ajpers(*A,*mamiep);

    personne * papa = new personne;
    papa->nom = "Saurel";
    papa->prenom = "Philippe";
    papa->genre = 1;
    papa->age = 50;
    papa->pere = papip;
    papa->mere = mamiep;
    
    ajpers(*A,*papa);

    personne * papim = new personne;
    papim->nom = "Dujols";
    papim->prenom = "André";
    papim->genre = 1;
    papim->age = 85;

    ajpers(*A,*papim);

    personne * mamiem = new personne;
    mamiem->nom = "Dujols";
    mamiem->prenom = "Luce";
    mamiem->genre = 0;
    mamiem->age = 82;

    ajpers(*A,*mamiem);

    personne * maman = new personne;
    maman->nom = "Dujols";
    maman->prenom = "Christine";
    maman->genre = 1;
    maman->age = 55;
    maman->pere = papim;
    maman->mere = mamiem;
    
    ajpers(*A,*maman);

    personne * tonton = new personne;
    tonton->nom = "Lucquet";
    tonton->prenom = "Dominique";
    tonton->age = 45;
    tonton->genre = 1;

    ajpers(*A,*tonton);

    personne * tata = new personne;
    tata->nom = "Dujols";
    tata->prenom = "Françoise";
    tata->age = 42;
    tata-> genre = 0;
    tata->pere = papim;
    tata->mere = mamiem;

    ajpers(*A,*tata);

    personne * cousin = new personne;
    cousin->nom = "Dujols-Lucquet";
    cousin->prenom = "Arthur";
    cousin->age = 12;
    cousin->genre = 1;
    cousin->pere = tonton;
    cousin->mere = tata;

    ajpers(*A,*cousin);
    
    personne * moi = new personne;
    moi->nom = "Saurel-Dujols";
    moi->prenom = "Guilhem";
    moi->age = 20;
    moi->genre = 1;
    moi->pere = papa;
    moi->mere = maman;

    ajpers(*A,*moi);

    personne * frerot = new personne;
    frerot->nom = "Saurel-Dujols";
    frerot->prenom = "Luc";
    frerot->age = 19;
    frerot->genre = 1;
    frerot->pere = papa;
    frerot->mere = maman;

    ajpers(*A,*frerot);

    afficherArbre(*A);
    ascendants(*moi);

    //afficherArbre(*A);
    //ajpersmanuel(*A);
    //afficherArbre(*A);
}
