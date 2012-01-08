#ifndef COMPLEXE_H_INCLUDED
#define COMPLEXE_H_INCLUDED

class complexe {
    public:
    float re;
    float im;
    
    complexe();
    complexe(double const & a);
    complexe(double const & a, double const & b);
    complexe(complexe const & a);

    complexe & operator +=(complexe const & a);
    complexe & operator -=(complexe const & a);
    
    void afficher();
};

bool operator!=(complexe const & a, complexe const & b);
bool operator==(complexe const & a, complexe const & b);
complexe operator+(complexe const & a, complexe const & b);
complexe operator-(complexe const & a, complexe const & b);
complexe operator*(complexe const & a, complexe const & b);
complexe operator/(complexe const & a, complexe const & b);


#endif
