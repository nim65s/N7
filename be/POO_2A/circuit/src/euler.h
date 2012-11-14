#ifndef EULER_H_INCLUDED
#define EULER_H_INCLUDED

#include <vector>
#include "source.h"

class euler {
    protected:
        int nmax;
        float epsilon; // $h_n$
        std::vector<float> u; // $u^n$

        virtual float u_prime(int const & i) const;
        virtual float exacte(int const & i) const;

        bool exacte_isknown;

    public:
        float init;

        void main_loop();
        void affiche() const;

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
