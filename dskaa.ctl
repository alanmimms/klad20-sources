!****	DSKAA.CTL	MAR-78
!*****	ASSEMBLE PROGRAM
MAC::@R MACRO
*DSKAA@
@IF (ERROR) @GOTO BLO
LNK::@RUN DLINK
*DSKAA.SAV/SAV=DSKAA/NOSYM/NOINIT/GO
@IF (ERROR) @GOTO BLO
CRF::@R CREF
*DSK:DSKAA.LST=DSKAA/O
@IF (ERROR) @GOTO BLO
SIM::@RUN D20MON.SAV
*KSSIM
*0
*32
*F
*0
*DSKAA.CMD/P
DC2::@RUN DECDOC.SAV
*DSKAA/S=DSKAA.TXT,DSKAA.HST,DSKAA.LST,DSKAA.SIM
@IF (ERROR) @GOTO BLO
DEL::@DEL DSKAA.REL,DSKAA.LST,DSKAA.SIM
@IF (ERROR) @GOTO BLO
@GOTO LOG
!
BLO::@R PIP
*DSKAA.BLO=NUL:FOO
LOG::
      