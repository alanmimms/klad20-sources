!****	DFKAA.CTL
@DEFINE DSK DSK:,<KIRCHOFF>
!*****	ASSEMBLE PROGRAM
MAC::@R MACRO
*DFKAA@
@IF (ERROR) @GOTO BLO
LNK::@R LINK
*DFKAA.SAV/SAV=DFKAA/NOSYM/NOINIT/GO
@IF (ERROR) @GOTO BLO
CRF::@R CREF
*DSK:DFKAA.LST=DFKAA
@IF (ERROR) @GOTO BLO
DC2::@RUN DECDOC.SAV
*DFKAA/S=DFKAA.TXT,DFKAA.HST,DFKAA.LST
@IF (ERROR) @GOTO BLO
CNV::@RUN CONVRT.SAV
*DFKAA
@IF (ERROR) @GOTO BLO
DEL::@DEL DFKAA.LST,DFKAA.REL
@IF (ERROR) @GOTO BLO
@GOTO LOG
!
BLO::@R PIP
*DFKAA.BLO=NUL:FOO
LOG::