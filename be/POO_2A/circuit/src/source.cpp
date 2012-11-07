#include "source.h"

source::source(float const & V, float const & phi): V(V), phi(phi) {}

impulsion::impulsion(float const & V, float const & phi, float const & T): source(V, phi), T(T) {}

echelon::echelon(float const & V, float const & phi): source(V, phi) {}

periodique::periodique(float const & V, float const & phi, float const & P): source(V, phi), P(P) {}

triangle::triangle(float const & V, float const & phi, float const & P): periodique(V, phi, P) {}

//impulsion_periodique::impulsion_periodique(float const & V, float const & phi, float const & P, float const & T): impulsion(V, phi, T), periodique(V, phi, P) {}

impulsion_periodique::impulsion_periodique(float const & V, float const & phi, float const & P, float const & T): periodique(V, phi, P), T(T) {}

float impulsion::Ve(float const & t) {
    if (t < 0) return 0;
    if (t > phi and t < phi + T) return V;
    return 0;
}

float echelon::Ve(float const & t) {
    if (t < 0) return 0;
    if (t > phi) return V;
    return 0;
}

// TODO phi
float triangle::Ve(float const & t) {
    if (t < 0) return 0;
    if (t > P) return Ve(t - P);
    if (t < P/2) return 2 * V * t / P;
    return 2 * V * (1 - t / P);
}

// TODO phi
float impulsion_periodique::Ve(float const & t) {
    if (t < 0) return 0;
    if (t > P) return Ve(t - P);
    if (t < T) return V;
    return 0;
}

// vim: set foldmethod=marker:
