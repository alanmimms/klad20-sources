!Control file to generate the STIRS diagnostic for the M8616 board - MSCSL
@RU 20SNOB.EXE				!Run SNOBOL set up programs
*MSGGEN.SNO				! Pgm to create Message File	
*MSCSLT.B36				!  STIRS source file for messages
*MSCSL.MSG				!  Message Output File
*DATGEN.SNO				! Pgm to create end of Data Module file
*MSCSLT.B36				!  STIRS source file
*MSCSLD.END				!  end of Data Module Output File
@RU CLRB35				!clear any bit 35's set by SNOBOL
*MSCSLD.END
@COPY MSCSLD.BEG MSCSLD.B36		!Start building MSCSLD Pgm
@APPEND MSCSLD.END (TO) MSCSLD.B36	!Add end of Data Module file
@RU BLISS				!Compile pgms so far
*MSCSLD.B36				!  Data Module
*MSCSLT.B36/EXIT			!  Test Module
@RU LINK				!Link everything together
*@MSCSL
@RU BLSCRF				!Create cross-reference listings
*MSCSLT=MSCSLT
*MSCSLD=MSCSLD
@
    