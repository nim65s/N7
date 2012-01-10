#ifndef ELEVE_H_INCLUDED
#define ELEVE_H_INCLUDED

class Eleve {
    public:
        std::string m_nom;
        std::string m_prenom;
        std::string m_classe;
        float m_notes[9];

        Eleve();
        Eleve(std::string const & nom, std::string const & prenom, std::string const & classe; float const & notes[9]);

        void afficher();
        int ecrire(std::string filename = "../Promo.bin");
};

vector<Eleve> lire(std::string filename = "../Promo.txt");

#endif
