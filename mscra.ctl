!Control file to generate the STIRS diagnostic for the M8622 board - MSCRA
@RU 20SNOB.EXE				!Run SNOBOL set up programs
*MSGGEN.SNO				! Pgm to create Message File	
*MSCRAT.B36				!  STIRS source file for messages
*MSCRA.MSG				!  Message Output File
*DATGEN.SNO				! Pgm to create end of Data Module file
*MSCRAT.B36				!  STIRS source file
*MSCRAD.END				!  end of Data Module Output File
@RUN CLRB35				!clear any bit 35's set by SNOBOL
*MSCRAD.END
@COPY MSCRAD.BEG MSCRAD.B36		!Start building MSCRAD Pgm
@APPEND MSCRAD.END (TO) MSCRAD.B36	!Add end of Data Module file
@RU BLISS				!Compile pgms so far
*MSCRAD.B36				!  Data Module
*MSCRAT.B36/EXIT			!  Test Module
@RU LINK				!Link everything together
*@MSCRA
@RU BLSCRF				!Create cross-reference listings
*MSCRAT=MSCRAT
*MSCRAD=MSCRAD
@
   