;****	DBKDC.CTL	1-JULY-76
;*****	ASSEMBLE PROGRAM
MAC::.R MACRO
*DBKDC@
.IF (ERROR) .GOTO BLO
LNK::.R LINK
*DBKDC.SAV/SAV=DBKDC/NOSYM/NOINIT/GO
.IF (ERROR) .GOTO BLO
CRF::.R CREF
*DSK:DBKDC.LST_DBKDC
.IF (ERROR) .GOTO BLO
DC1::.RUN DECDOC.SAV
*DBKDC
.IF (ERROR) .GOTO BLO
DC2::.RUN DECDOC.SAV
*DBKDC/S=DBKDC.TXT,DBKDC.HST,DBKDC.DOC,DBKDC.LST
.IF (ERROR) .GOTO BLO
CNV::.RUN CONVRT.SAV
*DBKDC
.IF (ERROR) .GOTO BLO
DEL::.DEL DBKDC.LST,DBKDC.DOC,DBKDC.REL
.IF (ERROR) .GOTO BLO
.GOTO LOG
;
BLO::.R PIP
*DBKDC.BLO=NUL:FOO
LOG::
   