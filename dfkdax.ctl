
!****	DFKDA.CTL
!*****	ASSEMBLE PROGRAM
; *** TO USE "MACRO.V51", ALL THE ".KLM" FILES HAVE TO BE ON YOUR AREA
@DEL DFKDA.BLO,DFKDA.SEQ
@EXPUNGE
DEF::@DEFINE DSK: DSK:,Z:,Z:<CUSP10>
CMT::@Run COMENT
*DFKDAT.MAC
*DFKDAM.MAC
@IF (ERROR) @GOTO BLO
MAC::@MACRO
*DFKDA@
@IF (ERROR) @GOTO BLO
DLNK::@RUN DLINK
*DFKDA.SAV/SAV=DFKDA/SYMSEG:LOW/LOCALS/GO
@IF (ERROR) @GOTO BLO
CRF::@R CREF
*DFKDA.LST=DFKDA.CRF
@IF (ERROR) @GOTO BLO
DC1::@RUN DECDOC
*DFKDA
@IF (ERROR) @GOTO BLO
DC2::@RUN DECDOC
*DFKDA/S=DFKDA.TXT,DFKDA.HST,DFKDA.DOC,DFKDA.LST
@IF (ERROR) @GOTO BLO
DEL::@DEL DFKDA.LST,DFKDA.REL,DFKDA.DOC
@EXPUNGE
@IF (ERROR) @GOTO BLO
CNV::@RUN CONVRT
*DFKDA
@IF (ERROR) @GOTO BLO
@GOTO LOG
!
BLO::@R PIP
*DFKDA.BLO=NUL:FOO
LOG::
   