!****	DSKAM.CTL	MAR-78
!*****	ASSEMBLE PROGRAM
MAC::@R MACRO
*DSKAM@
@IF (ERROR) @GOTO BLO
LNK::@RUN DLINK
*DSKAM.SAV/SAV=DSKAM/NOSYM/NOINIT/GO
@IF (ERROR) @GOTO BLO
CRF::@R CREF
*DSK:DSKAM.LST=DSKAM/O
@IF (ERROR) @GOTO BLO
SIM::@RUN D20MON.SAV
*KSSIM
*0
*32
*F
*0
*DSKAM.CMD/P
@REN DSKAM.SIM DSKAMA.SIM
SIM1::@RUN D20MON.SAV
*KSSIM
*0
*32
*F
*0
*DSKAM1.CMD/P
@REN DSKAM.SIM DSKAMB.SIM
SIM2::@RUN D20MON.SAV
*KSSIM
*0
*32
*F
*0
*DSKAM2.CMD/P
DC2::@RUN DECDOC.SAV
*DSKAM/S=DSKAM.TXT,DSKAM.HST,DSKAM.LST,DSKAMA.SIM,DSKAMB.SIM,DSKAM.SIM
@IF (ERROR) @GOTO BLO
DEL::@DEL DSKAM.REL,DSKAM.LST,DSKAMA.SIM,DSKAMB.SIM,DSKAM.SIM
@IF (ERROR) @GOTO BLO
@GOTO LOG
!
BLO::@R PIP
*DSKAM.BLO=NUL:FOO
LOG::
  