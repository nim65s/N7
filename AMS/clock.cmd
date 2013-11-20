* /home/saurel/telemetre/clock.cmd input netlist
* Creation Date : Wed Nov 20 14:07:35% CET 2013 
*


.tran 0.3us 100us
.op
* User minimum step definition
.option hmin=1e-12
* User integration method selection
.option trap
* User ELDO accuracy specification
.option eps=5e-3
* User ELDO accuracy specification
.option tuning=standard
.end
