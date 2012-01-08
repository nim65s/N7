#include <iostream>
#include <cstdio>
#include "complexe.h"

complexe::complexe() : re(0), im(0){};
complexe::complexe(double const & a) : re(a), im(0){};
complexe::complexe(double const & a, double const & b) : re(a), im(b){};
complexe::complexe(complexe const & a) : re(a.re), im(a.im){};

void complexe::afficher() {{{
    printf("%5.2g+i%5.2g",re,im);
}}}

bool operator==(complexe const & a, complexe const & b) {{{
    if (a.re != b.re || a.im != b.im) return false;
    else return true;
}}}

bool operator!=(complexe const & a, complexe const & b) {{{
    return !(a==b);
}}}

complexe operator+(complexe const & a, complexe const & b) {{{
    complexe c(a.re+b.re,a.im+b.im);
    return c;
}}}

complexe operator-(complexe const & a, complexe const & b) {{{
    complexe c(a.re-b.re,a.im-b.im);
    return c;
}}}

complexe operator*(complexe const & a, complexe const & b) {{{
    complexe c(a.re*b.re-a.im*b.im,a.re*b.im+a.im*b.re);
    return c;
}}}

complexe operator/(complexe const & a, complexe const & b) {{{
    complexe c(a.re/(a.re*a.re+a.im*a.im),-a.im/(a.re*a.re+a.im*a.im));
    return a*c;
}}}

complexe & complexe::operator+=(complexe const & a) {{{
    re += a.re;
    im += a.im;
    return *this;
}}}

// vim: set foldmethod=marker :
