#ifndef MATRICE_H_INCLUDED
#define MATRICE_H_INCLUDED

class matrice {
    public:
    int n;
    int m;
    complexe coef[100][100];

    matrice(int const & a);
    matrice(int const & a, int const & b);
    matrice(matrice const & M);
    ~matrice();

    void afficher();
};

matrice matriceunitea(int n);              // matrice I, dimension n²

matrice matriceuniteb(int n, matrice &M);  // matrice I, dimension n², avec référence

matrice desxpartout(int n,float x);        // matrice I, dimension n²

matrice sousdiagonale(int n, float x);     // matrice sous diagonale, dimension n

matrice surdiagonale(int n, float x);      // matrice sur diagnoale, dimension n

bool operator==(matrice A, matrice B);     // operateur égalité pour matrice

matrice operator*(matrice M, matrice N);   // operateur multiplication de matrices

matrice operator+(matrice M, matrice N);   // operateur addition de matrices

matrice operator-(matrice M, matrice N);   // operateur soustraction de matrices

vecteur vdiagonale(matrice M);             // Renvoie la diagonale d'une matrice

matrice diagonale(matrice M);              // Renvoie la matrice diagonale

matrice diagonaleinverse(matrice M);       // Renvoie l'inverse de la matrice diagonale

matrice triangleinf(matrice M);            // Renvoie la matrice triangulaire inférieure

matrice trianglesup(matrice M);            // Renvoie la matrice triangulaire supérieure

vecteur operator*(matrice M, vecteur v);   // operateur multiplication matrice et vecteur

#endif
