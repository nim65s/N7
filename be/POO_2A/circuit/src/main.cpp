#include <iostream>
#include <cstdio>
#include <string>
#include "euler.h"
#include "source.h"
#include <vector>

using namespace std;

int main() {
    euler e(10, 0.01, 3.14);
    e.main_loop();
    e.affiche();

    application f(10, 0.01, 3.14);
    f.main_loop();
    f.affiche();

    echelon ech(10, 0.4);
    cout << "Test d’un échelon de V = 10V, et de phi = 0.4: " << endl;
    cout << "\tt = 0.3: " << ech.Ve(0.3) << "\tt = 0.5: " << ech.Ve(0.5) << endl;

    triangle tri(4, 0, 4);
    cout << "Test d’un triangle de V = 4, et de T = 4: " << endl;
    cout << "\tt = 1: " << tri.Ve(1) << "\tt = 2: " << tri.Ve(2) << endl;
    cout << "\tt = 3: " << tri.Ve(3) << "\tt = 4: " << tri.Ve(4) << endl;
    cout << "\tt = 0: " << tri.Ve(0) << "\tt = 5: " << tri.Ve(5) << endl;

    echelon Ve1(1, 0);
    ptrVe ptr1 = &echelon::Ve;
    // TODO: virer les (float) ?
    //circuit_un C1(5000, (float)0.1, (float)0.0, (float(*)(float))Ve1.Ve, (float)50.0, (float)1e-9);
    circuit_un C1(5000, (float)0.1, (float)0.0, Ve1.*ptr1, (float)50.0, (float)1e-9);

    return 0;
}
