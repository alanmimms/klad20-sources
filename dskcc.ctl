!****	DSKCC.CTL	MAR-78
!*****	ASSEMBLE PROGRAM
MAC::@R MACRO
*DSKCC@
@IF (ERROR) @GOTO BLO
LNK::@RUN DLINK
*DSKCC.SAV/SAV=DSKCC/NOSYM/NOINIT/GO
@IF (ERROR) @GOTO BLO
CRF::@R CREF
*DSK:DSKCC.LST=DSKCC/O
@IF (ERROR) @GOTO BLO
SIM::@RUN D20MON.SAV
*KSSIM
*0
*32
*F
*0
*DSKCC.CMD/P
DC2::@RUN DECDOC.SAV
*DSKCC/S=DSKCC.TXT,DSKCC.HST,DSKCC.LST,DSKCC.SIM
@IF (ERROR) @GOTO BLO
DEL::@DEL DSKCC.REL,DSKCC.LST,DSKCC.SIM
@IF (ERROR) @GOTO BLO
@GOTO LOG
!
BLO::@R PIP
*DSKCC.BLO=NUL:FOO
LOG::
      