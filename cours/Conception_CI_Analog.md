History and Intdustry
=====================

Transistor
==========

La résistance se compte par carrés. un truc long a donc une résistance plus grande qu’un truc carré voire un truc large.
Donc pour un transistor, c’est le rapport W/L qui compte et donc plus il sera long plus il sera efficace.

Basic circuits
==============

Quand on veut une impédance de sortie, on court-circuite l’entrée, mais pour l’impédance d’entrée on met la charge sur la sortie.
=> Cf. symboles sources de tension / courant => quand on les éteint, on vire le cercle.

Si on cascode un mirroir de courant, on a besoin de deux Vds au lieu d’un, mais l’impédance est plus haute et le gain est meilleur.

RF architecture
===============

Phase Lock Loop
===============

exemple: radio

quartz 10MHz -> X -> LP -> VCO -+-> 88-108MHz
                ↑               ↓
                +<---- ÷N <---- +

X => XOR, mais il faut des signaux digitaux, du coup on met un comparateur avec la tension moyenne.


LC VCO:

      Vdd
+------+-------+
|              |
L              L
|     Vin      |
+- C --+--- C -+--> buffer -> out
|              |
+-----\  /-----+
|      \/      |
|-|    /\    |-|
  |---/  \---|
|-|          |-|
|              |
+------+-------+
       |
       |-|
         |---- miroir de courant
       |-|
       |
      GND

Low Nose amplifier
==================

Power amplifier and filtering
=============================

