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

.text						;Start of Code section
__reset:
	MOV #__SP_init, W15       ;Initalize the Stack Pointer
	MOV #__SPLIM_init, W0     ;Initialize the Stack Pointer Limit Register
	MOV W0, SPLIM
							; Initialisation des variables d'affichage
	MOV #0X0000, W4				; abscisse
	MOV #0X0000, W5				; ordonnée
	MOV #0X0084, W8				; Abscisse max
	MOV #0X0040, W9				; Ordonnée max
							; Initialisation ds timer
	BSET T1CON, #15				; Set the TON bit
	BCLR T1CON, #5				; the timer prescaler @ 00 (1:1)
	BCLR T1CON, #4
	BCLR T1CON, #1				; TCS: internal clk
	BCLR T1CON, #6				; TGATE: disabled
	BSET IEC0, #3				; T1IE
	
	RCALL ResetDevice
	RCALL ClearDevice

	RCALL Timer23_on		; Début du timer23

	BRA $
.end                              

.global __T1Interrupt
__T1Interrupt:
							; extinction du pixel
	MOV W4, W0
	MOV W5, W1
	MOV #0X0000, W2
	RCALL PutPixel
							; calcul du pixel suivant
	INC W4, W4
	SUB W8, W4, W0
	BRA NZ, ALLUMAGE
	MOV #0X0000, W4
	INC W5, W5
	SUB W9, W5, W0
	BRA NZ, ALLUMAGE
	RCALL Timer23_off		; Fin du balayage => On regarde l'état du timer23
	BRA $
							; allumage
	ALLUMAGE:
	MOV W4, W0
	MOV W5, W1
	MOV #0XFFFF, W2
	RCALL PutPixel
							; Fin d'interruption
	BCLR IFS0, #T1IF
	RETFIE
