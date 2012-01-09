#include <iostream>
#include <cstdio>
#include <string.h>
#include <unistd.h>

using namespace std;

typedef struct
{
    char champ[9][20];
    int afficher(int i)
    {
        if (i<10) // ouais, ouais, on peut pas aller au dessus de 99...
        {
            cout << "-------------" << i << "------------" << endl;
        }
        else
        {
            cout << "------------" << i << "------------" << endl;
        }
        cout << "Nom : \t\t" << champ[0] << endl;
        cout << "Type : \t\t" << champ[1]<< endl;
        cout << "Catégorie : \t" << champ[2] << endl;
        cout << "Alias : \t" << champ[3] << endl;
        cout << "Betamax : \t" << champ[4] << endl;
        cout << "VCEsat : \t" << champ[5] << endl;
        cout << "VCEmax : \t" << champ[6] << endl;
        cout << "FT : \t\t" << champ[7] << endl;
        cout << "Boitier : \t" << champ[8] << endl << endl;
        return 0;
    }
    int clear()
    {
        for(int i=0;i<9;i++)
        {
            for(int j=0;j<19;j++)
            {
                champ[i][j] = ' ';
            }
            champ[i][19] = 0;
        }
        return 0;
    }
} transistor;

int main()
{
    cout << "Bienvenue dans la base de donnée de transistors du TD n°5." << endl;
    transistor tr;
    string nomchamp[9] = { "Nom", "Type", "Catégorie", "Alias", "Beta_max", "VCEsat", "VCEmax", "FT", "Boitier" };

    FILE * f;
    FILE * b;
    int choix = 0;
    int numtr = 0;
    bool sortir=false;
    
    while(!sortir)
    {
        cout << "*******************************************************************" << endl;
        cout << "Que voulez-vous faire ?" << endl;
        cout << "0) Sortir" << endl;
        cout << "1) Écraser le fichier binaire avec le fichier texte" << endl;
        cout << "2) Afficher la liste de tous les transistors" << endl;
        cout << "3) Rechercher un transistor à partir de son numéro" << endl;
        cout << "4) Rechercher un transistor à partir de son nom" << endl;
        cout << "5) Rechercher un transistor à partir de sa catégorie" << endl;
        cout << "6) Ajouter un nouveau transistor au fichier binaire" << endl;
        cout << "7) Modifier les caractéristiques d'un transistor existant" << endl;
        cout << "8) Supprimer un transistor" << endl;
        cout << "\t\t Wait.. WHAT ? oO" << endl;
        cout << "==>";
        cin >> choix;
        switch(choix)
        {
            case 0:
                sortir = true;
                break;
            case 1:
                f = fopen("libtr.txt","rt");
                if(f!=NULL)
                {
                    b = fopen("libtr.bin","wb");// TODO pas de droits d'écriture ? :)
                    numtr=0;
                    fseek(f,3,SEEK_CUR);// Faut pas me demander pourquoi 3, mais 2 ça marche pas
                    while(!feof(f))
                    {
                        fseek(f,-3,SEEK_CUR);
                        for(int i=0;i<9;i++)
                        {
                            fscanf(f,"%s",tr.champ[i]);
                            fwrite(tr.champ[i],1,20,b);// fwrite(tr,sizeof(tr),1,b);
                        }
                        tr.afficher(++numtr);
                        fgetc(f);
                        fgetc(f);
                        fgetc(f);
                    }
                    fclose(b);
                }
                else
                {
                    cout << " Pas de fichier texte... " << endl;
                }
                fclose(f);
                break;
            case 2:
                b = fopen("libtr.bin","rb");
                if(b!=NULL)
                {
                    numtr=0;
                    fseek(b,1,SEEK_CUR);
                    while(!feof(b))
                    {
                        fseek(b,-1,SEEK_CUR);
                        for(int i=0;i<9;i++)
                        {
                            for(int j=0;j<20;j++)
                            {
                                tr.champ[i][j] = fgetc(b);
                            }
                        }
                        tr.afficher(++numtr);
                        fgetc(b);
                    }
                }
                else
                {
                    cout << " pas de fichier binaire... " << endl;
                }
                fclose(b);
                break;
            case 3:{
                int numtofind=1;
                cout << "Entrez le numéro du transistor que vous voulez afficher" << endl << "==>";
                cin >> numtofind;
                b = fopen("libtr.bin","rb");
                if(b!=NULL)
                {
                    fseek(b,180*(numtofind-1),SEEK_SET); // si on entre 42 ça foire lamentablement.
                    for(int i=0;i<9;i++)
                    {
                        for(int j=0;j<20;j++)
                        {
                            tr.champ[i][j] = fgetc(b);
                        }
                    }
                    tr.afficher(numtofind);
                }
                else
                {
                    cout << " pas de fichier binaire... " << endl;
                }
                fclose(b);
                break;}
            case 4:
                char nomtofind[20];
                for(int i=0;i<19;i++)
                {
                    nomtofind[i]=' ';
                }
                nomtofind[19] = 0;
                cout << "Entrez le nom du transistor que vous cherchez" << endl << "==>";
                cin >> nomtofind;

                b = fopen("libtr.bin","rb");
                if(b!=NULL)
                {
                    fseek(b,1,SEEK_CUR);
                    numtr=0;
                    while(!feof(b))
                    {
                        fseek(b,-1,SEEK_CUR);
                        numtr++;
                        for(int j=0;j<20;j++)
                        {
                            tr.champ[0][j] = fgetc(b);
                        }
                        if (!strcmp(tr.champ[0],nomtofind))
                        {
                            for(int i=1;i<9;i++)
                            {
                                for(int j=0;j<20;j++)
                                {
                                    tr.champ[i][j] = fgetc(b);
                                }
                            }
                            tr.afficher(numtr);
                        }
                        else
                        {
                            fseek (b, 160, SEEK_CUR);
                        }
                        fgetc(b);
                    }
                }
                else
                {
                    cout << " pas de fichier binaire... " << endl;
                }
                fclose(b);
                break;
            case 5:
                char cattofind[20];
                cout << "Entrez la catégorie du transistor que vous cherchez" << endl << "==>";
                cin >> cattofind;

                if(b!=NULL)
                {
                    b = fopen("libtr.bin","rb");
                    fseek(b,1,SEEK_CUR);
                    numtr=0;
                    while(!feof(b))
                    {
                        fseek(b,39,SEEK_CUR);
                        numtr++;
                        for(int j=0;j<20;j++)
                        {
                            tr.champ[2][j] = fgetc(b);
                        }
                        if (!strcmp(tr.champ[2],cattofind))
                        {
                            fseek(b,-60,SEEK_CUR);
                            for(int i=0;i<9;i++)
                            {
                                for(int j=0;j<20;j++)
                                {
                                    tr.champ[i][j] = fgetc(b);
                                }
                            }
                            tr.afficher(numtr);
                        }
                        else
                        {
                            fseek (b, 120, SEEK_CUR);
                        }
                        fgetc(b);
                    }
                }
                else
                {
                    cout << " pas de fichier binaire... " << endl;
                }
                fclose(b);
                break;
            case 6:
                b=fopen("libtr.bin","ab");
                if(b!=NULL)
                {
                    fseek(b,0,SEEK_END);
                    
                    for(int i=0;i<9;i++)
                    {
                        cout << nomchamp[i] << " ?" << endl << "==>";
                        cin >> tr.champ[i];
                        fwrite(tr.champ[i],1,20,b);
                    }
                }
                else
                {
                    cout << " pas de fichier binaire... " << endl;
                }
                fclose(b);
                break;
            case 7:{
                int numtomod=1;
                cout << "entrez le numéro du transistor que vous voulez modifier" << endl << "==>";
                cin >> numtomod;
                b=fopen("libtr.bin","r+b");
                if(b!=NULL)
                {
                    fseek(b,180*(numtomod-1),SEEK_SET);
                    
                    for(int i=0;i<9;i++)
                    {
                        cout << nomchamp[i] << " ?" << endl << "==>";
                        cin >> tr.champ[i];
                        fwrite(tr.champ[i],1,20,b);
                    }
                }
                else
                {
                    cout << " pas de fichier binaire... " << endl;
                }
                fclose(b);
                break;}
            case 8:{
                int numtofind=1;
                cout << "Entrez le numéro du transistor que vous voulez supprimer" << endl << "==>";
                cin >> numtofind;
                b = fopen("libtr.bin","r+b");
                if(b!=NULL)
                {
                    fseek(b,180*numtofind,SEEK_SET); // si on entre 42 ça foire lamentablement.
                    for(int i=0;i<9;i++)
                    {
                        for(int j=0;j<20;j++)
                        {
                            tr.champ[i][j] = fgetc(b);
                        }
                    }
                    while(!feof(b))
                    {
                        numtofind++;
                        fseek(b,-360,SEEK_CUR);
                        for(int i=0;i<9;i++)
                        {
                            fwrite(tr.champ[i],1,20,b);
                        }
                        fseek(b,180,SEEK_CUR);
                        for(int i=0;i<9;i++)
                        {
                            for(int j=0;j<20;j++)
                            {
                                tr.champ[i][j] = fgetc(b);
                            }
                        }
                    }
                    ftruncate(fileno(b),180*(numtofind-1));
                }
                else
                {
                    cout << " pas de fichier binaire... " << endl;
                }
                fclose(b);
                break;}
            default:
                cout << " Fail. " << endl;
                break;
        }
    }
    return 0;
}
