#include <iostream>
#include <cstdio>
#include <string>
#include <vector>
#include <math.h>
#include "euler.h"

using namespace std;

euler::euler(int const & nmax, float const & epsilon, float const & init): nmax(nmax), epsilon(epsilon), init(init) {}

float euler::u_prime(int const & i) const {
    if (i == 0) return init;
    return (u[i + 1] - u[i]) / epsilon;
}

void euler::main_loop() {
    u.push_back(init);
    for (int i(0);i<nmax;i++) {
        u.push_back(u[i] + epsilon*u_prime(i));
        cout << "approchée:\t" << u[i] + epsilon*u_prime(i) << "\texacte:\t" << (init - 1/3) * exp(-3*i*epsilon) - i*epsilon + 1 / 3 << endl ;
    }
}

void euler::affiche() const {
    cout << "Euler…" << endl;
    cout << "\tnmax:    " << nmax << endl;
    cout << "\tepsilon: " << epsilon << endl;
    cout << "\tinit:    " << init << endl;
    cout << "\ti\tu:" << endl;
    for (int i(1);i<nmax;i++) cout << "\t" << i << "\t" << u[i] << endl;
}

application::application(int const & nmax, float const & epsilon, float const & init): euler(nmax, epsilon, init) {}

float application::u_prime(int const & i) const {
    if (i == 0) return init;
    return - 3 * u[i] - 3  * epsilon * i;
}

ordre_un::ordre_un(int const & nmax, float const & epsilon, float const & init, float (*Ve)(float const & t)) : euler(nmax, epsilon, init), Ve(Ve) {}

circuit_un::circuit_un(int const & nmax, float const & epsilon, float const & init, float (*Ve)(float const & t), float const & R, float const & C) : ordre_un(nmax, epsilon, init, Ve), R(R), C(C) {}

float circuit_un::u_prime(int const & i) const {
    if (i == 0) return init;
    return (Ve(i*epsilon) - u[i]) / (R*C);
}

// vim: set foldmethod=marker:
