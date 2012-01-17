#ifndef MATRICES_H_INCLUDED
#define MATRICES_H_INCLUDED

#include <string>

class complexe {
    public:
        double re;
        double im;

        complexe();
        complexe(double const & a);
        complexe(double const & a, double const & b);
        complexe(complexe const & a);

        complexe & operator+=(complexe const & a);
        complexe & operator-=(complexe const & a);
        complexe & operator*=(complexe const & a);
        complexe & operator/=(complexe const & a);
        complexe & operator*=(double const & x);
        complexe & operator/=(double const & x);

        void afficher() const;
        bool isnull() const ;
        double norme() const ;
};
bool operator==(complexe const & a, complexe const & b);
bool operator!=(complexe const & a, complexe const & b);
complexe operator*(complexe const & a, complexe const & b);
complexe operator*(complexe a, double const & b);
complexe operator/(complexe const & a, complexe const & b);
complexe operator/(complexe a, double const & b);
complexe operator+(complexe a, complexe const & b);
complexe operator-(complexe a, complexe const & b);
complexe pow(complexe const & a, int const & b);
complexe conjugue(complexe & a);

class vecteur {
    public:
        int n;
        complexe * coef;

        vecteur(int const & dim);
        vecteur(vecteur const & v);
        vecteur & operator=(vecteur const & a);
        ~vecteur();

        void afficher() const;
        double norme() const;
};
bool operator==(vecteur const & a, vecteur const & b);
bool operator!=(vecteur const & a, vecteur const & b);
vecteur operator*(vecteur const & v, double const & x);
vecteur operator*(vecteur v, complexe const & a);
vecteur operator/(vecteur v, double const & x);

class matricecreusedeux {
    public:
        int m;
        int n;
        int nz;
        complexe * vals;
        int * j;
        int * II;

        matricecreusedeux(int const & lig, int const & col, int const & nzv);
        matricecreusedeux(matricecreusedeux const & A);
        matricecreusedeux & operator=(matricecreusedeux const & A);
        ~matricecreusedeux();

        void afficher() const;
        int ecrire() const;
        int ecrire(std::string const & file) const;
};
bool operator==(matricecreusedeux const & A, matricecreusedeux const & B);
bool operator!=(matricecreusedeux const & A, matricecreusedeux const & B);
vecteur operator*(matricecreusedeux const & M, vecteur const & v);
matricecreusedeux liredeux(bool const & comp);
matricecreusedeux liredeux(std::string const & file, bool const & comp);

class matricecreuseun {
    public:
        int m;
        int n;
        int nz;
        int * i;
        int * j;
        complexe * coef;

        matricecreuseun(int const & lig, int const & col, int const & nzv);
        matricecreuseun(matricecreuseun const & A);
        matricecreuseun & operator=(matricecreuseun const & A);
        ~matricecreuseun();

        void afficher() const;
        bool estenbordel() const;
        matricecreuseun ordonne() const;
        matricecreusedeux versdeux() const;
        int ecrire() const;
        int ecrire(std::string const & file) const;
};
bool operator==(matricecreuseun A, matricecreuseun B);
bool operator!=(matricecreuseun const & A, matricecreuseun const & B);
vecteur operator*(matricecreuseun const & M, vecteur const & v);
matricecreuseun lireun(bool const & comp);
matricecreuseun lireun(std::string const & file, bool const & comp);
matricecreuseun versun(matricecreusedeux const & A);

class matricepleine {
    public:
        int m;
        int n;
        int nz;
        //complexe * coef; TODO : coef[m] ? coef[m][n] ?
        complexe coef[10][10];
        
        matricepleine();
        matricepleine(int const & lig, int const & col, int const & nzv);
        matricepleine(matricepleine const & A);
        matricepleine & operator=(matricepleine const & A);
        ~matricepleine();
        
        void afficher() const;
        matricecreuseun versun() const;
        matricecreusedeux versdeux() const;
};
bool operator==(matricepleine const & A, matricepleine const & B);
bool operator!=(matricepleine const & A, matricepleine const & B);
vecteur operator*(matricepleine const & A, vecteur const & v);

#endif
