#ifndef EULER_H_INCLUDED
#define EULER_H_INCLUDED

#include <vector>

class euler {
    protected:
        int nmax;
        float epsilon; // $h_n$
        std::vector<float> u; // $u^n$

        virtual float u_prime(int const & i) const;

    public:
        float init;

        void main_loop();
        void affiche() const;

        euler(int const & nmax, float const & epsilon, float const & init);
};

class application : public euler {
    protected:
        virtual float u_prime(int const & i) const;

    public:
        application(int const & nmax, float const & epsilon, float const & init);
};

class ordre_un : public euler {
    protected:
        virtual float u_prime(int const & i) const;
        float (*Ve)(float const & t);

    public:
        ordre_un(int const & nmax, float const & epsilon, float const & init, float (*Ve)(float const & t));
};

class circuit_un : public ordre_un {
    protected:
        virtual float u_prime(int const & i) const;
        float R;
        float C;

    public:
        circuit_un(int const & nmax, float const & epsilon, float const & init, float (*Ve)(float const & t), float const & R, float const & C);
};

typedef float (ordre_un::*ptrVe)(float const &)

/*
 *class circuit_deux : public ordre_un {
 *    protected:
 *        virtual float u_prime(int const & i) const;
 *
 *    public:
 *        circuit_deux(int const & nmax, float const & epsilon, float const & init);
 *};
 *
 */

#endif
