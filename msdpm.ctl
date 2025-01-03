!Control file to generate the STIRS diagnostic for the M8621 board - MSDPM
@RU 20SNOB.EXE				!Run SNOBOL set up programs
*MSGGEN.SNO				! Pgm to create Message File	
*MSDPMT.B36				!  STIRS source file for messages
*MSDPM.MSG				!  Message Output File
*DATGEN.SNO				! Pgm to create end of Data Module file
*MSDPMT.B36				!  STIRS source file
*MSDPMD.END				!  end of Data Module Output File
@RUN CLRB35				!clear any bit 35's set by SNOBOL
*MSDPMD.END
@COPY MSDPMD.BEG MSDPMD.B36		!Start building MSDPMD Pgm
@APPEND MSDPMD.END (TO) MSDPMD.B36	!Add end of Data Module file
@RU BLISS				!Compile pgms so far
*MSDPMD.B36				!  Data Module
*MSDPMT.B36/EXIT			!  Test Module
@RU LINK				!Link everything together
*@MSDPM
@RU BLSCRF				!Create cross-reference listings
*MSDPMT=MSDPMT
*MSDPMD=MSDPMD
@
   