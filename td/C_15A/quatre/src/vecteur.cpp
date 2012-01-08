#include <iostream>
#include <cstdio>
#include <assert.h>
#include "complexe.h"
#include "vecteur.h"

using namespace std;

vecteur::vecteur(int const & dim) : n(dim) {{{
    assert(dim > 0);
    //coef = new complexe[n];
}}}

vecteur::vecteur(vecteur const & v) : n(v.n) {{{
    //coef = new complexe[n];
    for(int i=0;i<n;i++) coef[i] = v.coef[i];
}}}

vecteur::~vecteur() {{{
    //delete coef;
}}}

void vecteur::afficher() {{{
    cout << "[";
    for(int i=0;i<n;i++) coef[i].afficher();
    cout << "    ]" << endl;
}}}

vecteur vecteuruna(int n) {{{ // vecteur unite, dimension n
    vecteur v(n);
    for(int i=0;i<n;i++) v.coef[i].re = 1.0;
    return v;
}}}

void vecteurunb(int n, vecteur &v) {{{ // vecteur unite, dimension n, avec reference
    assert(n>0);
    v.n = n;
    for(int i=0;i<n;i++) v.coef[i].re = 1.0;
}}}

bool operator==(vecteur a, vecteur b) {{{ // Definition de l'operateur == pour vecteur
    if (a.n != b.n) return false;
    else for(int i=0;i<a.n;i++) if (a.coef[i] != b.coef[i]) return false;
    return true;
}}}

vecteur mult1(complexe a, vecteur b) {{{ // multiplication de float et de vecteur
    for(int i=0;i<b.n;i++) b.coef[i] = a*b.coef[i];
    return b;
}}}

void mult2(complexe a, vecteur b, vecteur &c) {{{ // multiplication de float et de vecteur, w/ reference
    c.n = b.n;
    for(int i=0;i<b.n;i++) c.coef[i] = a*b.coef[i];
}}}

vecteur operator*(complexe a, vecteur b) {{{ // operateur multiplication float et vecteur
    vecteur v(b.n);
    for(int i=0;i<b.n;i++) v.coef[i] = a*b.coef[i];
    return v;
}}}

vecteur operator*(vecteur v, vecteur w) {{{   // operateur multiplication termes à termes sur des vecteurs
    assert(v.n==w.n);
    vecteur x(v.n);
    for(int i=0;i<x.n;i++) x.coef[i] = v.coef[i] * w.coef[i];
    return x;
}}}

vecteur operator+(vecteur v, vecteur w) {{{   // operateur addition de vecteurs
    assert(v.n==w.n);
    vecteur u(v.n);
    for(int i=0;i<v.n;i++) u.coef[i] = v.coef[i]+w.coef[i];
    return u;
}}}

vecteur operator-(vecteur v, vecteur w) {{{   // operateur soustraction de vecteurs
    assert(v.n==w.n);
    vecteur u(v.n);
    for(int i=0;i<v.n;i++) u.coef[i] = v.coef[i]-w.coef[i];
    return u;
}}}

complexe operator&(vecteur v, vecteur w) {{{     // operateur produit scalaire de vecteurs
    assert(v.n==w.n);
    complexe u(0);
    for(int i=0;i<v.n;i++) u += v.coef[i]*w.coef[i];
    return u;
}}}

// vim: set foldmethod=marker :
