!****	SUBKL.CTL	SEPT-77
@TAKE BATCH.CMD
!*****	ASSEMBLE PROGRAM
MAC::@R MACRO
*SUBKL@
@IF (ERROR) @GOTO BLO
LNK::@RUN DLINK
*SUBKL.SAV/SAV=SUBKL/NOSYM/NOINIT/GO
@IF (ERROR) @GOTO BLO
CRF::@R CREF
*DSK:SUBKL.LST=SUBKL
@IF (ERROR) @GOTO BLO
DC1::@RUN DECDOC.SAV
*SUBKL
@IF (ERROR) @GOTO BLO
DC2::@RUN DECDOC.SAV
*SUBKL/S=SUBKL.TXT,SUBKL.HST,SUBKL.DOC,SUBKL.LST
@IF (ERROR) @GOTO BLO
CNV::@RUN CONVRT.SAV
*SUBKL
@IF (ERROR) @GOTO BLO
DEL::@DEL SUBKL.LST,SUBKL.DOC,SUBKL.REL
@IF (ERROR) @GOTO BLO
@GOTO LOG
!
BLO::@R PIP
*SUBKL.BLO=NUL:FOO
LOG::
     