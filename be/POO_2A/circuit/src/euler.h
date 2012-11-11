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

class ordre_un : public euler {
    protected:
        source* src;

    public:
        void affiche() const;
        ordre_un(int const & nmax, float const & epsilon, float const & init, source* src);
};

class circuit_un : public ordre_un {
    protected:
        float u_prime(int const & i) const;
        float exacte(int const & i) const;
        float R;
        float C;

    public:
        void affiche() const;
        circuit_un(int const & nmax, float const & epsilon, float const & init, source* src, float const & R, float const & C);
};

/*
 *class circuit_deux : public ordre_un {
 *    protected:
 *        virtual float u_prime(int const & i) co;
 *
 *    public:
 *        circuit_deux(int const & nmax, float const & epsilon, float const & init);
 *};
 *
 */

#endif
