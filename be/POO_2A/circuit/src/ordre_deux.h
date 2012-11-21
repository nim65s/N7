#ifndef ordre_deux_H_INCLUDED
#define ordre_deux_H_INCLUDED

#include <vector>
#include "source.h"
#include "euler.h"

class ordre_deux : public euler {
    protected:
        float init_p; // valeur initiale de la dérivée
        source* src; // source
        std::vector<float> u_p; // vecteur de la dérivée de la réponse
        virtual float u_seconde(int const & i) const; // calcul de la dérivée seconde

    public:
        void main_loop();

        void affiche() const;
        ordre_deux(int const & nmax, float const & epsilon, float const & init, float const & init_p, source* src);
};

class circuit_trois : public ordre_deux {
    protected:
        float u_seconde(int const & i) const;
        float R;
        float L;
        float C;

    public:
        void affiche() const;
        circuit_trois(int const & nmax, float const & epsilon, float const & init, float const & init_p, source* src, float const & R, float const & L, float const & C);
};

class circuit_quatre : public ordre_deux {
    protected:
        float u_seconde(int const & i) const;
        float R;
        float L;
        float C;

    public:
        void affiche() const;
        circuit_quatre(int const & nmax, float const & epsilon, float const & init, float const & init_p,  source* src, float const & R, float const & L, float const & C);
};


#endif
