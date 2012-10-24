#include <iostream>
#include <cstdio>
#include <string>
#include "euler.h"
#include <vector>

using namespace std;

int main() {
    euler e(10, 0.01, 3.14);
    e.main_loop();
    e.affiche();

    fille f(10, 0.01, 3.14);
    f.main_loop();
    f.affiche();

    return 0;
}
