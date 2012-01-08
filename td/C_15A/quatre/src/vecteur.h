#ifndef VECTEUR_H_INCLUDED
#define VECTEUR_H_INCLUDED

class vecteur {
    public:
    int n;
    complexe coef[100];

    vecteur(int const & dim);
    vecteur(vecteur const & v);
    ~vecteur();

    void afficher();
};

vecteur vecteuruna(int n);                     // vecteur unite, dimension n

void vecteurunb(int n, vecteur &v);            // vecteur unite, dimension n, avec reference

bool operator==(vecteur a, vecteur b);         // Definition de l'operateur == pour vecteur

vecteur mult1(complexe a, vecteur b);             // multiplication de float et de vecteur

void mult2(complexe a, vecteur b, vecteur &c);    // multiplication de float et de vecteur, w/ reference

vecteur operator*(complexe a, vecteur b);         // operateur multiplication float et vecteur

vecteur operator*(vecteur v, vecteur w);       // operateur multiplication termes à termes sur des vecteurs

vecteur operator+(vecteur v, vecteur w);       // operateur addition de vecteurs

vecteur operator-(vecteur v, vecteur w);       // operateur soustraction de vecteurs

complexe operator&(vecteur v, vecteur w);         // operateur produit scalaire de vecteurs

#endif
