#ifndef EULER_H_INCLUDED
#define EULER_H_INCLUDED

#include <vector>
#include "source.h"

class euler {
    protected:
        int nmax; // nombre d’instants
        float epsilon; // durée d’un instant
        float init; // valeur initiale
        std::vector<float> u; // vecteur réponse

        virtual float u_prime(int const & i) const; // calcul de la dérivée
        virtual float exacte(int const & i) const;

        bool exacte_isknown;

    public:

        void main_loop();
        void affiche() const;

        euler();
        euler(int const & nmax, float const & epsilon, float const & init);
};

class application : public euler {
    protected:
        float u_prime(int const & i) const;
        float exacte(int const & i) const;

    public:
        void affiche() const;
        application(int const & nmax, float const & epsilon, float const & init);
};

#endif
