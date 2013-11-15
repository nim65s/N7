// Ordre des entr�es : wri, a1, a0, data[3:0]

// `v  et les caract�res _ sont l� pour la compatibilit� avec VERILOG
// et sont facultatifs

`v 1_00_0000	// ecriture de 1001 � l'adresse 00
`v 1_10_0000	// ecriture de 1001 � l'adresse 00
`v 1_01_0101	// ecriture de 1001 � l'adresse 00
`v 0_00_zzzz	// lecture de l'adresse 00, z -> haute imp�dance



`v 1_00_1111	// ecriture de 1001 � l'adresse 00
`v 1_10_1111	// ecriture de 1001 � l'adresse 00
`v 1_01_1010	// ecriture de 1001 � l'adresse 00
`v 0_01_zzzz	// lecture de l'adresse 00, z -> haute imp�dance


