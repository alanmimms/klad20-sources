!****	DAKAK.CTL
@DEFINE DSK DSK:,<KIRCHOFF>
!*****	ASSEMBLE PROGRAM
MAC::@R MACRO
*DAKAK@
@IF (ERROR) @GOTO BLO
LNK::@R LINK
*DAKAK.SAV/SAV=DAKAK/NOSYM/NOINIT/GO
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
*DAKAK/P
@IF (ERROR) @GOTO BLO
CRF::@R CREF
*DSK:DAKAK.LST_DAKAK
@IF (ERROR) @GOTO BLO
DC2::@RUN DECDOC.SAV
*DAKAK/S=DAKAK.TXT,DAKAK.HST,DAKAK.LST,DAKAK.SIM
@IF (ERROR) @GOTO BLO
DEL::@DEL DAKAK.LST,DAKAK.REL,DAKAK.SIM
@IF (ERROR) @GOTO BLO
@GOTO LOG
!
BLO::@R PIP
*DAKAK.BLO=NUL:FOO
LOG::
   