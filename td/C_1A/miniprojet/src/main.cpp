#include <iostream>
#include <cstdio>
#include <string>
#include <cmath>
#include <assert.h>
#include "matrices.h"
#include "historique.h"
#include "tests.h"
#include "algo.h"

using namespace std;

int main() {

    int i;
    i=0;

    int *j,*p;
    j=new int;
    p=new int;


    j=&i;
    *p=*j;


    cout << i << "  " << &i <<endl; 
    cout << j << "  " << *j << endl; 
    cout << p << "  " << *p << endl; 


    return 0;


    cout << "\t\tMini Projet" << endl;
    bool afficher = false;
    int a(test_conversions(afficher));
    int b(test_produits(afficher));
    int c(test_ordonnage(afficher));
    int d(test_fichiers(afficher));
    int e(test_historique(afficher));
    cout << endl << a << endl;

    int f(algo(lireun("../test.mx", false).ordonne(), true));
    
    if ( a == 0 && b==0 && c==0 && d == 0 && e == 0 && f == 0 ) {
        cout << " OK " << endl;
        return 0;
    }
    else {
        cout << " KO : a=" << a << " | b=" << b << " | c=" << c << " | d=" << d << " | e=" << e << " | f=" << f << endl; 
        return 1;
    }
    return 0;
}
