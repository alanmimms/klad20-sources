;****	DBKDA.CTL	9-JUNE-76
;*****	ASSEMBLE PROGRAM
MAC::.R MACRO
*DBKDA@
.IF (ERROR) .GOTO BLO
LNK::.R LINK
*DBKDA.SAV/SAV=DBKDA/SYMSEG:LOW/LOCALS/GO
.IF (ERROR) .GOTO BLO
CRF::.R CREF
*DSK:DBKDA.LST_DBKDA
.IF (ERROR) .GOTO BLO
DC1::.RUN DECDOC.SAV
*DBKDA
.IF (ERROR) .GOTO BLO
DC2::.RUN DECDOC.SAV
*DBKDA/S=DBKDA.TXT,DBKDA.HST,DBKDA.DOC,DBKDA.LST
.IF (ERROR) .GOTO BLO
CNV::.RUN CONVRT.SAV
*DBKDA
.IF (ERROR) .GOTO BLO
DEL::.DEL DBKDA.LST,DBKDA.DOC,DBKDA.REL
.IF (ERROR) .GOTO BLO
.GOTO LOG
;
BLO::.R PIP
*DBKDA.BLO=NUL:FOO
LOG::
   