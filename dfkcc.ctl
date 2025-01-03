!**** DFKCC.CTL
@DEFINE SYS: SYS:,DSK:

@DEFINE DSK: DSK:,MORDOR:<CUSP10>

!**** ASSEMBLE PROGRAM
MAC::@R MACRO
*DFKCC@
@IF (ERROR) @GOTO BLO

!**** RUN LINKER
LNK::@DLINK
*DFKCC.SAV/SAV=DFKCC/GO
@IF (ERROR) @GOTO BLO

!**** MAKE .A10 FILE
CNV::@RUN CONVRT
*DFKCC
@IF (ERROR) @GOTO BLO

!**** MAKE SEQ FILE
CRF::@R CREF
*DSK:DFKCC.LST=DFKCC
@IF (ERROR) @GOTO BLO
@RUN DECDOC.SAV
*DFKCC
@IF (ERROR) @GOTO BLO
@RUN DECDOC.SAV
*DFKCC/S=DFKCC.TXT,DFKCC.HST,DFKCC.DOC,DFKCC.LST
@IF (ERROR) @GOTO BLO

@DEL DFKCC.REL,DFKCC.LST,DFKCC.DOC
@IF (ERROR) @GOTO BLO
@GOTO LOG

BLO::@R PIP
*DFKCC.BLO=NUL:FOO
LOG::
 