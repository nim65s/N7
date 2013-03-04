.include "p24FJ256GB106.inc"	; Définitions pour ucontrôleur
.equiv PLL96DIS_ON,     0xF7FF ; Enabled
.global __reset          ;The label for the first line of code. 
.text						;Start of Code section
__reset:
	MOV #__SP_init, W15       ;Initalize the Stack Pointer
	MOV #__SPLIM_init, W0     ;Initialize the Stack Pointer Limit Register
	MOV W0, SPLIM
							; Initialisation de l'affichage
	RCALL ResetDevice
	RCALL ClearDevice
							; Initialisation des variables d'affichage
	MOV #0, W4					; abscisse
	MOV #0, W5					; ordonnée
	MOV #0, W6					; ligne allumée
	MOV #132, W8				; Abscisse max
							; Initialisation du CAN
	MOV #0X00E0, W0				; AD1CON1: Mode auto-convert
	MOV W0, AD1CON1
	MOV #0X0902, W0				; AD1CON3: une conversion toutes les 1.9us
	MOV W0, AD1CON3
	MOV #0X0C0C, W0				; Sélection d'AN12 (DC-0)
	MOV W0, AD1CHS
	MOV #0, W0
	MOV W0, AD1CON2
	MOV W0, AD1PCFG
	MOV W0, AD1CSSL
	BSET AD1CON1, #ADON			; CAN Activé
	BSET AD1CON1, #SAMP			; On lance le sampling

	CAN:
	BTSS AD1CON1, #DONE		; attente de la conversion
	GOTO CAN

	MOV ADC1BUF0, W7		; lecture de la tension
	BSET AD1CON1, #SAMP		; relancement de la conversion
							; 4 décalages pour passer des 10 bits du CAN aux 64 lignes
	RRNC W7, W7
	RRNC W7, W7
	RRNC W7, W7
	RRNC W7, W7
	MOV #0XFFFF, W10	
	XOR W7, W10, W7			; inversion du résultat (la ligne 63 est en bas...)
	MOV #0X003F, W10
	AND W7, W10, W6			; suppression des bits de poids fort

							; extinction de l'ancienne ligne
	EXTINCTION_LIGNE:
	MOV W4, W0
	MOV W5, W1
	MOV #0, W2
	RCALL PutPixel
	INC W4, W4
	SUB W8, W4, W0
	BRA NZ, EXTINCTION_LIGNE
	MOV #0, W4

	MOV W6, W5				; la ligne courante devient celle qu'il faut allumer
							; allumage de la nouvelle
	ALLUMAGE_LIGNE:
	MOV W4, W0
	MOV W5, W1
	MOV #0XFFFF, W2
	RCALL PutPixel
	INC W4, W4
	SUB W8, W4, W0
	BRA NZ, ALLUMAGE_LIGNE
	MOV #0, W4

	GOTO CAN
	
	BRA $
.end
