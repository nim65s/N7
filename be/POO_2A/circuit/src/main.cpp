#include <iostream>
#include <cstdio>
#include <string>
#include <vector>
#include <assert.h>
#include "euler.h"
#include "source.h"
#include "ordre_un.h"
#include "ordre_deux.h"

using namespace std;

int main(int argc, char *argv[]) {
    cout.precision(6);
    cout.setf(ios::fixed,ios::floatfield);

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

    impulsion_periodique Ve2(1, 0, 100e-9, 50e-9);
    Ve2.affiche();

    impulsion Ve3(1, 50e-9, 100e-9);
    Ve3.affiche();


    // ------------- ATTENTION: les pas ont été multipliés par 10 ! -----------------------

    // Exemple 1: Circuit A, Echelon
    circuit_un C1(500, 1e-9, 0, &Ve1, 50, 1e-9);
    C1.main_loop();
    cout << endl;
    C1.affiche();
    cout << endl;

    // Exemple 2: Circuit A, Impulsion périodique
    circuit_un C2(500, 1e-9, 0, &Ve2, 50, 1e-9);
    C2.main_loop();
    cout << endl;
    C2.affiche();
    cout << endl;

    // Exemple 3: Circuit A, impulsion
    circuit_un C3(500, 1e-9, 0, &Ve3, 50, 1e-9);
    C3.main_loop();
    cout << endl;
    C3.affiche();
    cout << endl;


    // Exemple 4 : Circuit C, Echelon
    circuit_deux C4(500, 1e-9, 0, &Ve1, 36, 180, 1e-9);
    C4.main_loop();
    cout << endl;
    C4.affiche();
    cout << endl;

    // Exemple 5: Circuit C, Impulsion périodique
    circuit_deux C5(500, 1e-9, 0, &Ve2, 36, 180, 1e-9);
    C5.main_loop();
    cout << endl;
    C5.affiche();
    cout << endl;

    // Exemple 6: Circuit C, impulsion
    circuit_deux C6(500, 1e-9, 0, &Ve3, 36, 180, 1e-9);
    C6.main_loop();
    cout << endl;
    C6.affiche();
    cout << endl;


    // Exemple 7: Circuit B, impulsion
    circuit_trois C7(500, 1e-9, 0, 0, &Ve1, 50, 1e-6, 0.1e-9);
    C7.main_loop();
    cout << endl;
    C7.affiche();
    cout << endl;

    // Exemple 8: Circuit B, impulsion périodique
    circuit_trois C8(500, 1e-9, 0, 0, &Ve2, 50, 1e-6, 0.1e-9);
    C8.main_loop();
    cout << endl;
    C8.affiche();
    cout << endl;

    // Exemple 9: Circuit B, Echelon
    circuit_trois C9(500, 1e-9, 0, 0, &Ve3, 50, 1e-6, 0.1e-9);
    C9.main_loop();
    cout << endl;
    C9.affiche();
    cout << endl;

    // Exemple 10: CircuitD, impulsion
    circuit_quatre C10(500, 1e-9, 0, 0, &Ve1, 1.2, 10e-9, 0.1e-6);
    C10.main_loop();
    cout << endl;
    C10.affiche();
    cout << endl;

    // Exemple 11: CircuitD, impulsion périodique
    circuit_quatre C11(500, 1e-9, 0, 0, &Ve2, 1.2, 10e-9, 0.1e-6);
    C11.main_loop();
    cout << endl;
    C11.affiche();
    cout << endl;


    // Exemple 12: CircuitD, Echelon
    circuit_quatre C12(500, 1e-9, 0, 0, &Ve3, 1.2, 10e-9, 0.1e-6);
    C12.main_loop();
    cout << endl;
    C12.affiche();
    cout << endl;

    // TODO: voir avec un enseignant s’il a une réponse juste…
    // Validation
    validation V(50, 0.1, 14, 11, &Ve1, 10);
    V.main_loop();
    cout << endl;
    V.affiche();
    cout << endl;

    if (argc > 1 and argv[1][0] == 't') {
        circuit_deux * test = new circuit_deux;
        test->main_loop();
        cout << endl;
        test->affiche();
        cout << endl;
        //delete test;
    }

    return 0;
}
