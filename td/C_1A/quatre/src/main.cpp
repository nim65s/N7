#include <iostream>
#include <cstdio>

using namespace std;

typedef struct
{
    float re;
    float im;
} complexe;

class vecteur
{
    public:
    int n;
    float coef[100];
    void afficher()
    {
        cout << "[";
        for(int i=0;i<n;i++)
        {
            printf("%5.2g",coef[i]);
        }
        cout << "    ]" << endl;
    }
};

class matrice
{
    public:
    int n;
    int m;
    float coef[100][100];
    void afficher()
    {
        cout << "⎡";
        for(int j=0;j<m;j++)
        {
            printf("%5.2g",coef[0][j]);
            cout << " ";
        }
        cout << "  ⎤" << endl;
        for(int i=1;i<n-1;i++)
        {
            cout << "⎢";
            for(int j=0;j<m;j++)
            {
                printf("%5.2g",coef[i][j]);
                cout << " ";
            }
            cout << "  ⎥" << endl;
        }
        cout << "⎣";
        for(int j=0;j<m;j++)
        {
            printf("%5.2g",coef[n-1][j]);
            cout << " ";
        }
        cout << "  ⎦" << endl;
    }
};

vecteur vecteuruna(int n)                   // vecteur unite, dimension n
{
    vecteur v;
    v.n = n;
    for(int i=0;i<n;i++)
    {
        v.coef[i] = 1.0;
    }
    return v;
}

void vecteurunb(int n, vecteur &v)          // vecteur unite, dimension n, avec reference
{
    v.n = n;
    for(int i=0;i<n;i++)
    {
        v.coef[i] = 1.0;
    }
}

matrice matriceunitea(int n)                // matrice I, dimension n²
{
    matrice M;
    M.n = n;
    M.m = n;
    for(int i=0;i<n;i++)
    {
        for(int j=0;j<n;j++)
        {
            if (i==j)
            {
                M.coef[i][j] = 1.0;
            }
            else
            {
                M.coef[i][j] = 0.0;
            }
        }
    }
    return M;
}

matrice matriceuniteb(int n, matrice &M)    // matrice I, dimension n², avec référence
{
    M.n=n;
    M.m=n;
    for(int i=0;i<n;i++)
    {
        for(int j=0;j<n;j++)
        {
            if (i==j)
            {
                M.coef[i][j] = 1.0;
            }
            else
            {
                M.coef[i][j] = 0.0;
            }
        }
    }
}

matrice desxpartout(int n,float x)          // matrice I, dimension n²
{
    matrice M;
    M.n = n;
    M.m = n;
    for(int i=0;i<n;i++)
    {
        for(int j=0;j<n;j++)
        {
            M.coef[i][j] = x;
        }
    }
    return M;
}

matrice sousdiagonale(int n, float x)       // matrice sous diagonale, dimension n
{
    matrice M;
    M.n = n;
    M.m = n;
    for(int i=0;i<n;i++)
    {
        for(int j=0;j<n;j++)
        {
            if(i==j+1)
            {
                M.coef[i][j] = x;
            }
            else
            {
                M.coef[i][j] = 0;
            }
        }
    }
    return M;
}

matrice surdiagonale(int n, float x)        // matrice sur diagnoale, dimension n
{
    matrice M;
    M.n = n;
    M.m = n;
    for(int i=0;i<n;i++)
    {
        for(int j=0;j<n;j++)
        {
            if(i==j-1)
            {
                M.coef[i][j] = x;
            }
            else
            {
                M.coef[i][j] = 0;
            }
        }
    }
    return M;
}

bool operator==(vecteur a, vecteur b)       // Definition de l'operateur == pour vecteur
{
    if (a.n != b.n)
    {
        return false;
    }
    else
    {
        for(int i=0;i<a.n;i++)
        {
            if (a.coef[i] != b.coef[i])
            {
                return false;
            }
        }
    }
    return true;
}

bool operator==(matrice A, matrice B)       // Definition de l'operateur == pour matrice
{
    if( A.n != B.n || A.m != B.m)
    {
        return false;
    }
    else
    {
        for(int i=0;i<A.n;i++)
        {
            for(int j=0;j<A.m;j++)
            {
                if (A.coef[i][j] != B.coef[i][j])
                {
                    return false;
                }
            }
        }
    }
    return true;
}

vecteur mult1(float a, vecteur b)           // multiplication de float et de vecteur
{
    for(int i=0;i<b.n;i++)
    {
        b.coef[i] = a*b.coef[i];
    }
    return b;
}

void mult2(float a, vecteur b, vecteur &c)  // multiplication de float et de vecteur, w/ reference
{
    c.n = b.n;
    for(int i=0;i<b.n;i++)
    {
        c.coef[i] = a*b.coef[i];
    }
}

vecteur operator*(float a, vecteur b)       // operateur multiplication float et vecteur
{
    vecteur v;
    v.n = b.n;
    for(int i=0;i<b.n;i++)
    {
        v.coef[i] = a*b.coef[i];
    }
    return v;
}

vecteur operator*(matrice M, vecteur v)     // operateur multiplication matrice et vecteur
{
    if (M.m != v.n)
    {
        cout << "Erreur. Je ne me plierai pas, et ne multiplierai pas non plus." << endl;
        return v;
    }
    vecteur w;
    w.n = M.n;
    for(int i=0;i<M.n;i++)
    {
        w.coef[i] = 0;
        for(int j=0;j<M.m;j++)
        {
            w.coef[i] += v.coef[j]*M.coef[i][j];
        }
    }
    return w;
}

matrice operator*(matrice M, matrice N)     // operateur multiplication de matrices
{
    if(M.m != N.n)
    {
        cout << "echec" << endl;
        return M;
    }
    matrice X;
    X.m = N.m;
    X.n = M.n;
    for(int i=0;i<X.n;i++)
    {
        for(int j=0;j<X.m;j++)
        {
            X.coef[i][j] = 0;
            for(int k=0;k<M.m;k++)
            {
                X.coef[i][j] += M.coef[i][k]*N.coef[k][j];
            }
        }
    }
    return X;
}

vecteur operator*(vecteur v, vecteur w)     // operateur multiplication termes à termes sur des vecteurs
{
    if (v.n != w.n)
    {
        cout << "multiplication de ces vecteurs impossible : mauvaise dimension" << endl;
        return v;
    }
    vecteur x;
    x.n = v.n;
    for(int i=0;i<x.n;i++)
    {
        x.coef[i] = v.coef[i] * w.coef[i];
    }
    return x;
}

vecteur operator+(vecteur v, vecteur w)     // operateur addition de vecteurs
{
    if (v.n != w.n)
    {
        cout << "Erreur, les deux vecteurs n'ont pas la meme dimension. " << endl;
    }
    vecteur u;
    u.n = v.n;
    for(int i=0;i<v.n;i++)
    {
        u.coef[i] = v.coef[i]+w.coef[i];
    }
    return u;
}

matrice operator+(matrice M, matrice N)     // operateur addition de matrices
{
    if(M.n != N.n || M.m != N.m)
    {
        cout << "faut des matrices de même dimension... " << endl;
    }
    matrice O;
    O.m = M.m;
    O.n = M.n;
    for(int i=0;i<O.n;i++)
    {
        for(int j=0;j<O.m;j++)
        {
            O.coef[i][j] = M.coef[i][j] + N.coef[i][j];
        }
    }
    return O;
}

vecteur operator-(vecteur v, vecteur w)     // operateur soustraction de vecteurs
{
    if (v.n != w.n)
    {
        cout << "Erreur, les deux vecteurs n'ont pas la meme dimension. " << endl;
    }
    vecteur u;
    u.n = v.n;
    for(int i=0;i<v.n;i++)
    {
        u.coef[i] = v.coef[i]-w.coef[i];
    }
    return u;
}

matrice operator-(matrice M, matrice N)     // operateur soustraction de matrices
{
    if(M.n != N.n || M.m != N.m)
    {
        cout << "faut des matrices de même dimension... " << endl;
    }
    matrice O;
    O.m = M.m;
    O.n = M.n;
    for(int i=0;i<O.n;i++)
    {
        for(int j=0;j<O.m;j++)
        {
            O.coef[i][j] = M.coef[i][j] - N.coef[i][j];
        }
    }
    return O;
}

float operator&(vecteur v, vecteur w)       // operateur produit scalaire de vecteurs
{
    if (v.n != w.n)
    {
        cout << "Erreur, les deux vecteurs n'ont pas la meme dimension. " << endl;
    }
    float u=0;
    for(int i=0;i<v.n;i++)
    {
        u += v.coef[i]*w.coef[i];
    }
    return u;
}

vecteur vdiagonale(matrice M)               // Renvoie la diagonale d'une matrice
{
    if (M.n != M.m)
    {
        cout << "Je fais comment pour trouver la diagonale d'une matrice qui n'est pas carrée ? -_-' " << endl;
    }
    vecteur v;
    v.n=M.n;
    for(int i=0;i<v.n;i++)
    {
        v.coef[i] = M.coef[i][i];
    }
    return v;
}

matrice diagonale(matrice M)                // Renvoie la matrice diagonale
{
    if(M.n != M.m)
    {
        cout << "Matrice pas carrée" << endl;
    }
    matrice N;
    N.m = M.m;
    N.n = M.n;
    for(int i=0;i<M.n;i++)
    {
        for(int j=0;j<M.n;j++)
        {
            if(i==j)
            {
                N.coef[i][j] = M.coef[i][j];
            }
            else
            {
                N.coef[i][j] = 0;
            }
        }
    }
    return N;
}

matrice diagonaleinverse(matrice M)         // Renvoie l'inverse de la matrice diagonale
{
    if(M.n != M.m)
    {
        cout << "Matrice pas carrée" << endl;
    }
    matrice N;
    N.m = M.m;
    N.n = M.n;
    for(int i=0;i<M.n;i++)
    {
        for(int j=0;j<M.n;j++)
        {
            if(i==j)
            {
                N.coef[i][j] = 1/M.coef[i][j];
            }
            else
            {
                N.coef[i][j] = 0;
            }
        }
    }
    return N;
}

matrice triangleinf(matrice M)              // Renvoie la matrice triangulaire inférieure
{
    if(M.n != M.m)
    {
        cout << "Matrice pas carrée" << endl;
        return M;
    }
    matrice N;
    N.n = M.n;
    N.m = M.n;
    for(int i=0;i<M.n;i++)
    {
        for(int j=0;j<M.n;j++)
        {
            if(i>j)
            {
                N.coef[i][j] = M.coef[i][j];
            }
            else
            {
                N.coef[i][j] = 0;
            }
        }
    }
    return N;
}

matrice trianglesup(matrice M)              // Renvoie la matrice triangulaire supérieure
{
    if(M.n != M.m)
    {
        cout << "Matrice pas carrée" << endl;
        return M;
    }
    matrice N;
    N.n = M.n;
    N.m = M.n;
    for(int i=0;i<M.n;i++)
    {
        for(int j=0;j<M.n;j++)
        {
            if(i<j)
            {
                N.coef[i][j] = M.coef[i][j];
            }
            else
            {
                N.coef[i][j] = 0;
            }
        }
    }
    return N;
}

vecteur resolution(matrice A, vecteur b, float residu)
{
    if (A.m != A.n || A.n != b.n)
    {
        cout << "On travaille en dimension N" << endl;
        return b;
    }
    for(int i=0;i<A.n;i++) // Faut pas de 0 dans la diagonale
    {
        if (A.coef[i][i] == 0)
        {
            cout << "Matrice non inversible" << endl;
            return b;
        }
    }

    vecteur x;
    vecteur D;
    matrice E;
    matrice F;
    float r;
    x.n = A.n;
    for(int i=0;i<x.n;i++) // initialisation x_0 = 0
    {
        x.coef[i] = 0;
    }
    D = vdiagonale(diagonaleinverse(A));
    E = trianglesup(A);
    F = triangleinf(A);

    r = (b - A*x)&(b - A*x);

    while (r > residu*residu)
    {
        x = D*(b-(E+F)*x);
        r = (b - A*x)&(b - A*x);
        cout << "résidu au carré : " << r << "\t";
        x.afficher();
    }
    return x;
}

vecteur resolutionplusloin(matrice A, vecteur b, float residu)
{
    if (A.m != A.n || A.n != b.n)
    {
        cout << "On est en dimension N" << endl;
        return b;
    }
    for(int i=0;i<A.n;i++) // Faut pas de 0 dans la diagonale
    {
        if (A.coef[i][i] == 0)
        {
            cout << "Matrice non inversible" << endl;
            return b;
        }
    }

    vecteur x;
    vecteur D;
    matrice E;
    matrice F;
    float r;
    vecteur rv;
    x.n = A.n;
    for(int i=0;i<x.n;i++) // initialisation x_0 = 0
    {
        x.coef[i] = 0;
    }
    D = vdiagonale(diagonaleinverse(A));
    E = trianglesup(A);
    F = triangleinf(A);

    r = (b - A*x)&(b - A*x);

    while (r > residu*residu)
    {
        rv = b - A*x;
        x = x + (( rv & rv )/( A*rv & rv ))*rv;
        r = (b - A*x)&(b - A*x);
        cout << "résidu au carré : " << r << "\t";
        x.afficher();

    }
    return x;
}

int main()
{
    bool test=false;
    if (test)
    {
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
        {
            cout << "un a et un b identiques" << endl;
        }
        mult2(a,v,w);
        if ( mult1(a,v) == w)
        {
            cout << "mult1 et mult2 identiques " << endl;
        }
        if ( a*v == w )
        {
            cout << "mult2 et * identiques" << endl;
        }
        if (matriceunitea(5) == M)
        {
            cout << "matriceunitea et matriceuniteb identiques" << endl;
        }
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
        {
            cout << " E est égale à A " << endl;
        }

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
    }
    else
    {
        int taille = 14;
        matrice A;
        vecteur x;
        vecteur b;
        A = matriceunitea(taille);
        b.n = taille;
        for(int i=0;i<taille;i++)
        {
            b.coef[i] = i+1;
        }

        cout << endl;
        A.afficher();
        b.afficher();
        cout << endl;
        x = resolution(A,b,0.0001);
        x.afficher();

        cout << endl;
        matrice B;
        B = sousdiagonale(taille,-1) + surdiagonale(taille,-1)+ matriceunitea(taille)+ matriceunitea(taille)+ matriceunitea(taille)+ matriceunitea(taille)+ matriceunitea(taille);

        vecteur y;
        B.afficher();
        b.afficher();
        cout << endl;
        y = resolution(B,b,0.0001);
        y.afficher();

        cout << endl;
        matrice C;
        //C = sousdiagonale(taille,-1) + surdiagonale(taille,-1)+ matriceunitea(taille)+ matriceunitea(taille);
        C = sousdiagonale(taille,-1) + surdiagonale(taille,-1)+ matriceunitea(taille)+ matriceunitea(taille)+ matriceunitea(taille)+ matriceunitea(taille)+ matriceunitea(taille);
        vecteur z;
        C.afficher();
        b.afficher();
        cout << endl;
        z = resolutionplusloin(C,b,0.0001);
        cout << "z ";
        z.afficher();
        cout << "y ";
        y.afficher();
    }
}
