#include <cstdio>
#include <iostream>
#include <assert.h>
#include "matrices.h"
#include "historique.h"

element element::mettre_fin(element * liste_convergence) {{{
    next = NULL;
    if (liste_convergence == NULL) return *this;
    else {
        element * temp = liste_convergence;
        while (temp->next != NULL) temp = temp->next;
        temp->next = this;
        return *liste_convergence;
    }
}}}

void element::ajouter_dans_historique() const {{{
    FILE * fichier = NULL;
    fichier = fopen("historique.txt", "a");
    assert(fichier != NULL);
    fprintf(fichier, "Iteration %d\n", k);
    fprintf(fichier, "Qualite %f\n", qualite);
    fprintf(fichier, "Lambda %f\n", valeur_propre);
    fprintf(fichier, "Vecteur propre [ ");
    for (int i(0);i<vecteur_propre.n;i++) fprintf(fichier, "%5.3e+i%-5.3e ", vecteur_propre.coef[i].re, vecteur_propre.coef[i].im);
    fprintf(fichier, "]\n\n");
    fclose(fichier);
}}}

// vim: set foldmethod=marker:
