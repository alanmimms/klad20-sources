File 1)	O:DEFECT.MAC[4,173]	created: 0949 13-Sep-85
File 2)	N:DEFECT.MAC[4,407]	created: 1047 19-Dec-89

1)1		SETZM	1		;AN INDEX REGISTER
1)	DLD1:	MOVE	0,DIST(1)	;GET NEXT DEFECT DISTANCE
****
2)1		MOVSI	1,-4		;MAKE AOBJN POINTER
2)	DLD1:	MOVE	0,DIST(1)	;GET NEXT DEFECT DISTANCE
**************
1)1		AOJA	1,DLD1		;BUMP POINTER AND LOOP
1)	DLDX:	GET	X		;DONE. RESTORE AC'S
****
2)1		AOBJN	1,DLD1		;BUMP POINTER AND LOOP
2)	DLDX:	GET	X		;DONE. RESTORE AC'S
**************
