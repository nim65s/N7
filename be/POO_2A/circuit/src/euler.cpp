#include <iostream>
#include <cstdio>
#include <string>
#include "euler.h"
#include <vector>

using namespace std;

euler::euler(int const & nmax, float const & epsilon, float const & init): nmax(nmax), epsilon(epsilon), init(init) {}

float euler::u_prime(int const & point) const {
    if (point == 0) return init;
    return (u[point + 1] - u[point]) / epsilon;
}

void euler::main_loop() {
    u.push_back(0);
    for (int i(0);i<nmax;i++) u.push_back(u[i-1] + epsilon*u_prime(i));
}

void euler::affiche() const {
    cout << "Euler…" << endl;
    cout << "\tnmax:    " << nmax << endl;
    cout << "\tepsilon: " << epsilon << endl;
    cout << "\tinit:    " << init << endl;
    cout << "u:" << endl;
    for (int i(1);i<nmax;i++) cout << "\t" << i << "\t" << u[i] << endl;
}

fille::fille(int const & nmax, float const & epsilon, float const & init): euler(nmax, epsilon, init) {}

float fille::u_prime(int const & point) const {
    if (point == 0) return init;
    return - 3 * (u[point] + epsilon * point);
}

// vim: set foldmethod=marker:
