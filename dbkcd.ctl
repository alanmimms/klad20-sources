;	DBKCD.CTL	BATCH CONTROL FILE 
;				******************** SETUP SEARCH-LIST
.R SETSRC
*C /LIB:[400,1066]
*C DSKB,DSKN/NOC,DSKC/NOC,DSKA/NOC
*T
.IF (ERROR) .GOTO LOSE
;				******************** DELETE THE FILES WE WILL BE MAKING
.DELETE DBKCD.REL,DBKCD.LST,DBKCD.LOS,DBKCD.SAV,DBKCD.A10,DBKCD.SIM,DBKCD.SEQ
.IF (ERROR) .GOTO LOSE
;				********************  ASSEMBLE PGM 
.R MACRO
*DBKCD@
.IF (ERROR) .GOTO LOSE
;				********************  LOAD PGM 
.R LINK
*DSKB:DBKCD.SAV/SAV=DBKCD/NOSYM/NOINIT/GO
.IF (ERROR) .GOTO LOSE
;				********************  GET XREF LST 
.R CREF
*DSKB:DBKCD.LST=DBKCD
.IF (ERROR) .GOTO LOSE
;				******************** MAKE ASCIIZED LOAD FILE
.RU CONVRT
*DBKCD
.IF (ERROR) .GOTO LOSE
;				********************  SIMULATE PGM 
.RU DIAMON
*
*KISIM
*0
*32
*F
*0
*DBKCD/P
.IF (ERROR) .GOTO LOSE
;				********************  CHANGE SEARCH LIST TO MAKE ROOM
.R SETSRC
*C DSKC,DSKB/NOC,DSKN/NOC
*T
.IF (ERROR) .GOTO LOSE
;				********************  COMBINE LISTINGS 
.RU DECDOC.SAV
DBKCD/S=DBKCD.TXT,DBKCD.HST,DBKCD.LST,DBKCD.SIM
.IF (ERROR) .GOTO LOSE
;				******************** SEE WHERE WE'RE AT
.R QUOLST
.DIR DBKCD?
;				******************** DELETE JUNK FILES
.DEL DBKCD.LST,DBKCD.REL,DBKCD.SIM
.IF (ERROR) .GOTO LOSE
.GOTO KJOB
;DIE IF HERE
LOSE::.R PIP
*DBKCD.LOS=TTY:
*^Z
KJOB::
   