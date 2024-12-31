!**** DSKEC.CTL

@DEFINE DSK: DSK:,Z:<CUSP10>

!**** ASSEMBLE PROGRAM
MAC::@R MACRO
*DSKEC@
@IF (ERROR) @GOTO BLO

!**** RUN LINKER
LNK::@RUN DLINK
*DSKEC.SAV/SAV=DSKEC/GO
@IF (ERROR) @GOTO BLO

!**** MAKE CREF FILE
CRF::@R CREF
*DSK:DSKEC.LST=DSKEC
@IF (ERROR) @GOTO BLO
@RUN DECDOC.SAV
*DSKEC
@IF (ERROR) @GOTO BLO
@RUN DECDOC.SAV
*DSKEC/S=DSKEC.TXT,DSKEC.HST,DSKEC.DOC,DSKEC.LST
@IF (ERROR) @GOTO BLO
@DEL DSKEC.REL,DSKEC.LST,DSKEC.DOC
@IF (ERROR) @GOTO BLO
@GOTO LOG

BLO::@R PIP
*DSKEC.BLO=NUL:FOO
LOG::
