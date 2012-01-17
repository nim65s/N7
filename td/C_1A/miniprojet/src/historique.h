#ifndef HISTORIQUE_H_INCLUDED
#define HISTORIQUE_H_INCLUDED

#include "matrices.h"

class element {
    public:
        int k;
        double qualite, valeur_propre;
        vecteur vecteur_propre;
        element * next;
        void ajouter_dans_historique() const;
        element mettre_fin(element * liste_convergence) ;
};

#endif
