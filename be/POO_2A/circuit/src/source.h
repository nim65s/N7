#ifndef SOURCE_H_INCLUDED
#define SOURCE_H_INCLUDED

class source {
    protected:
        float V;
        float phi;

    public:
        virtual float Ve(float t) = 0;
        virtual float Ve_p(float t, float epsilon) = 0;
        void affiche() const;
        source(float const & V, float const & phi);
};

class impulsion : public virtual source {
    protected:
        float T;

    public:
        impulsion(float const & V, float const & phi, float const & T);
        void affiche() const;
        virtual float Ve(float t);
        virtual float Ve_p(float t, float epsilon);
};

class echelon : public source {
    public:
        echelon(float const & V, float const & phi);
        void affiche() const;
        virtual float Ve(float t);
        virtual float Ve_p(float t, float epsilon);
};

class periodique : public virtual source {
    protected:
        float P;

    public:
        periodique(float const & V, float const & phi, float const & P);
        void affiche() const;
        virtual float Ve(float t) = 0;
        virtual float Ve_p(float t, float epsilon) = 0;
};

class triangle : public periodique {
    public:
        triangle(float const & V, float const & phi, float const & P);
        void affiche() const;
        virtual float Ve(float t);
        virtual float Ve_p(float t, float epsilon);
};

class impulsion_periodique : public impulsion, public periodique {
    public:
        impulsion_periodique(float const & V, float const & phi, float const & P, float const & t);
        void affiche() const;
        virtual float Ve(float t);
        virtual float Ve_p(float t, float epsilon);
};


// TODO sinus

#endif
