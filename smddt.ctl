!****	SMDDT.CTL	NOV-78
!*****	ASSEMBLE PROGRAM
MAC::@R MACRO
*SMDDT@
@IF (ERROR) @GOTO BLO
LNK::@RUN DLINK
*SMDDT.SAV/SAV=SMDDT/NOSYM/NOINIT/GO
@IF (ERROR) @GOTO BLO
CRF::@R CREF
*DSK:SMDDT.LST=SMDDT/O
@IF (ERROR) @GOTO BLO
DC2::@RUN DECDOC.SAV
*SMDDT/S=SMDDT.TXT,SMDDT.HST,SMDDT.HLP,SMDDT.LST
@IF (ERROR) @GOTO BLO
DEL::@DEL SMDDT.REL,SMDDT.LST
@IF (ERROR) @GOTO BLO
@GOTO LOG
!
BLO::@R PIP
*SMDDT.BLO=NUL:FOO
LOG::
  