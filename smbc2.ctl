!****	SMBC2.CTL	NOV-78
!*****	ASSEMBLE PROGRAM
MAC::@R MACRO
*SMBC2@
@IF (ERROR) @GOTO BLO
MAC1::@R MACRO
*SMMTPB@
@IF (ERROR) @GOTO BLO
MAC2::@R MACRO
*SMPREB@
@IF (ERROR) @GOTO BLO
LNK::@RUN DLINK
*SMBC2.SAV/SAV=SMBC2/NOSYM/NOINIT/GO
@IF (ERROR) @GOTO BLO
@GET SMBC2.SAV
@SAVE
@IF (ERROR) @GOTO BLO
CRF::@R CREF
*DSK:SMBC2.LST=SMBC2/O
@IF (ERROR) @GOTO BLO
CRF1::@R CREF
*DSK:SMMTPB.LST=SMMTPB
@IF (ERROR) @GOTO BLO
CRF2::@R CREF
*DSK:SMPREB.LST=SMPREB
@IF (ERROR) @GOTO BLO
DC::@RUN DECDOC.SAV
*SMBC2/S=SMBC2.TXT,SMBC2.HST,SMMTPB.LST,SMPREB.LST,SMBC2.LST
@IF (ERROR) @GOTO BLO
DEL::@DEL SMBC2.REL,SMBC2.LST,SMMTPB.REL,SMMTPB.LST,SMPREB.REL,SMPREB.LST
@IF (ERROR) @GOTO BLO
@GOTO LOG
!
BLO::@R PIP
*SMBC2.BLO=NUL:FOO
LOG::
    