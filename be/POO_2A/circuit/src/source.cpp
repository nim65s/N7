#include "source.h"

float impulsion(float const & V, float const & T, float const & phi, float const & t) {
    if (t > phi and t < phi + T) return V;
    return 0;
}

float echelon(float const & V, float const & phi, float const & t) {
    if (t>phi) return V;
    return 0;
}

float triangle(float const & V, float const & P, float const & t) {
    if (t > P) return triangle(V, P, t - P);
    if (t < P/2) return 2 * V * t / P;
    return 2 * V * (1 - t / P);
}

float impper(float const & V, float const & T, float const & P, float const & t) {
    if (t > P) return triangle(V, P, t - P);
    if (t < T) return V;
    return 0;
}

// vim: set foldmethod=marker:
