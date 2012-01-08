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
        }
        cout << "  ⎤" << endl;
        for(int i=1;i<n-1;i++)
        {
            cout << "⎢";
            for(int j=0;j<m;j++)
            {
                printf("%5.2g",coef[i][j]);
            }
            cout << "  ⎥" << endl;
        }
        cout << "⎣";
        for(int j=0;j<m;j++)
        {
            printf("%5.2g",coef[n-1][j]);
        }
        cout << "  ⎦" << endl;
    }
};

vecteur vecteuruna(int n) // vecteur unite, dimension n
{
    vecteur v;
    v.n = n;
    for(int i=0;i<n;i++)
    {
        v.coef[i] = 1.0;
    }
    return v;
}

void vecteurunb(int n, vecteur &v) // vecteur unite, dimension n, avec reference
{
    v.n = n;
    for(int i=0;i<n;i++)
    {
        v.coef[i] = 1.0;
    }
}

matrice matriceunitea(int n) // matrice I, dimension n²
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

matrice matriceuniteb(int n, matrice &M) // matrice I, dimension n², avec référence
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

bool operator==(vecteur a, vecteur b) // Definition de l'operateur == pour vecteur
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

bool operator==(matrice A, matrice B)
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

vecteur mult1(float a, vecteur b) // multiplication de float et de vecteur
{
    for(int i=0;i<b.n;i++)
    {
        b.coef[i] = a*b.coef[i];
    }
    return b;
}

void mult2(float a, vecteur b, vecteur &c) // multiplication de float et de vecteur, w/ reference
{
    c.n = b.n;
    for(int i=0;i<b.n;i++)
    {
        c.coef[i] = a*b.coef[i];
    }
}

vecteur operator*(float a, vecteur b) // operateur multiplication float et vecteur
{
    vecteur v;
    v.n = b.n;
    for(int i=0;i<b.n;i++)
    {
        v.coef[i] = a*b.coef[i];
    }
    return v;
}

vecteur operator*(matrice M, vecteur v)
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

int main()
{
    int n=5;
    int a=2.0;
    bool test=false;
    vecteur v;
    vecteur w;
    vecteurunb(n,v);
    matrice M;
    matrice N;
    matriceuniteb(5,M);
    M.afficher();

    if (test)
    {
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
    
}
