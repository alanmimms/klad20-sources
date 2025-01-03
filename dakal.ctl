!****	DAKAL.CTL
@DEFINE DSK DSK:,<KIRCHOFF>
!*****	ASSEMBLE PROGRAM
MAC::@R MACRO
*DAKAL@
@IF (ERROR) @GOTO BLO
LNK::@R LINK
*DAKAL.SAV/SAV=DAKAL/NOSYM/NOINIT/GO
@IF (ERROR) @GOTO BLO
!****  RUN PROGRAM SIMULATION
SIM::@RUN DIAMON.SAV
*
*KASIM
*Y
*0
*1
*32
*F
*0
*DAKAL/P
@IF (ERROR) @GOTO BLO
CRF::@R CREF
*DSK:DAKAL.LST_DAKAL
@IF (ERROR) @GOTO BLO
DC2::@RUN DECDOC.SAV
*DAKAL/S=DAKAL.TXT,DAKAL.HST,DAKAL.LST,DAKAL.SIM
@IF (ERROR) @GOTO BLO
DEL::@DEL DAKAL.LST,DAKAL.REL,DAKAL.SIM
@IF (ERROR) @GOTO BLO
@GOTO LOG
!
BLO::@R PIP
*DAKAL.BLO=NUL:FOO
LOG::
   