#include <iostream>
#include <cstdio>
#include <assert.h>
#include "complexe.h"
#include "vecteur.h"
#include "matrice.h"

using namespace std;

vecteur resolution(matrice A, vecteur b, float residu) {{{
    assert(A.m==A.n && A.n == b.n);
    complexe zero;
    cout << "t\t\t\t DEBUG : zero = ";
    zero.afficher();
    cout << endl;
    for(int i=0;i<A.n;i++) assert(A.coef[i][i]!=zero);

    vecteur x(A.n);
    vecteur D(A.n);
    matrice E(A.n);
    matrice F(A.n);
    float r;
    for(int i=0;i<x.n;i++) x.coef[i] = zero;
    D = vdiagonale(diagonaleinverse(A));
    E = trianglesup(A);
    F = triangleinf(A);

    r = ((b - A*x)&(b - A*x)).re;

    while (r > residu*residu) {
        x = D*(b-(E+F)*x);
        r = ((b - A*x)&(b - A*x)).re;
        cout << "résidu au carré : " << r << "\t";
        x.afficher();
    }
    return x;
}}}

vecteur resolutionplusloin(matrice A, vecteur b, float residu) {{{
    assert(A.m == A.n && A.n == b.n);
    complexe zero,temp;
    for(int i=0;i<A.n;i++) assert(A.coef[i][i] != zero);

    vecteur x(A.n);
    vecteur D(A.n);
    matrice E(A.n);
    matrice F(A.n);
    float r;
    vecteur rv(A.n);
    for(int i=0;i<x.n;i++) x.coef[i] = zero;
    D = vdiagonale(diagonaleinverse(A));
    E = trianglesup(A);
    F = triangleinf(A);

    r = ((b - A*x)&(b - A*x)).re;

    while (r > residu*residu) {
        rv = b - A*x;
        temp = ( rv & rv )/( A*rv & rv );
        x = x + temp*rv;
        r = ((b - A*x)&(b - A*x)).re;
        cout << "résidu au carré : " << r << "\t";
        x.afficher();

    }
    return x;
}}}

int main() {{{
    /*
    bool test=false;
    if (test) {{{
        int n=5;
        int a=2.0;
        vecteur v;
        vecteur w;
        vecteurunb(n,v);
        matrice M;
        matrice N;
        matriceuniteb(5,M);
        M.afficher();

        if (vecteuruna(n) == v)
            cout << "un a et un b identiques" << endl;
        mult2(a,v,w);
        if ( mult1(a,v) == w)
            cout << "mult1 et mult2 identiques " << endl;
        if ( a*v == w )
            cout << "mult2 et * identiques" << endl;
        if (matriceunitea(5) == M)
            cout << "matriceunitea et matriceuniteb identiques" << endl;
        N.n=2;
        N.m=4;
        N.coef[0][0] = 1;
        N.coef[0][1] = 2;
        N.coef[0][2] = 3;
        N.coef[0][3] = 4;
        N.coef[1][0] = 5;
        N.coef[1][1] = 6;
        N.coef[1][2] = 7;
        N.coef[1][3] = 8;

        N.afficher();

        vecteur x;
        x.n=4;

        x.coef[0]=0;
        x.coef[1]=1;
        x.coef[2]=2;
        x.coef[3]=3;

        x.afficher();

        vecteur y;
        y=N*x;

        y.afficher();
        cout << y.n << endl;

        cout << endl;
        
        matrice A;
        A.n=5;
        A.m=5;
        A.coef[0][0] = 1;
        A.coef[0][1] = 2;
        A.coef[0][2] = 3;
        A.coef[0][3] = 4;
        A.coef[0][4] = 5;
        A.coef[1][0] = 6;
        A.coef[1][1] = 7;
        A.coef[1][2] = 8;
        A.coef[1][3] = 9;
        A.coef[1][4] = 10;
        A.coef[2][0] = 11;
        A.coef[2][1] = 12;
        A.coef[2][2] = 13;
        A.coef[2][3] = 14;
        A.coef[2][4] = 15;
        A.coef[3][0] = 16;
        A.coef[3][1] = 17;
        A.coef[3][2] = 18;
        A.coef[3][3] = 19;
        A.coef[3][4] = 20;
        A.coef[4][0] = 21;
        A.coef[4][1] = 22;
        A.coef[4][2] = 23;
        A.coef[4][3] = 24;
        A.coef[4][4] = 25;
        matrice B;
        matrice C;
        matrice D;
        B = trianglesup(A);
        C = triangleinf(A);
        D = diagonale(A);
        cout << "matrice A" << endl;
        A.afficher();
        cout << "matrice triangulaire supérieure" << endl;
        B.afficher();
        cout << "matrice triangulaire inférieure" << endl;
        C.afficher();
        cout << "matrice diagonale" << endl;
        D.afficher();

        matrice E;
        E = B + C;
        E = E + D;
        E.afficher();

        if ( E == A)
            cout << " E est égale à A " << endl;

        matrice F;
        matrice G;
        matrice H;

        F.n = 2;
        F.m = 3;
        G.n = 3;
        G.m = 4;

        F.coef[0][0] = 1;
        F.coef[0][1] = 2;
        F.coef[0][2] = 3;
        F.coef[1][0] = 4;
        F.coef[1][1] = 5;
        F.coef[1][2] = 6;

        G.coef[0][0] = 7;
        G.coef[0][1] = 8;
        G.coef[0][2] = 9;
        G.coef[0][3] = 10;
        G.coef[1][0] = 11;
        G.coef[1][1] = 12;
        G.coef[1][2] = 13;
        G.coef[1][3] = 14;
        G.coef[2][0] = 15;
        G.coef[2][1] = 16;
        G.coef[2][2] = 17;
        G.coef[2][3] = 18;

        H = F*G;
        cout << "F" << endl;
        F.afficher();
        cout << "G" << endl;
        G.afficher();
        cout << "H" << endl;
        H.afficher();
    }}}
    else {{{*/
        cout << "begin" << endl;
        int taille = 14;
        matrice A(matriceunitea(taille));
        vecteur b(taille);
        for(int i=0;i<taille;i++) b.coef[i] = i+1;

        cout << endl;
        A.afficher();
        b.afficher();
        cout << endl;
        vecteur x(resolution(A,b,0.0001));
        x.afficher();

        cout << endl;
        matrice B(sousdiagonale(taille,-1) + surdiagonale(taille,-1)+ matriceunitea(taille)+ matriceunitea(taille)+ matriceunitea(taille)+ matriceunitea(taille)+ matriceunitea(taille));

        vecteur y(resolution(B,b,0.0001));
        B.afficher();
        b.afficher();
        cout << endl;
        y.afficher();

        cout << endl;
        matrice C(sousdiagonale(taille,-1) + surdiagonale(taille,-1)+ matriceunitea(taille)+ matriceunitea(taille)+ matriceunitea(taille)+ matriceunitea(taille)+ matriceunitea(taille));
        vecteur z(resolutionplusloin(C,b,0.0001));
        C.afficher();
        b.afficher();
        cout << endl;
        cout << "z ";
        z.afficher();
        cout << "y ";
        y.afficher();
    //}}}
}}}

// vim: set foldmethod=marker :
