;	DBKAG.CTL	BATCH CONTROL FILE 
;				******************** SETUP SEARCH-LIST
.R SETSRC
*C /LIB:[400,1066]
*C DSKB,DSKN/NOC,DSKC/NOC,DSKA/NOC
*T
.IF (ERROR) .GOTO LOSE
;				******************** DELETE THE FILES WE WILL BE MAKING
.DELETE DBKAG.REL,DBKAG.LST,DBKAG.LOS,DBKAG.SAV,DBKAG.A10,DBKAG.SIM,DBKAG.SEQ
.IF (ERROR) .GOTO LOSE
;				********************  ASSEMBLE PGM 
.R MACRO
*DBKAG@
.IF (ERROR) .GOTO LOSE
;				********************  LOAD PGM 
.R LINK
*DSKB:DBKAG.SAV/SAV=DBKAG/NOSYM/NOINIT/GO
.IF (ERROR) .GOTO LOSE
;				********************  GET XREF LST 
.R CREF
*DSKB:DBKAG.LST=DBKAG
.IF (ERROR) .GOTO LOSE
;				******************** MAKE ASCIIZED LOAD FILE
.RU CONVRT
*DBKAG
.IF (ERROR) .GOTO LOSE
;				********************  SIMULATE PGM 
.RU DIAMON
*
*KISIM
*0
*32
*F
*0
*DBKAG/P
.IF (ERROR) .GOTO LOSE
;				********************  CHANGE SEARCH LIST TO MAKE ROOM
.R SETSRC
*C DSKC,DSKB/NOC,DSKN/NOC
*T
.IF (ERROR) .GOTO LOSE
;				********************  COMBINE LISTINGS 
.RU DECDOC.SAV
DBKAG/S=DBKAG.TXT,DBKAG.HST,DBKAG.LST,DBKAG.SIM
.IF (ERROR) .GOTO LOSE
;				******************** SEE WHERE WE'RE AT
.R QUOLST
.DIR DBKAG?
;				******************** DELETE JUNK FILES
.DEL DBKAG.LST,DBKAG.REL,DBKAG.SIM
.IF (ERROR) .GOTO LOSE
.GOTO KJOB
;DIE IF HERE
LOSE::.R PIP
*DBKAG.LOS=TTY:
*^Z
KJOB::
   