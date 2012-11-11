#include <iostream>
#include <cstdio>
#include <string>
#include <assert.h>
#include "euler.h"
#include "source.h"
#include <vector>

using namespace std;

int main() {
    cout << "Test de la petite «application»…" << endl;
    application f(10, 0.01, 3.14);
    f.main_loop();
    cout << endl;
    f.affiche();
    cout << endl;

    cout << "Test d’un échelon de V = 10V, et de phi = 0.4: " << endl;
    echelon ech(10, 0.4);
    ech.affiche();
    cout << "\tt = 0.3: " << ech.Ve(0.3) << "\tt = 0.5: " << ech.Ve(0.5) << endl << endl;
    cout << endl;

    cout << "Test d’un triangle de V = 4, et de T = 4: " << endl;
    triangle tri(4, 0, 4);
    tri.affiche();
    cout << "\tt = 1: " << tri.Ve(1) << "\tt = 2: " << tri.Ve(2) << endl;
    cout << "\tt = 3: " << tri.Ve(3) << "\tt = 4: " << tri.Ve(4) << endl;
    cout << "\tt = 0: " << tri.Ve(0) << "\tt = 5: " << tri.Ve(5) << endl;
    cout << endl;

    echelon Ve1(1, 0);
    Ve1.affiche();

    circuit_un C1(5, 0.1, 0.0, &Ve1, 50.0, 1e-9);
    C1.main_loop();
    cout << endl;
    C1.affiche();

    return 0;
}
