!****	KLAD10.CTL	VERSION 0.3	15-JUN-79
!*****	ASSEMBLE PROGRAM
MAC::@R MACRO
*KLAD10@
@IF (ERROR) @GOTO BLO
@R CREF
*DSK:KLAD10.LST=KLAD10
@IF (ERROR) @GOTO BLO
@RUN DLINK
*KLAD10.SAV/SAV=KLAD10/NOSYM/GO
@IF (ERROR) @GOTO BLO
@R MACY11
*KLADBT@
@IF (ERROR) @GOTO BLO
DC1::@RUN DECDOC.SAV
*KLAD10
@IF (ERROR) @GOTO BLO
DC2::@RUN DECDOC.SAV
KLAD10/S=KLAD10.TXT,KLAD10.HLP,KLAD10.HST,KLAD10.DOC,KLAD10.LST,KLADBT.LST
@IF (ERROR) @GOTO BLO
DEL::@DEL KLAD10.LST,KLAD10.DOC,KLADBT.LST,KLAD10.REL
@IF (ERROR) @GOTO BLO
@GOTO LOG
!
BLO::@R PIP
*KLAD10.BLO=NUL:FOO
LOG::
 