;	DBKBC.CTL	BATCH CONTROL FILE 
;				******************** SETUP SEARCH-LIST
.R SETSRC
*C /LIB:[400,1066]
*C DSKB,DSKN/NOC,DSKC/NOC,DSKA/NOC
*T
.IF (ERROR) .GOTO LOSE
;				******************** DELETE THE FILES WE WILL BE MAKING
.DELETE DBKBC.REL,DBKBC.LST,DBKBC.LOS,DBKBC.SAV,DBKBC.A10,DBKBC.SEQ
.IF (ERROR) .GOTO LOSE
;				********************  ASSEMBLE PGM 
.R MACRO
*DBKBC@
.IF (ERROR) .GOTO LOSE
;				********************  LOAD PGM 
.R LINK
*DSKB:DBKBC.SAV/SAV=DBKBC/NOSYM/NOINIT/GO
.IF (ERROR) .GOTO LOSE
;				********************  GET XREF LST 
.R CREF
*DSKB:DBKBC.LST=DBKBC
.IF (ERROR) .GOTO LOSE
;				******************** MAKE ASCIIZED LOAD FILE
.RU CONVRT
*DBKBC
.IF (ERROR) .GOTO LOSE
;				********************  CHANGE SEARCH LIST TO MAKE ROOM
.R SETSRC
*C DSKC,DSKB/NOC,DSKN/NOC
*T
.IF (ERROR) .GOTO LOSE
;				********************  COMBINE LISTINGS 
.RU DECDOC.SAV
DBKBC/S=DBKBC.TXT,DBKBC.HST,DBKBC.LST
.IF (ERROR) .GOTO LOSE
;				******************** SEE WHERE WE'RE AT
.R QUOLST
.DIR DBKBC?
;				******************** DELETE JUNK FILES
.DEL DBKBC.LST,DBKBC.REL
.IF (ERROR) .GOTO LOSE
.GOTO KJOB
;DIE IF HERE
LOSE::.R PIP
*DBKBC.LOS=TTY:
*^Z
KJOB::
    