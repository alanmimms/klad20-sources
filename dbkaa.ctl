;	DBKAA.CTL	BATCH CONTROL FILE 
;				******************** SETUP SEARCH-LIST
.R SETSRC
*C /LIB:[400,1066]
*C DSKB,DSKN/NOC,DSKC/NOC,DSKA/NOC
*T
.IF (ERROR) .GOTO LOSE
;				******************** DELETE THE FILES WE WILL BE MAKING
.DELETE DBKAA.REL,DBKAA.LST,DBKAA.LOS,DBKAA.SAV,DBKAA.A10,DBKAA?.SIM,DBKAA.SEQ
.IF (ERROR) .GOTO LOSE
;				********************  ASSEMBLE PGM 
.R MACRO
*DBKAA@
.IF (ERROR) .GOTO LOSE
;				********************  LOAD PGM 
.R LINK
*DSKB:DBKAA.SAV/SAV=DBKAA/NOSYM/NOINIT/GO
.IF (ERROR) .GOTO LOSE
;				********************  GET XREF LST 
.R CREF
*DSKB:DBKAA.LST=DBKAA
.IF (ERROR) .GOTO LOSE
;				******************** MAKE ASCIIZED LOAD FILE
.RU CONVRT
*DBKAA
.IF (ERROR) .GOTO LOSE
;				********************  SIMULATE PGM 
.RU DIAMON
*
*KISIM
*0
*32
*F
*0
*DBKAA/P
.IF (ERROR) .GOTO LOSE
;				******************** FIX SEARCH-LIST TO GIVE US MORE ROOM
.R SETSRC
*C /LIB:[400,1066]
*C DSKC,DSKB/NOC,DSKN/NOC,DSKA/NOC
*T
.IF (ERROR) .GOTO LOSE
;				********************  COMBINE LISTINGS 
.RU DECDOC.SAV
DBKAA/S=DBKAA.TXT,DBKAA.HST,DBKAA.LST,DBKAA.SIM
.IF (ERROR) .GOTO LOSE
;				********************  DELETE JUNK FILES 
.DEL DBKAA.LST,DBKAA.REL,DBKAA.SIM
;				******************** SEE WHERE WE'RE AT
.R QUOLST
.DIR DBKAA?
.IF (ERROR) .GOTO LOSE
.GOTO KJOB
;DIE IF HERE
LOSE::.R PIP
*DBKAA.LOS=TTY:
*^Z
KJOB::
  