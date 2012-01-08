#include <iostream>

using namespace std;

float puissance(int m, int n, bool debug) {{{
    if (debug) cout << "DEBUG - puissance m:'" << m << "' - n:'" << n << "'." << endl;
    if (n==0)
        return 1;
    else if (n<0) {
        if (debug) cout << "DEBUG - \t n négatif" << endl;
        return 1/puissance(m, -n, debug);
    }
    else if (n%2==0) {
        if (debug) cout << "DEBUG - \t n pair" << endl;
        int temp = puissance(m, n/2, debug);
        return temp * temp;
    }
    else
        return  m*puissance(m, n-1, debug);
}}}

float puissance(int m, int n) {{{
    return puissance(m, n, false);
}}}

//vim:set foldmethod=marker:
