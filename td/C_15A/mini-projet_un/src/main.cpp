#include <iostream>
#include <stdlib.h>
#include <math.h>

using namespace std;

int main(int argc, char *argv[]) {
    // Déclaration des classes et du nombre de lignes dans chaque classe, et initialisation à 0 des nombres de lignes
    int classes[10][100][2];
    int lignes[10][2];
    for(int j=0;j<2;j++) {
        for(int i=0;i<10;i++)
            lignes[i][j] = 0;
    }

    // On mets les arguments du programme dans les 10 classes pour la première fois,
    //     en incrémentant le nombre de lignes de chaque colonne du tableau, pour le tableau 0,
    // Et on calcule le nombre d'étapes qu'il y aura à faire
    int n(0);
    int temp;
    for(int i=1;i<argc;i++) { 
        temp = atoi(argv[i]);
        classes[temp % 10][lignes[temp % 10][0]++][0] = temp; // On met chaque nombre dans la classe correspondant à son chiffre des unités
        while (temp > pow(10,n)) n++;
    }

    // Affichage de l'état des classes après la premiètre étape
    cout << endl << "Classes à l'étape 0 : ";
    for(int i=0;i<10;i++) {
        cout << endl << "\t" << i << " : ";
        for(int j=0;j<lignes[i][0];j++)
            cout << classes[i][j][0] << " ";
    }
    cout << endl;

    // Puis, pour chaque étape supplémentaire, on prend les élément du tableau courant, et on les range dans l'autre
    //     tableau, suivant le principe des classes pour le Kième digit du nombre.
    // Pour cela, il faut réinitialiser le nombre de lignes de chaque colonne de l'autre tableau, et l'incrémenter
    //     au fur et à mesure.
    for(int k=1;k<=n;k++) {
        for(int i=0;i<10;i++)
            lignes[i][k%2] = 0;
        for(int i=0;i<10;i++){
            for(int j=0;j<lignes[i][(k+1)%2];j++) {
                temp = (int)floor(classes[i][j][(k+1)%2]/pow(10,k)) % 10; // Calcul du numéro de la nouvelle classe du nombre
                classes[temp][lignes[temp][k%2]++][k%2] = classes[i][j][(k+1)%2];
            }
        }
        // Affichage de l'état des classes pour le tableau courant
        cout << endl << "Classes à l'étape " << k << " : ";
        for(int i=0;i<10;i++) {
            cout << endl << "\t" << i << " : ";
            for(int j=0;j<lignes[i][k%2];j++)
                cout << classes[i][j][k%2] << " ";
        }
        cout << endl;
    }

    // Fin du programme
    cout << endl << "Voici vos nombres, triés comme il faut par un tri par distributions : " << endl;
    for(int j=0;j<lignes[0][n%2];j++)
        cout << classes[0][j][n%2] << " ";
    cout << endl;

    return 0;
}
