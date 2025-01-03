;	DBKAB.CTL	BATCH CONTROL FILE 
;				******************** SETUP SEARCH-LIST
.R SETSRC
*C /LIB:[400,1066]
*C DSKB,DSKN/NOC,DSKC/NOC,DSKA/NOC
*T
.IF (ERROR) .GOTO LOSE
;				******************** DELETE THE FILES WE WILL BE MAKING
.DELETE DBKAB.REL,DBKAB.LST,DBKAB.LOS,DBKAB.SAV,DBKAB.A10,DBKAB.SIM,DBKAB.SEQ
.IF (ERROR) .GOTO LOSE
;				********************  ASSEMBLE PGM 
.R MACRO
*DBKAB@
.IF (ERROR) .GOTO LOSE
;				********************  LOAD PGM 
.R LINK
*DSKB:DBKAB.SAV/SAV=DBKAB/NOSYM/NOINIT/GO
.IF (ERROR) .GOTO LOSE
;				********************  GET XREF LST 
.R CREF
*DSKB:DBKAB.LST=DBKAB
.IF (ERROR) .GOTO LOSE
;				******************** MAKE ASCIIZED LOAD FILE
.RU CONVRT
*DBKAB
.IF (ERROR) .GOTO LOSE
;				********************  SIMULATE PGM 
.RU DIAMON
*
*KISIM
*0
*32
*F
*0
*DBKAB/P
.IF (ERROR) .GOTO LOSE
;				********************  CHANGE SEARCH LIST TO MAKE ROOM
.R SETSRC
*C DSKC,DSKB/NOC,DSKN/NOC
*T
.IF (ERROR) .GOTO LOSE
;				********************  COMBINE LISTINGS 
.RU DECDOC.SAV
DBKAB/S=DBKAB.TXT,DBKAB.HST,DBKAB.LST,DBKAB.SIM
.IF (ERROR) .GOTO LOSE
;				********************  DELETE JUNK FILES 
.DEL DBKAB.LST,DBKAB.REL,DBKAB.SIM
;				******************** SEE WHERE WE'RE AT
.R QUOLST
.DIR DBKAB?
.IF (ERROR) .GOTO LOSE
.GOTO KJOB
;DIE IF HERE
LOSE::.R PIP
*DBKAB.LOS=TTY:
*^Z
KJOB::
 