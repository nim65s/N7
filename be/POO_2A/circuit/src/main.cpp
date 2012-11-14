#include <iostream>
#include <cstdio>
#include <string>
#include <assert.h>
#include "euler.h"
#include "source.h"
#include "ordre_un.h"
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

    // Exemple 1: Circuit 1, Echelon
    echelon Ve1(1, 0);
    Ve1.affiche();
    circuit_un C1(500, 1e-9, 0, &Ve1, 50, 1e-9);
    C1.main_loop();
    cout << endl;
    C1.affiche();
    cout << endl;

    // Exemple 2: Circuit 1, Impulsion périodique
    impulsion_periodique Ve2(1, 0, 100e-9, 50e-9);
    Ve2.affiche();
    circuit_un C2(500, 1e-9, 0, &Ve2, 50, 1e-9);
    C2.main_loop();
    cout << endl;
    C2.affiche();
    cout << endl;

    // Exemple 3: Circuit 1, impulsion
    impulsion Ve3(1, 50e-9, 100e-9);
    Ve3.affiche();
    circuit_un C3(500, 1e-9, 0, &Ve3, 50, 1e-9);
    C3.main_loop();
    cout << endl;
    C3.affiche();
    cout << endl;


    // Exemple 4 : Circuit 2, Echelon
    circuit_deux C4(500, 1e-9, 0, &Ve1, 36, 180, 1e-9);
    C4.main_loop();
    cout << endl;
    C4.affiche();
    cout << endl;

    // Exemple 5: Circuit 2, Impulsion périodique
    circuit_deux C5(500, 1e-9, 0, &Ve2, 36, 180, 1e-9);
    C5.main_loop();
    cout << endl;
    C5.affiche();
    cout << endl;

    // Exemple 6: Circuit 2, impulsion
    circuit_deux C6(500, 1e-9, 0, &Ve3, 36, 180, 1e-9);
    C6.main_loop();
    cout << endl;
    C6.affiche();
    cout << endl;



    return 0;
}
