#include <iostream>
#include <math.h>
#define PI 3.1415926535897932384

using namespace std;

int power(int m, int n)
{
    if ( n == 0 )
    {
        return 1;
    }
    if ( n % 2 == 0 )
    {
        int temp = power( m,n/2);
        if (temp*temp < 0) // marche pas
        {
            return 0;
        }
        else
        {
            return temp * temp;
        }
    }
    else
    {
        return  m*power( m,n-1);
    }
}



int main()
{
    int choix=0;
    float nombre=0;
    int i=0;
    int j=0;
    int nb=0;
    int puissance=0;
    bool fin=false; //Permettre de reboucler le programme si le choix est mauvais
    double reponse=42;
    double un=0;
    double um=0;
    int m=0;

    while (not fin)
    {
        cout << endl;
        cout << "\tBienvenue dans ce programme 'TD de C n°1'" << endl;
        cout << "Que voulez-vous faire ?" << endl;
        cout << "1 : Rien." << endl; // Ne pas commencer à 0 : NTUI
        cout << "2 : Obtenir la racine carrée d'un nombre." << endl;
        cout << "3 : Obtenir les sinus de 0 à pi/2 avec un pas de pi/10." << endl;
        cout << "4 : Obtenir la puissance entière d'un nombre entier." << endl;
        cout << "5 : Calculer une racine carré avec une suite louche." << endl;
        cout << "6 : Calculer une racine carré avec une suite louche qui sait quand elle doit s'arrêter." << endl;
        cout << "7 : Obtenir une suite de sinus calculés à peu près." << endl;
        cout << "8 : Calculer une puissance d'un nombre." << endl;
        cout << "9 : Faire bugger le systeme" << endl;
        cout << "==> ";
        cin >> choix;
        cout.precision(10);
        switch (choix)
        {
            case 1:
                cout << "Ok." << endl;
                cout << "En voilà un programme qu'il est utile... " << endl;
                fin=true;
                break;
            case 2:
                cout << "Quel nombre ?" << endl;
                cout << "==> ";
                cin >> nombre;
                cout << "La racine de " << nombre << " est " << sqrt(nombre) << endl;
                fin=true;
                break;
            case 3:
                for (i=0;i<6;i++)
                {
                    cout << i << "PI/10 = " << sin(i*PI/10) << endl;
                }
                fin=true;
                break;
            case 4:
                cout << "Quel nombre ?" << endl;
                cout << "==> ";
                cin >> nb;
                cout << "Quel puissance ?" << endl;
                cout << "==> ";
                cin >> puissance;
                cout << nb << "^" << puissance << " = " << pow(nb,puissance) << endl;
                fin=true;
                break;
            case 5:
                cout << "Quel nombre ?" << endl;
                cout << "==> ";
                cin >> nombre;
                cout << "Calcul avec combien d'itérations ?" << endl;
                cout << "==> ";
                cin >> nb;
                reponse = nombre;
                for (i=1;i<=nb;i++)
                {
                    reponse = ( reponse + nombre / reponse ) / 2;
                    cout << "Itération n°" << i << ", valeur approchée : " << reponse << endl;
                }
                fin=true;
                break;
            case 6:
                cout << "Quel nombre ?" << endl;
                cout << "==> ";
                cin >> nombre; // U(n)
                un = nombre;
                um = 0; // U(n+1)
                i = 0; // compteur
                while ( fabs(un-um) > pow(10,-8))
                {
                    i++;
                    if ( i != 1 )
                    {
                        un = um;
                    }
                    um = (un + nombre / un ) / 2;
                    cout << "Itération n°" << i << ", valeur approchée : " << um << " incertitude : " << fabs(un-um) << endl;
                }
                cout << " Valeur 'exacte' : " << sqrt(nombre) << endl;
                cout << " Erreur : " << fabs(sqrt(nombre)-um) << endl;
                fin=true;
                break;
            case 7: // TODO
                for (i=0;i<6;i++)
                {
                    j = 0;
                    nombre = i*PI/10;
                    reponse=nombre;
                    um=2; // permet de rentrer au moins une fois dans la boucle... 
                    while ( fabs(un-um) > pow(10,-6))
                    {
                        if ( j == 0 )
                        {
                            un = nombre; // u_0 = x
                        }
                        else
                        {
                            un = um;
                        }
                        um = - (nombre * nombre * un) / ((2*j+3)*(2*j+2));
                        reponse += um;
                        cout << "Itération n°" << j << ", valeur approchée : " << reponse << "\t incertitude : " << fabs(un-um) << endl;
                        j++;
                    }
                    cout << "\t sin(" << i << "PI/10) = "<< reponse << endl;
                }
                fin=true;
                break;
            case 8:
                cout << "Quel nombre ?" << endl;
                cout << "==> ";
                cin >> nb;
                cout << "Quel puissance ?" << endl;
                cout << "==> ";
                cin >> puissance;
                cout << nb << "^" << puissance << "=" << power(nb,puissance) << endl;
                fin=true;
                break;
            case 9:
                m=2147483645;
                cout << m << " " << m+1 << " " << m+2 << " " << m+3 << " "<< m+4 << endl;
                fin=true;
                break;
            case 42:
                cout << "Exact." << endl;
                fin=true;
                break;
            default:
                cout << "Un message d'erreur." << endl;
                cout << "Tant pis, on recommence... " << endl;
                break;
        }
    }
    cout << "Fin du magnifique programme 'TD de C n°1'" << endl << endl;
    return 0;
}
