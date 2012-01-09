#ifndef ENTREPRISE_H_INCLUDED
#define ENTREPRISE_H_INCLUDED

class employe {
    public:
        std::string nom;
        employe * suivant;
        employe * patron;

        employe(std::string const & nom = "john doe", employe * patron = NULL);
};

class entreprise {
    public:
        employe * boss;

        entreprise(std::string const & nom_boss = NULL);
        void ajouterEmploye(std::string const & nom, employe * patron = NULL);
        void licencieemploye(std::string const & nom);
        void collaborateur(std::string const & nom);
};
//entreprise creerArbreInitial(std::string const & nom_boss = "Nim", std::string const & nom_un = "premier_employe", std::string const & nom_deux = "deuxieme_employe");

#endif
