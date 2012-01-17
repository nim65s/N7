#include <iostream>
#include <cstdio>
#include <string>
#include <cmath>
#include <assert.h>
#include "matrices.h"
#include "historique.h"

using namespace std;

int algo(matricecreuseun const & A, bool const & afficher) {{{
    cout << "\tDébut de l'algorithme" << endl;
    assert(!A.estenbordel());
	int i,k(0);
    complexe lambda(1), temp(2);
    vecteur q(A.m), x(A.m), u(A.m);
    q.coef[0].re = 1; 
    if (afficher) {
        cout << "Matrice initiale : " << endl;
        A.afficher();
        cout << "Vecteur initial : " << endl;
        q.afficher();
        cout << endl;
    }

    // L'algorithme s'arrète si la solution a été trouvée ou si le calcul est trop long
    //while ((temp-lambda).norme() > 1e-5 && k<2000 ) {
    for(int z(0); z<5;z++) {
        //for (i=0;i<20;i++) { // On fait 20 itérations avant de revérifier le convergence
            x = A*q;
            q = x/x.norme();
        //}
        //k += 20;
        k++;

        if (afficher) {
            cout << endl << "x : " << endl;
            x.afficher();
            cout << "q : " << endl;
            q.afficher();
            printf("\n|temp-lambda| = %f", (temp-lambda).norme());
        }
    }
    if (k < 2000) {
        assert (x.norme()>0.000001); // On vérifie que norme(x) ne devient pas nulle pour ne pas diviser par 0
        // On cherche une composante de x exploitable au sens de l'algorithme
        for (i=0;i<q.n;i++) if (!q.coef[i].isnull()) {
            lambda=x.coef[i]/q.coef[i];
            i = q.n;
        }
        u=q*pow(lambda/lambda.norme(),k);
        printf("\nLa plus grande valeur propre est :");
        lambda.afficher();
        printf("\nUn vecteur propre associe est : ");
        u.afficher();
        printf("\n|temp-lambda| = %f", (temp-lambda).norme());
    }
    else {
        printf("Il n'y a pas de valeur propre ! \n");
        return 1;
    }
    return 0;
}}}

int algo(matricepleine const & A, bool const & afficher) {{{
    return algo(A.versun(), afficher);
}}}

int algo(matricecreusedeux const & A, bool const & afficher) {{{
    return algo(versun(A), afficher);
}}}


