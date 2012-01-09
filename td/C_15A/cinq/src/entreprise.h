#ifndef ENTREPRISE_H_INCLUDED
#define ENTREPRISE_H_INCLUDED

typedef struct employe {
    std::string nom;
    employe * suivant;
    employe * patron;
} employe;

employe * new_employe(std::string const & nom = "john doe", employe * patron = NULL);
employe * new_entreprise(std::string const & nom_entreprise = "Entreprise");
employe * ajouter_employe(std::string const & nom, employe * patron = NULL, employe * entreprise = NULL);
void licencier_employe(std::string const & nom, employe * entreprise);
employe * creer_entreprise_initial(std::string const & nom_entreprise = "NimCo", std::string const & nom_boss = "Nim", std::string const & nom_un = "premier_employe", std::string const & nom_deux = "deuxieme_employe");
void sous_fifres(std::string const & nom);
void afficher(employe * entreprise);

#endif
