#ifndef ORDRE_UN_H_INCLUDED
#define ORDRE_UN_H_INCLUDED

#include <vector>
#include "source.h"
#include "euler.h"

class ordre_un : public euler {
    protected:
        source* src;

    public:
        void affiche() const;
        ordre_un();
        ordre_un(int const & nmax, float const & epsilon, float const & init, source* src);
        //virtual ~ordre_un();
};

class circuit_un : public ordre_un {
    protected:
        float u_prime(int const & i) const;
        float exacte(int const & i) const;
        float R;
        float C;

    public:
        void affiche() const;
        circuit_un();
        circuit_un(int const & nmax, float const & epsilon, float const & init, source* src, float const & R, float const & C);
        //virtual ~circuit_un();
};


class circuit_deux : public ordre_un {
    protected:
        float u_prime(int const & i) const;
        float exacte(int const & i) const;
        float R1;
        float R2;
        float C;

    public:
        void affiche() const;
        circuit_deux();
        circuit_deux(int const & nmax, float const & epsilon, float const & init, source* src, float const & R1, float const & R2, float const & C);
        //virtual ~circuit_deux();
};

#endif
