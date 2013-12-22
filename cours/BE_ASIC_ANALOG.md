BE - Conception d’un ASIC Analogique en technologie CMOS
========================================================

but: réalisation d’un régulateur linéaire faible puissance & large bande
    Vdd                          Vdd
    −−−                          −−−
     |                            |
+−−−−−−−−−+  Vref                 | Id
| Bandgap | ----- | +     Vg   |−−|
+---------+       |    > ----- |    M
     |         +- | -          |−−|     Is
    ---        |                  +−−−+−−+
    GND        |               Ir R2  |  |
Générateur     +-−−−−−−−−−−−−−−−-−+   C  Rch  Vs
de tension                        R1  |  |
de référence                      |   |  |
                                  +−−−+−−+
                                    GND

Avec Vref ~= 1.24V, pour tout Vdd et toute température
Vg = Vs + Vgs avec Vgs = f(Id) où Id = Is+Ir
Vg = Ad epsilon
epsilon = Vref - R1/(R1+R2) * Vs       (R1/(R1+R2) = beta)
Ad: gain de l’AO
B: facteur de repport
pour Ad = infini (idéal) -> epsilon = 0

Vs = Vref/beta pour tout Rch, vdd et T°

Remarque: Vds = Vdd - Vs != 0
Id ~= Is

d’où Pm = Vds Id = (Vdd-Vs)Is : puissance dissipée par le transistor M imposée par le cahier des charges

M est un transistor de puissance appelé Ballast / bypass

Cas pratique de réalisation
---------------------------

Process     lent        typique     rapide
températeur min         typique     max
            -40°        27°         125°

Procédé de réalisation d’un ASIC analogique
-------------------------------------------
choix techno   littérature, IEEE, livres
     ^                     ^
Spécification -> recherche d’architecture -> Design: Conception au niveau transistor des blocs fonctionnels
-> simulation de vérification -> on passe la main au layout
Dessin des masques -> simulation avec les composants parasites -> fonderie

Rappel sur les MOS
------------------
gm = dId/dVgs = sqrt(2 beta Id)
r0 = 1 / (lambda Id)

Sur gain d’un amplificateur
---------------------------

Vdd
 |
 M2 - (miroir)
 | --- Vs
 M1 - ve
 |
GDN

Schéma équivalent petit signal
 GND
  |
  r02
  +-----+
gm.ve  r01
  |     |
 GND   GND

av = vs/ve = gm1 r01//r02 = gm r0/2 = gm r0 1/2 = sqrt(2 beta Id) / (2 lambda Id)

av = sqrt(beta/2) * 1/lambda * 1/sqrt(Id)

Amplificateur opérationnel
--------------------------
          Vdd
          ---
           |
           I0
           |
      +----+----+
 +  |<|         |>|  -
----|   M2   M1   |----
    |-|         |-|
      +----+    |------- Vs
      |-|  |  |-|
   M3   |--+--|   M4
      |<|     |>|
      |         |
      +----+----+
           |
          ---
          GND

M1-M2: paire différentielle, étage de gain
M3-M4: miroir de courant, charge active
Vd = Vgs1-Vgs2
I0=I1+I2
Idiff=I1-I2 = f(Vd)
à l’équilibre Vd=0V => Idiff=0A
Vmc: sources de M1 et M2, tension de mode commun

* cas 1: comportement de M1 et M4, avec Vmc cste potentiel fixe
M1 et M4 sont des sources de courant
montages source commune
avec Vds1, Vds( > Vdsat => régime saturé
r0 = 1 / (lambda Id)

Vs est alors défini comme l’intersection des charactéristiques statiques des transistors M1 & M4

or I1 = beta1/2 (Vsg1 - Vth)²(1+lambda1 vsd1)
   I2 = beta2/2 (Vsg2 - Vth)²(1+lambda2 vsd2)
   avec M1 et M2 identiques, beta1 = beta2 = beta et lambda1=lambda2=lambda

Si on souhaite Vd = 0V => Vsg1 = Vsg2 = Vsg
on obtient I1 = K (1+ lambda Vsd1)
           I2 = K (1+ lambda Vsd2)
     avec K = beta / 2 (Vsg - Vth)²
 Si Vsd1 = Vsd2 => Idiff = 0A => pas d’offset !

 Il faut égaliser les courants I1 et I2 ainsis que les tensions Vsd1 et Vsd2

* Cas 2: comportement du miropir de courant simple composé de M3 et M4

Vgs3 = Vgs4 = Vgs
Is   = beta4/2 (Vgs-Vth)²(1+lambda Vds4)
Iref = beta3/2 (Vgs-Vth)²(1+lambda Vgs)
Is / Iref = (1+lambda Vds4) / (1+lambda Vgs)
on obtient Is = Iref si Vds4 = Vgs


Après ça, on ajoute un étage :
   Vdd
   ---
    |
    I0
    |
    +----
    |
    |
  |-|
--|   M5
  |>|
    |
   ---
   GND

Détermination de beta5:
avec lambda5 = 0

Id5 = beta5 / 2 (Vgs5 -Vth)²
Vgs5 = sqrt(2 Id5 / beta5) + Vth
Vgs3 = sqrt(2 Id3 / beta3) + Vth
on veut Vgs5 = Vgs3, avec Id3 = I0/2 et Id5 = alpha I0 => beta5 = 2 alpha beta3

Étude fréquentielle
--------------------
Si, à la place de ce dernier étage, on met une capa en sortie, on a:
calcul du gain : av1 = vs1 / vd
DeltaI = f(Vd) => Deltai = gm vd/2 => 2Deltai = gm vd

avec gm la transconductance de M1 et/ou de M2
gm = sqrt(2 beta1 Id1) = sqrt(2 beta1 Id/2)

Impédance vue sur le noeud de sortie: r01 // r04
donc vs1 = - r01 88 r04 Deltai
d’où vs1 / vd = - gm r01 // r04
av1 = -gm r04 // r04 = -gm / ((lambda1+lambda4) I0/2)

parce que r01 = 1 / (lambda1 I0/2)
          r05 = 1 / (lambda5 I0/2)

Constante de de temps de l’amplificateur
--------------------------------------
l’impédance la plus élevée est vue sur la sortie de l’amplificateur
rs = r01 // r03
Elle fait apparaitre une constante de temps liée à la présence de la capacité Cc
tau = Rs Cc
expression fréquentielle du gain
av1(p) = av1 / (1+tau p)
                                                                 +-------------------+
fc = |av1| / (2 pi tau) = gm r01 // r04 / (2 pi Cc r01 // r04) = | fc = gm / 2 pi Cc |
                                                                 +-------------------+

Ajout d’un deuxième étage de gain
---------------------------------
       Vdd
       ---
        |
   alpha.I0 // r06
        |
        +---- Vs2
        |
        |
Vs1   |-|
------|   M5
      |>|
        |
       ---
       GND


M5 en source commune
présence de deux noeuds haute impédance
av2 = vs2 / vs1 = - gm5 r05 // r06
tau1 = C01 r01 // r04
tau2 = C02 r05 // r05

à ce moment av = av1 av2 / ((1 + tau1 p)(1 + tau2 p))

Donc à partir de f = 1 / (2 pi tau2), on a une pente à -2
du coup c’est possible qu’on ai cette pente au gain unitaire => problème de stabililté, marge de phase, toussa.
Donc on rajoute une capa C entre la base et le drain de M5, qui est multipliée par le gain (effet miller)
et on a un pole dominant plus bas, et on a moins de risque
Cm = C (1 - av2)

on obtient une constante de temps tauM = Cm r01 //q r04
av(p) ~= av1 av2 / (1 + tauM p)

calcul du produit gain-bande
fc= = av1 av2 / (2 pi tauM) = gm / (2 pi C), identique à celle précédente

Band Gap
--------
Le but est de fournir une tension de référence, qui soit la même en fonction de la température, de la tension d’alim, voire du process.
        Vcc
   +-----------+
   |           |
T3  \|_______|/  T4
    /| |     |\
   +---+       | I0
I0 |      +----+
T2  \|____|__|/  T1
    /|       |\
   |           |
   R1          |
   |           |
   +-----+-----+
         |
         R
         |
        ---
        GND

Ic = Is (exp(Vbe/nUt)-1), n=1
Vbe = Ut ln (Ic/Is) Ut = kT/q
dVbe / dT = -2mv/°K
Is = Ae Js
Ae: surface émetteur

On commence par négliger les courants de base
R1 I00 + Vbe2 - Vbe1 = 0
Vbe1 - Vbe2 = R1 I0
Ut[ln(I0 / (Ae1 Js)) - ln(I0 / (Ae2 Js))] = R1 I0
Ut ln(Ae2/Ae1) = R1 I0 => I0 = Ut / R1 ln(Ae2/Ae1) proportionnel à T°
Vs = R2 2 I0 + Vbe1
dVs / dT = 2 R2 k/q 1/R1 ln(Ae2/Ae1) -2mV/°K = 0 V/°K

d’où R2/R1 = 2mV/°K q/k 1/(2 ln(Ae2/Ae1))
