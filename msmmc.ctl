!Control file to generate the STIRS diagnostic for the M8618 board - MSMMC
@RU 20SNOB.EXE				!Run SNOBOL set up programs
*MSGGEN.SNO				! Pgm to create Message File	
*MSMMCT.B36				!  STIRS source file for messages
*MSMMC.MSG				!  Message Output File
*DATGEN.SNO				! Pgm to create end of Data Module file
*MSMMCT.B36				!  STIRS source file
*MSMMCD.END				!  end of Data Module Output File
@RUN CLRB35				!clear any bit 35's set by SNOBOL
*MSMMCD.END
@COPY MSMMCD.BEG MSMMCD.B36		!Start building MSMMCD Pgm
@APPEND MSMMCD.END (TO) MSMMCD.B36	!Add end of Data Module file
@RU BLISS				!Compile pgms so far
*MSMMCD.B36				!  Data Module
*MSMMCT.B36/EXIT			!  Test Module
@RU LINK				!Link everything together
*@MSMMC
@RU BLSCRF				!Create cross-reference listings
*MSMMCT=MSMMCT
*MSMMCD=MSMMCD
@