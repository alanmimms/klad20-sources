;	DBKAJ.CTL	BATCH CONTROL FILE 
;				******************** SETUP SEARCH-LIST
.R SETSRC
*C /LIB:[400,1066]
*C DSKB,DSKN/NOC,DSKC/NOC,DSKA/NOC
*T
.IF (ERROR) .GOTO LOSE
;				******************** DELETE THE FILES WE WILL BE MAKING
.DELETE DBKAJ.REL,DBKAJ.LST,DBKAJ.LOS,DBKAJ.SAV,DBKAJ.A10,DBKAJ.SIM,DBKAJ.SEQ
.IF (ERROR) .GOTO LOSE
;				********************  ASSEMBLE PGM 
.R MACRO
*DBKAJ@
.IF (ERROR) .GOTO LOSE
;				********************  LOAD PGM 
.R LINK
*DSKB:DBKAJ.SAV/SAV=DBKAJ/NOSYM/NOINIT/GO
.IF (ERROR) .GOTO LOSE
;				********************  GET XREF LST 
.R CREF
*DSKB:DBKAJ.LST=DBKAJ
.IF (ERROR) .GOTO LOSE
;				******************** MAKE ASCIIZED LOAD FILE
.RU CONVRT
*DBKAJ
.IF (ERROR) .GOTO LOSE
;				********************  SIMULATE PGM 
.RU DIAMON
*
*KISIM
*0
*32
*F
*0
*DBKAJ/P
.IF (ERROR) .GOTO LOSE
;				********************  CHANGE SEARCH LIST TO MAKE ROOM
.R SETSRC
*C DSKC,DSKB/NOC,DSKN/NOC
*T
.IF (ERROR) .GOTO LOSE
;				********************  COMBINE LISTINGS 
.RU DECDOC.SAV
DBKAJ/S=DBKAJ.TXT,DBKAJ.HST,DBKAJ.LST,DBKAJ.SIM
.IF (ERROR) .GOTO LOSE
;				******************** SEE WHERE WE'RE AT
.R QUOLST
.DIR DBKAJ?
;				******************** DELETE JUNK FILES
.DEL DBKAJ.LST,DBKAJ.REL,DBKAJ.SIM
.IF (ERROR) .GOTO LOSE
.GOTO KJOB
;DIE IF HERE
LOSE::.R PIP
*DBKAJ.LOS=TTY:
*^Z
KJOB::
   