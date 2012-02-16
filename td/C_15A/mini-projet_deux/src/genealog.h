#ifndef GENEALOG_H_INCLUDED
#define GENEALOG_H_INCLUDED

typedef struct personne { // {{{
    std::string nom;
    std::string prenom;
    bool genre;
    int age;
    personne * suivant;
    personne * pere;
    personne * mere;
    /*
     * affiche la personne
     * i: numéro à afficher (rien si < 0)
     * parents: choix de l’affichage ou non des parents
     * retourne: 0
     */
    int show(int i=0, bool parents=0);
            
} personne; //}}}

/*
 * Crée un arbre vide
 * retourne: le premier nœud de l’arbre
 */
personne * creerArbreVide();

/*
 * Ajoute une personne a un arbre
 * &A: le premier nœud de l’arbre
 * &P: la personne à ajouter
 * retourne: 0 si tout va bien, -1 si &A est NULL, ou -2 si &P est NULL
 */
int ajouterPersonne(personne & A, personne & P);

/*
 * Crée un arbre prédéfini arbitraire
 * retourne: le premier nœud de l’arbre
 */
personne * creerArbreInitial();

/*
 * Ajoute interactivement une personne à l’arbre
 * &A: le premier nœud de l’arbre
 * retourne: 0 si tout va bien, -1 si &A est NULL
 */
int ajouterPersonne(personne &A);

/*
 * Parcoure l’arbre et affiche les gens
 * &A: le premier nœud de l’arbre
 * retourne: -1 si &A est NULL, ou le nombre de personnes dans l’arbre
 */
int afficherArbre(personne & A);

/*
 * Retrouve interactivement une personne à partir de son nom, prénom,
 *  genre, age ou position absolue dans l’arbre
 * &A: le premier nœud de l’arbre
 * afficher: afficher ou non la personne une fois qu’elle est trouvée
 * retourne: la personne trouvée
 */
personne * retrouverPersonne(personne & A, bool afficher=false);

/*
 * Affiche les ascendants d’une personne (et les parents de chaque ascendants,
 *  afin de savoir qui est l’ascendant de qui)
 * &pers: la personne dont il faut afficher les ascendants
 * nbgene: le nombre de générations à remonter (1: affiche le père et la mère)
 * retourne: le nombre d’ascendants trouvés, ou = -1 si pers est NULL
 */
int ascendants(personne & pers, int nbgene);

/*
 * Renvoie les enfants d’une personne
 * &A: le premier nœud de l’arbre
 * &pers: la personne dont il faut afficher les enfants
 * show: afficher ou non ces enfants
 * retourne: un vecteur de pointeurs vers les enfants
 */
std::vector<personne *> enfants(personne & A, personne & pers, bool show=true);

/*
 * Renvoie les frères et sœurs d’une personne (comprenant les demi-frères et 
 *  demi-sœurs)
 * &A: le premier nœud de l’arbre
 * &pers: la personne dont il faut afficher les frères et sœurs
 * show: afficher ou non ces frères et sœurs
 * retourne: un vecteur de pointeurs vers les frères et sœurs
 */
std::vector<personne *> soeursFreres(personne & A, personne & pers, bool show=true);

/*
 * Renvoie les cousins et cousines d’une personne
 * &A: le premier nœud de l’arbre
 * &pers: la personne dont il faut afficher les cousins et cousines
 * show: afficher ou non ces cousins et cousines
 * retourne: un vecteur de pointeurs vers les cousins et cousines
 */
std::vector<personne *> cousins(personne & A, personne & pers, bool show=true);

/*
 * Écris l’arbre dans un fichier texte
 * &A: le premier nœud de l’arbre
 * file: le nom du fichier
 * retourne: 0 si tout va bien, -1 si &A est NULL, -2 si le fichier n’a pu être
 *  ouvert
 */
int ecrire(personne & A, std::string file="arbre.txt");

#endif

