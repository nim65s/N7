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

class fille : public euler {
    protected:
        virtual float u_prime(int const & i) const;

    public:
        fille(int const & nmax, float const & epsilon, float const & init);
};

#endif
