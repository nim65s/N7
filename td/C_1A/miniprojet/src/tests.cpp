#include <iostream>
#include <cstdio>
#include <string>
#include "matrices.h"
#include "historique.h"

using namespace std;

int test_conversions(bool const & afficher) {{{
    cout << "\tTest conversions entre matrices" << endl;
    matricepleine B(5, 5, 12);
    B.coef[0][0].re = 1.1;
    B.coef[0][3].re = 4;
    B.coef[1][0].re = 5;
    B.coef[1][1].re = 2.2;
    B.coef[1][3].re = 7;
    B.coef[2][0].re = 6;
    B.coef[2][2].re = 3.3;
    B.coef[2][3].re = 8;
    B.coef[2][4].re = 9;
    B.coef[3][2].re = 11;
    B.coef[3][3].re = 10.1;
    B.coef[4][4].re = 12.7;
    if (afficher) B.afficher();
    if (afficher) cout << endl;

    matricecreuseun C(B.versun());
    if (afficher) C.afficher();
    if (afficher) cout << endl;

    matricecreusedeux D(B.versdeux());
    if (afficher) D.afficher();
    if (afficher) cout << endl;

    matricecreusedeux E(C.versdeux());
    if (afficher) E.afficher();
    if (afficher) cout << endl;

    matricecreuseun F(versun(E));
    if (afficher) F.afficher();

    if (D==E && C==F) return 0;
    return 1; 
}}}

int test_produits(bool const & afficher) {{{
    if (afficher) cout << "\tTest produit pleine*vecteur" << endl;
    else cout << "\t Test produits" << endl;
    matricepleine A(5, 5, 4);
    for (int i(0);i<A.m;i++) A.coef[i][i].re = i; 
    if (afficher) A.afficher();
    if (afficher) cout << "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" << endl;
    vecteur v(5);
    for (int i(0);i<5;i++) v.coef[i].re = i;
    if (afficher) v.afficher();
    if (afficher) cout << "====================================================================" << endl;
    vecteur x(A*v);
    if (afficher) x.afficher();

    if (afficher) cout << "\tTest produit creuseun*vecteur" << endl;
    matricecreuseun E(A.versun());
    if (afficher) E.afficher();
    if (afficher) cout << "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" << endl;
    if (afficher) v.afficher();
    if (afficher) cout << "====================================================================" << endl;
    vecteur y(E*v);
    if (afficher) y.afficher();

    if (afficher) cout << "\tTest produit creusedeux*vecteur" << endl;
    matricecreusedeux F(A.versdeux());
    if (afficher) F.afficher();
    if (afficher) cout << "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" << endl;
    if (afficher) v.afficher();
    if (afficher) cout << "====================================================================" << endl;
    vecteur z(F*v);
    if (afficher) z.afficher();
    if (x==y && x==z && !(y!=z)) cout << "OK" << endl;

    matricepleine G(5, 5, 12);
    G.coef[0][0].re = 1.1;
    G.coef[0][3].re = 4;
    G.coef[1][0].re = 5;
    G.coef[1][1].re = 2.2;
    G.coef[1][3].re = 7;
    G.coef[2][0].re = 6;
    G.coef[2][2].re = 3.3;
    G.coef[2][3].re = 8;
    G.coef[2][4].re = 9;
    G.coef[3][2].re = 11;
    G.coef[3][3].re = 10.1;
    G.coef[4][4].re = 12.7;
    if (afficher) G.afficher();
    if (afficher) cout << "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" << endl;
    vecteur V(5);
    V.coef[0].re = 1;
    if (afficher) V.afficher();
    if (afficher) cout << "====================================================================" << endl;
    x = G*V;
    if (afficher) x.afficher();

    if (afficher) cout << "\tTest produit creuseun*vecteur" << endl;
    E = G.versun();
    if (afficher) E.afficher();
    if (afficher) cout << "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" << endl;
    if (afficher) V.afficher();
    if (afficher) cout << "====================================================================" << endl;
    y = E*V;
    if (afficher) y.afficher();

    if (afficher) cout << "\tTest produit creusedeux*vecteur" << endl;
    F = G.versdeux();
    if (afficher) F.afficher();
    if (afficher) cout << "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" << endl;
    if (afficher) V.afficher();
    if (afficher) cout << "====================================================================" << endl;
    z = F*V;
    if (afficher) z.afficher();


    if (x==y && x==z && !(y!=z)) return 0;
    return 1;
}}}

int test_ordonnage(bool const & afficher) {{{
    cout << "\tTest ordonnage" << endl;
    matricecreuseun A(5, 5, 4);
    for (int i(0);i<4;i++) {
        A.i[i] = i+1;
        A.j[i] = i+1;
        A.coef[i].re = i+1;
    }
    if (afficher) A.afficher();
    if (A.estenbordel()) {
        if (afficher) cout << "A est en bordel..." << endl;
        return 1;
    }
    else if (afficher) cout << "A est en ordre" << endl;

    matricecreuseun B(5, 5, 2);
    B.i[0] = 4;
    B.j[0] = 2;
    B.coef[0].re = 42;
    B.i[1] = 2;
    B.j[1] = 4;
    B.coef[1].re = 24;
    if (afficher) B.afficher();
    if (!B.estenbordel()) {
        if (afficher) cout << "B est en ordre..." << endl;
        return 1;
    }
    else if (afficher) cout << "B est en bordel" << endl;

    matricecreuseun C(B.ordonne());
    if (afficher) C.afficher();
    if (C.estenbordel()) {
        if (afficher) cout << "B est en bordel..." << endl;
        return 1;
    }
    else if (afficher) cout << "B est en ordre" << endl;

    return 0;
}}}

int test_fichiers(bool const & afficher) {{{
    matricecreuseun A(lireun("../test.mx", false));
    if (afficher) {
        cout << endl << "\tA" << endl;
        A.afficher();
    }
    matricecreuseun B(A.ordonne());
    if (afficher) {
        cout << endl << "\tB" << endl;
        B.afficher();
    }
    B.ecrire("B");
    matricecreusedeux C(B.versdeux());
    if (afficher) {
        cout << endl << "\tC" << endl;
        C.afficher();
    }
    C.ecrire("C");
    matricecreusedeux D(liredeux("C", true));
    if (afficher) {
        cout << endl << "\tD" << endl;
        D.afficher();
    }
    if (D == C) return 0;
    return 1;
}}}

int test_historique(bool const & afficher) {{{
    if (afficher) cout << "TODO" << endl;
    return 0;
}}}

// vim: set foldmethod=marker:
