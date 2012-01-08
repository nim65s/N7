#include <iostream>
#include <math.h>
#define PI 3.1415926535897932384

using namespace std;

int main()
{
    int choix=0;
    float nombre=0;
    int i=0;
    int nb=0;
    int puissance=0;
    bool fin=false;

    while (not fin)
    {
        cout << endl;
        cout << "\tBienvenue dans ce programme 'TD de C n°1'" << endl;
        cout << "Que voulez-vous faire ?" << endl;
        cout << "0 : Rien." << endl;
        cout << "1 : Obtenir la racine carrée d'un nombre." << endl;
        cout << "2 : Obtenir les sinus de 0 à pi/2 avec un pas de pi/10." << endl;
        cout << "3 : Obtenir la puissance entière d'un nombre entier." << endl;
        cout << "==> ";
        cin >> choix;
        cout.precision(10);
        switch (choix)
        {
            case 0:
                cout << "Ok." << endl;
                cout << "En voilà un programme qu'il est utile... " << endl;
                fin=true;
                break;
            case 1:
                cout << "Quel nombre ?" << endl;
                cin >> nombre;
                cout << "La racine de " << nombre << " est " << sqrt(nombre) << endl;
                fin=true;
                break;
            case 2:
                for (i=0;i<6;i++)
                {
                    cout << i << "PI/10 = " << sin(i*PI/10) << endl;
                }
                fin=true;
                break;
            case 3:
                cout << "Quel nombre ?" << endl;
                cin >> nb;
                cout << "Quel puissance ?" << endl;
                cin >> puissance;
                cout << nb << "^" << puissance << " = " << pow(nb,puissance) << endl;
                fin=true;
                break;
            default:
                cout << "Un message d'erreur." << endl;
                cout << "Tant pis, on recommence... " << endl;
                break;
        }
    }

    return 0;
}
