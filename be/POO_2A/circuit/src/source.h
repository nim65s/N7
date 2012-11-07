#ifndef SOURCE_H_INCLUDED
#define SOURCE_H_INCLUDED

// TODO Ve pourrait être const

class source {
    protected:
        float V;
        float phi;

    public:
        source(float const & V, float const & phi);
        virtual float Ve(float const & t) = 0;
};

class impulsion : public source {
    protected:
        float T;

    public:
        impulsion(float const & V, float const & phi, float const & T);
        virtual float Ve(float const & t);
};

class echelon : public source {
    public:
        echelon(float const & V, float const & phi);
        virtual float Ve(float const & t);
};

class periodique : public source {
    protected:
        float P;

    public:
        periodique(float const & V, float const & phi, float const & P);
        virtual float Ve(float const & t) = 0;
};

class triangle : public periodique {
    public:
        triangle(float const & V, float const & phi, float const & P);
        virtual float Ve(float const & t);
};

// TODO diamant…
//class impulsion_periodique : public impulsion, public periodique {
    //public:
        //impulsion_periodique(float const & V, float const & phi, float const & P, float const & t);
        //virtual float Ve(float const & t);
//};

class impulsion_periodique: public periodique {
    protected:
        float T;

    public:
        impulsion_periodique(float const & V, float const & phi, float const & P, float const & t);
        virtual float Ve(float const & t);
};

#endif
