#include <iostream>
#include <cstdio>
#include <assert.h>
#include "complexe.h"
#include "vecteur.h"
#include "matrice.h"

using namespace std;

matrice::matrice(int const & a) : n(a), m(a) {{{
    assert(a>0);
    //coef = new complexe[100][100];
}}}

matrice::matrice(int const & a, int const & b) : n(a), m(b) {{{
    assert(a>0 && b>0);
    //coef = new complexe[100][100];
}}}

matrice::matrice(matrice const & M) : n(M.n), m(M.m) {{{
    //coef = new complexe[100][100];
    for(int i=0;i<n;i++) for(int j=0;j<m;j++) coef[i][j] = M.coef[i][j];
}}}

matrice::~matrice() {{{
    //delete coef;
}}}

void matrice::afficher() {{{
    cout << "T";
    for(int j=0;j<m;j++) {
        coef[0][j].afficher();
        cout << " ";
    }
    cout << "  T" << endl;
    for(int i=1;i<n-1;i++) {
        cout << "|";
        for(int j=0;j<m;j++) {
            coef[i][j].afficher();
            cout << " ";
        }
        cout << "  |" << endl;
    }
    cout << "L";
    for(int j=0;j<m;j++) {
        coef[n-1][j].afficher();
        cout << " ";
    }
    cout << "  J" << endl;
}}}

matrice matriceunitea(int n) {{{              // matrice I, dimension n²
    matrice M(n);
    for(int i=0;i<n;i++) {
        for(int j=0;j<n;j++) {
            if (i==j) M.coef[i][j] = 1.0;
            else M.coef[i][j] = 0.0;
        }
    }
    return M;
}}}

matrice matriceuniteb(int n, matrice &M) {{{  // matrice I, dimension n², avec référence
    assert(n>0);
    M.n=n;
    M.m=n;
    for(int i=0;i<n;i++) {
        for(int j=0;j<n;j++) {
            if (i==j) M.coef[i][j] = 1.0;
            else M.coef[i][j] = 0.0;
        }
    }
}}}

matrice desxpartout(int n,float x) {{{        // matrice avec le même chiffre partout, dimension n²
    matrice M(n);
    for(int i=0;i<n;i++) for(int j=0;j<n;j++) M.coef[i][j] = x;
    return M;
}}}

matrice sousdiagonale(int n, float x) {{{     // matrice sous diagonale, dimension n
    matrice M(n);
    for(int i=0;i<n;i++) {
        for(int j=0;j<n;j++) {
            if(i==j+1) M.coef[i][j] = x;
            else M.coef[i][j] = 0;
        }
    }
    return M;
}}}

matrice surdiagonale(int n, float x) {{{      // matrice sur diagnoale, dimension n
    matrice M(n);
    for(int i=0;i<n;i++) {
        for(int j=0;j<n;j++) {
            if(i==j-1) M.coef[i][j] = x;
            else M.coef[i][j] = 0;
        }
    }
    return M;
}}}

bool operator==(matrice A, matrice B) {{{     // Definition de l'operateur == pour matrice
    if( A.n != B.n || A.m != B.m) return false;
    else {
        for(int i=0;i<A.n;i++) {
            for(int j=0;j<A.m;j++) {
                if (A.coef[i][j] != B.coef[i][j])
                    return false;
            }
        }
    }
    return true;
}}}

matrice operator*(matrice M, matrice N) {{{   // operateur multiplication de matrices
    assert(M.m==N.n);
    matrice X(N.m,M.n);
    for(int i=0;i<X.n;i++) {
        for(int j=0;j<X.m;j++) {
            X.coef[i][j] = 0;
            for(int k=0;k<M.m;k++) X.coef[i][j] += M.coef[i][k]*N.coef[k][j];
        }
    }
    return X;
}}}

matrice operator+(matrice M, matrice N) {{{   // operateur addition de matrices
    assert(M.n == N.n && M.m == N.m);
    matrice O(M.m,M.n);
    for(int i=0;i<O.n;i++) for(int j=0;j<O.m;j++) O.coef[i][j] = M.coef[i][j] + N.coef[i][j];
    return O;
}}}

matrice operator-(matrice M, matrice N) {{{   // operateur soustraction de matrices
    assert(M.n != N.n || M.m != N.m);
    matrice O(M.m,M.n);
    for(int i=0;i<O.n;i++) for(int j=0;j<O.m;j++) O.coef[i][j] = M.coef[i][j] - N.coef[i][j];
    return O;
}}}

vecteur vdiagonale(matrice M) {{{             // Renvoie la diagonale d'une matrice
    assert(M.n==M.m);
    vecteur v(M.n);
    for(int i=0;i<v.n;i++) v.coef[i] = M.coef[i][i];
    return v;
}}}

matrice diagonale(matrice M) {{{              // Renvoie la matrice diagonale
    assert(M.n==M.m);
    matrice N(M.n);
    for(int i=0;i<M.n;i++) {
        for(int j=0;j<M.n;j++) {
            if(i==j) N.coef[i][j] = M.coef[i][j];
            else N.coef[i][j] = 0;
        }
    }
    return N;
}}}

matrice diagonaleinverse(matrice M) {{{       // Renvoie l'inverse de la matrice diagonale
    assert(M.n==M.m);
    matrice N(M.m);
    for(int i=0;i<M.n;i++) {
        for(int j=0;j<M.n;j++) {
            if(i==j){
                assert(M.coef[i][j]!=0);
                N.coef[i][j] = 1/M.coef[i][j];
            }
            else N.coef[i][j] = 0;
        }
    }
    return N;
}}}

matrice triangleinf(matrice M) {{{            // Renvoie la matrice triangulaire inférieure
    assert(M.n==M.m);
    matrice N(M.n);
    for(int i=0;i<M.n;i++) {
        for(int j=0;j<M.n;j++) {
            if(i>j) N.coef[i][j] = M.coef[i][j];
            else N.coef[i][j] = 0;
        }
    }
    return N;
}}}

matrice trianglesup(matrice M) {{{            // Renvoie la matrice triangulaire supérieure
    assert(M.n==M.m);
    matrice N(M.n);
    for(int i=0;i<M.n;i++) {
        for(int j=0;j<M.n;j++) {
            if(i<j) N.coef[i][j] = M.coef[i][j];
            else N.coef[i][j] = 0;
        }
    }
    return N;
}}}

vecteur operator*(matrice M, vecteur v) {{{   // operateur multiplication matrice et vecteur
    assert(M.m==v.n);
    vecteur w(M.n);
    for(int i=0;i<M.n;i++) {
        w.coef[i] = 0;
        for(int j=0;j<M.m;j++) w.coef[i] += v.coef[j]*M.coef[i][j];
    }
    return w;
}}}

// vim: set foldmethod=marker :
