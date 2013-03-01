; Programme de démarrage TP1.S

.include "p24FJ256GB106.inc"	; Définitions pour ucontrôleur

.equiv PLL96DIS_ON,     0xF7FF ; Enabled
; Définition des paramètres de configuration (horloges, USB, watchdog)
; CONFIG 1 : JTAG off, watchdog timer off
config __CONFIG1, JTAGEN_OFF & ICS_PGx2 & FWDTEN_OFF
; CONFIG 2 :Using the 12MHz clock provided by the PIC18F67J50 (debug)
config __CONFIG2, IESO_OFF & PLL96DIS_ON & PLLDIV_DIV3 & FNOSC_PRIPLL & POSCMOD_HS
; Ces paramètres conduisent à une fréquence horloge système de 32 MHz
        .global __reset          ;The label for the first line of code. 

;..............................................................................
;Code Section in Program Memory
;..............................................................................

.text                             ;Start of Code section

__reset:

        MOV #__SP_init, W15       ;Initalize the Stack Pointer
        MOV #__SPLIM_init, W0     ;Initialize the Stack Pointer Limit Register
        MOV W0, SPLIM

		; Multiplication par décalages
		
		MOV #0X1568, W0				; A (faible)
		MOV #0X0000, W1				; A (fort)
		MOV #0XAFB3, W2				; B
		MOV #16, W3					; nombre de rotations

		MOV #0X0000, W4				; Résultat (faible)
		MOV #0x0000, W5				; Résultat (fort)
		

		DEBUT:
		RRC W2, W2					; On décale B vers la gauche
		BRA C, AJOUTE				; Si le dernier bit de B était un 1, on ajoute A au résultat
		FIN_AJOUTE:
		RLC W0, W0					; Décalage de A (faible) vers la droite
		RLC W1, W1					; Décalage de A (fort) vers la droite
		DEC W3, W3					; Une rotation de moins à faire
		ADD #0, W2					; suppression du bit de carry
		;SUB W3, #1
		BRA NZ, DEBUT
		BRA Z, FIN					; S’il n’y a plus de rotation à faire, on a fini

		AJOUTE:
		ADD W0, W4, W4				; On commence par ajouter les poids faible
		BRA C, RETENUE				; S’il y a une retenue, on incrémente le poid fort
		FIN_RETENUE:
		ADD W1, W5, W5				; Puis on ajoute les poids fort
		GOTO FIN_AJOUTE

		RETENUE:
		INC W5, W5
		GOTO FIN_RETENUE

		FIN:
 		BRA $	; boucle sans fin

		; Tests des bits du registre SR (Status Register)

		MOV #0X0000, W0
		ADD #0X0000, W0				; Z passe a 1
		MOV #0XFFFF, W0
		ADD #0X0002, W0				; C passe a 1
		MOV #0X0000, W0
		SUB #0X0005, W0				; N passe a 1
;		
;
;		; Multiplication par addition successives
;
;		MOV #0XFFFF, W0				; A
;		MOV #0XFFFF, W1				; B
;
;		MOV #0X0000, W2				; Init
;		MOV #0x0000, W3
;
;		CP0 W0						; Si A est nul, c'est fini
;		BRA Z, FIN
;		CP0 W1						; Si B est nul, c'est fini
;		BRA Z, FIN
;
;		DEBUT:						; Boucle d'additions
;		ADD W1, W2, W2
;		BRA C, RETENUE				; Traitement de la retenue
;		FINRETENUE:
;		DEC W0, W0					; il reste N-1 additions a faire
;		BRA NZ, DEBUT				; S'il en reste plus de 0, on recommence
;		BRA Z, FIN
;
;		RETENUE:
;		INC W3, W3
;		GOTO FINRETENUE





.end                               ;End of program code in this file
;..............................................................................
