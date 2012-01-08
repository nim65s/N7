#include <iostream>

using namespace std;

int factorielle(int n, bool debug) {{{
    if (debug) cout << "DEBUG - factorielle " << n << endl;
    if (n<2)
        return 1;
    else
        return n*factorielle(n-1, debug);
}}}

int factorielle(int n) {{{
    return factorielle(n, false);
}}}

//vim:set foldmethod=marker:
