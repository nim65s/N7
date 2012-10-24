#ifndef MOBILE_H_INCLUDED
#define MOBILE_H_INCLUDED

class mobile {
    private:
        int immatriculation;

    protected:
        float vitesse;
        float position;

    public:
        float calcul_position(float const & temps);

        void recapitulation_mobile() const;
        virtual void recapitulation() const;

        mobile();
        mobile(int const & immatriculation, float const & vitesse);
};

class voiture : public mobile {
    public:
        float masse;
        float consommation;

        virtual void recapitulation() const;

        voiture();
        voiture(int const & immatriculation, float const & vitesse);

};

class scooter : public mobile {
    public:
        float prix;
        int type;

        virtual void recapitulation() const;

        scooter();
        scooter(int const & immatriculation, float const & vitesse);
};

#endif
