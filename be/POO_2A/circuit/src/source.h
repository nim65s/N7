#ifndef SOURCE_H_INCLUDED
#define SOURCE_H_INCLUDED

class source {
    protected:
        float V;
        float phi;

    public:
        virtual float Ve(float t) = 0;
        virtual float Ve_p(float t, float epsilon) = 0;
        virtual void affiche() const;
        source();
        source(float const & V, float const & phi);
};

class impulsion : public virtual source {
    protected:
        float T;

    public:
        impulsion();
        impulsion(float const & V, float const & phi, float const & T);
        virtual void affiche() const;
        virtual float Ve(float t);
        virtual float Ve_p(float t, float epsilon);
};

class echelon : public source {
    public:
        echelon();
        echelon(float const & V, float const & phi);
        virtual void affiche() const;
        virtual float Ve(float t);
        virtual float Ve_p(float t, float epsilon);
};

class periodique : public virtual source {
    protected:
        float P;

    public:
        periodique();
        periodique(float const & V, float const & phi, float const & P);
        virtual void affiche() const;
        virtual float Ve(float t) = 0;
        virtual float Ve_p(float t, float epsilon) = 0;
};

class triangle : public periodique {
    public:
        triangle();
        triangle(float const & V, float const & phi, float const & P);
        virtual void affiche() const;
        virtual float Ve(float t);
        virtual float Ve_p(float t, float epsilon);
};

class sinus : public periodique {
    public:
        sinus();
        sinus(float const & V, float const & phi, float const & P);
        virtual void affiche() const;
        virtual float Ve(float t);
        virtual float Ve_p(float t, float epsilon);
};

class impulsion_periodique : public impulsion, public periodique {
    public:
        impulsion_periodique();
        impulsion_periodique(float const & V, float const & phi, float const & P, float const & t);
        virtual void affiche() const;
        virtual float Ve(float t);
        virtual float Ve_p(float t, float epsilon);
};

#endif
