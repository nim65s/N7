#ifndef EULER_H_INCLUDED
#define EULER_H_INCLUDED

#include <vector>

class euler {
    protected:
        int nmax;
        float epsilon; // $h_n$
        std::vector<float> u; // $u^n$

        float u_prime(int const & point) const;

    public:
        float init;

        void main_loop();
        void affiche() const;

        euler(int const & nmax, float const & epsilon, float const & init);
};

class fille : public euler {
    protected:
        float u_prime(int const & point) const;

    public:
        fille(int const & nmax, float const & epsilon, float const & init);
};

#endif
