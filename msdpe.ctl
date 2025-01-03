!Control file to generate the STIRS diagnostic for the M8620 board - MSDPE
@RU 20SNOB.EXE				!Run SNOBOL set up programs
*MSGGEN.SNO				! Pgm to create Message File	
*MSDPET.B36				!  STIRS source file for messages
*MSDPE.MSG				!  Message Output File
*DATGEN.SNO				! Pgm to create end of Data Module file
*MSDPET.B36				!  STIRS source file
*MSDPED.END				!  end of Data Module Output File
@RUN CLRB35				!clear any bit 35's set by SNOBOL
*MSDPED.END
@COPY MSDPED.BEG MSDPED.B36		!Start building MSDPED Pgm
@APPEND MSDPED.END (TO) MSDPED.B36	!Add end of Data Module file
@RU BLISS				!Compile pgms so far
*MSDPED.B36				!  Data Module
*MSDPET.B36/EXIT			!  Test Module
@RU LINK				!Link everything together
*@MSDPE
@RU BLSCRF				!Create cross-reference listings
*MSDPET=MSDPET
*MSDPED=MSDPED
@
   