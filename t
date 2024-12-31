!    JEFFREY ARNO BARRY  29857   02-DEC-76   EDIT#10
THIS TECO ROUTINE LOADS INTO QR? EVERYTHING WHICH FOLLOWS IT IN THE
FILE AND IS DELIMITED BY QR? AND ENDQR? WHERE ? IS A VALID Q REG.
NUMBER.  IT THEN EXECUTES THE CONTENTS OF QRC.  THIS ROUTINE IS DESIGNED
FOR OPERATION IN QR0, AS ALL SYSTEM LOADERS START AT ZERO.!


!LOADER-QR0! J 2SXXX
<_!QR!; .U2 RR IQ2,.X  .-5,.+1X1 -5D
:S!ENDQR!"E A Q2J :S!ENDQR!"E PUNTLOAD '' M1> HK MC !XXX!



!PROGRAMMING CONVENTIONS FOR THE SUBROUTINES:
1. A STRING AT THE END OF THE BUFFER IS ALWAYS DELIMITED BY Q0,Z.  QR0
   IS NEVER USED FOR ANY OTHER PURPOSE BY THE SUBROUTINES.  THESE Q0,Z
   STRINGS ARE USED AS ARGUMENTS BY MANY SUBROUTINES, AND THEY ARE
   NEVER DELETED AFTER USE.  IT IS THE USERS RESPONSIBILITY
   TO DELETE THEM.
2. A STRING AT A RANDOM LOCATION IS DELIMITED BY Q1,. ALWAYS.
3. FUNCTIONS WHICH RETURN MULTIPLE STRING ARGUMENTS RETURN THEM IN
   Q1,Q2,Q3,... IN ACSII ORDER WHERE POSSIBLE.
4. GENERATED FUNCTIONS WHICH RETURN A VALUE RETURN IT IN QR0. THE 
   BUFFER POINTER MAY ALSO BE MODIFIED.
5. STATIC FUNCTIONS WHICH RETURN A VALUE RETURN IT IN QRX.  THE
   BUFFER POINTER MAY ALSO BE MODIFIED.
6. "CALL THROUGH" FUNCTION NAMES ARE PASSED AS THE DECIMAL VALUE OF THE
   Q REGISTER NAME IN QRX.  (EG.  ^^YUX ME DOES AN MY VIA ME)
!


!QUICK SUBROUTINE REFERENCE:
B  BACK-UP..CLOSES & REOPENS THE FILE..REPOSITIONS IT
C  TECO PROGRAM LOAD OR EB SEQUENCE
E  CALLS SPECIFIED Q REG FUNCTION WITH A Q1,. STRING
F  SETS UP EB,ER,EW CMDS FROM A Q0,Z STRING
H  CONVERTS A HEXADECIMAL Q0,Z STRING INTO A DECIMAL VALUE
I  MISCELLANEOUS INTERACTIVE FUNCTIONS (LOOK AT IT)
Q  PUTS Q0,Z STRING INTO SPECIFIED Q REG
R  READS IN A Q0,Z STRING UNTIL DOUBLE ALTMODE
T  TAB FUNCTION--USES COLUMN NUMBERS
V  SETS UP SEARCH CMDS FROM A Q0,Z STRING
!
!Q REG FUNCTION R DOES A READ FROM TTY. HE FIRST PROMPTS THE USER
WITH A <CRLF>@.  THE USER THEN TYPES IN A STRING TERMINATED WITH A
DOUBLE ALTMODE. SINGLE ALTMODES REMAIN IN THE STRING.
RUBOUTS MAY BE USED FOR CORRECTIONS ONLY, AND NOT AS PART OF THE
STRING.  THE STRING IS DEPOSITED AT THE END OF THE BUFFER AND IS DELIM-
ITED BY Q0,Z UPON RETURN. BUFPNT (.) IS UNALTERED.!

!QRR! [6[7[8 0U6 .U8 ZJ .U0 
@ <^TU7 Q7-127"E 0U6 Q0-."L .-1,.T -D''
Q7-27"E Q6-27"E -D 1;'' Q7-127"N Q7U6 Q7I'
Q7-21"E  ^U...
 <Q0-.; -C 1A-10"E C 0;' D> .-Q0"E 
@' '> 
 Q8J ]8]7]6 !ENDQRR!



!Q REG FUNCTION E COPIES A STRING FROM Q1,. TO THE END OF THE BUFFER,
DOES A CALL TO THE FUNCTION NAMED IN QRX, THEN DELETES THE Q0,Z
STRING THAT IT JUST GENERATED.  QRX IS TRASHED, NOTHING ELSE IS
AFFECTED BY QRE ITSELF, THOUGH THE NAMED FUNCTION MAY CHANGE SOMETHING.!

!QRE! [0[2[3 .U2 Q1,.X3 ZJ .U0 IM QXI IQ0,ZK Q2\ IJ Q0,ZXX Q0,ZK
G3 Q2J ]3]2 MX ]0  !ENDQRE!



!Q REG FUNCTION F TAKES A FILESPEC DELIMITED BY Q0,Z AND CREATES EB,ER,
AND EW COMMANDS FROM IT AND PLACES THEM IN QR1, QR2, AND QR3 RESPEC-
TIVELY.  Q0,Z IS KILLED, NOTHING ELSE IS ALTERED.!

!QRF! [4 .U4 ZJ @I\\ Q0J
IEB .-2,ZX1 -D IR .-2,ZX2 -D IW .-2,ZX3
-2D ZJ-D Q4J ]4 !ENDQRF!



!Q REG FUNCTION C IS A SORT OF A CONTROL PROGRAM WHO DOES ONE OF TWO
THINGS, FIRST HE GETS A FILESPEC FROM TTY AND THEN EITHER DOES AN EB 
COMMAND WITH IT, OR, IF THE FILE WAS A .TEC FILE, HE LOADS QRO (NOT
QR0) WITH THE ENTIRE CONTENTS OF THE FILE.  IN THIS LATTER CASE
HE DOES NOT AFFECT THE CONTENTS OF THE BUFFER OR THE POINTER.  QRC
DESTROYS Q0 THRU Q3.  ONCE QRO IS LOADED, HE EXECUTES IT.  IF THE
FILESPEC GIVEN WAS NOT A .TEC FILE, QRC LOOKS FOR A DATE IN THE FIRST
PAGE OF THE FILE, AND GIVES THE USER A CHANCE TO UPDATE IT.!

!QRC!! ! TYPE FILESPEC [4 .U4 MR Q0-Z"E OI' MF Q0J :S.TEC"L OE'
Q0,ZK M1 I! G1 .U4 GC Q4J 2S! Q4,.-1K Q0,ZXC
Y <Z-1; P> !I! J Z"E ]4 '
:SDD-AAA-DD"E OV ' !D! DATE:  .-9,.T
MR Q0-Z"E OV ' Z-Q0-9"G Q0,ZK OD' Q0,ZX4 -9C Z-Q0D G4 Q0,ZK
!V! J :SEDIT#"E ]4 J ' .U4 \U0 Q4,.K %0\ Q4-5,.T 
 ]4 J    !E! Q0,ZK M2 <ZU2 A Q2-Z;> Q0,ZXO Q0,ZK Q4J ]4 MO  !ENDQRC!
!Q REG FUNCTION Q LOADS THE SPECIFIED Q REG (0-9, A-Z) WITH THE STRING
Q0+1,Z WHERE THE Q REG IS THE CHARACTER FOLLOWING POINTER Q0.
NOTHING ELSE IS CHANGED.!

!QRQ! [Z[Y .UY Q0J I]ZQ0+1,ZX C Q0,.XZ -C -9D QYJ ]Y MZ !ENDQRQ!



!Q REGISTER FUNCTION V SETS UP AN N, S, AND _ SEARCH IN Q REGS 1,2,
AND 3 RESPECTIVELY.  THESE ARE :@ SEARCHES WHICH RETURN -1 IN QR0 IF
THE STRING IS FOUND, 0 OTHERWISE.  THE INPUT FOR THIS ROUTINE
IS A Q0,Z STRING WHICH MUST NOT CONTAIN A ^C CHARACTER.!

!QRV! [4 .U4 Q0J I:@N 3I ZJ 3I IU0 Q0,ZX1
Q0J 2C D IS Q0,ZX2    -D I_ Q0,ZX3    -3DD ZJ -3D Q4J ]4 !ENDQRV!




!Q REG FUNCTION H TAKES THE Q0,Z STRING, WHICH IS A HEXADECIMAL
CHARACTER STRING, AND CONVERTS IT TO A DECIMAL VALUE RETURNED IN QRX!

!NOTE: CURRENTLY WORKS ONLY FOR NUMBERS FROM 0 TO 2**35-1 !

!QRH! Q0"L OE' Z-Q0-1"L OE' Z-Q0-9"G OE' [1[2 .U1
0UX Q0J <1AU2 Q2-47"G Q2-58"L Q2-48U2'' Q2-64"G Q2-71"L Q2-55U2''
Q2-15"G OE' QX*16+Q2UX C .-Z;> OX !E! MH PARAM ERR
  !X!  Q1J ]2]1 !ENDQRH!



!Q REGISTER I PERFORMS VARIOUS INTERACTIVE FUNCTIONS, WHICH ONE
DEPENDING ON THE NUMBER IN QRX.  0 IS FOR HELP.!

!QRI! [1[2[3 .U1 QX-0"E O0' QX-1"E O1' QX-2"E O2' QX-3"E O3'
QX-4"E O4'
!0! QRX=0	TYPE THIS MSG
=1	COUNT CRLF'S FROM B TO .
=2	COUNT CRLF'S FROM B TO Z
=3	COUNT CRLF'S FROM . TO Z
=4	SELECTIVE LINE EDT. <RO>=DELETE, <SP>=KEEP, <ALT>=EXIT,
	I=INPUT A STRING
 OX
!1! J 0U2 <L %2 .-Q1;> .-Q1"G Q2-1U2' Q2= OX
!2! J !3! 0U2 <L %2 .-Z;> Q2= OX
!4! <0TT ^TU2 Q2-^^"E 1;' Q2-^^ "E L' Q2-127"E 0KK'
Q2-^^I"E [0 0L .U3 MR Q0,ZX2 Q0,ZK  Q3J G2 ]0'> OX2
!X! Q1J !X2! ]3]2]1 !ENDQRI!
!Q REGISTER FUNCTION B IS THE BACKUP FUNCTION.  IT WORKS BY
INSERTING A MARKER INTO THE FILE, OUTPUTTING THE REMAINDER,
CLOSING, RE-OPENING, SEARCHING FOR AND DELETING THE MARKER.
IF WE ARE ALREADY AT THE END OF THE FILE THEN MB CLOSES IT AND
REOPENS IT AT THE BEGINNING: THE FILE IS SAVED AND "REWOUND".!

!QRB! [0[1[2[3 .U1 ZJ .U0 GC Q0J :S! !"L NO FILESPEC FOR MB
 Q0,ZK TYPE FILESPEC MR Q0-Z"E  Q1J ]3]2]1]0 ' [1 MF
Q0,ZK I! G1 ]1 [4 .U4 GC Q4J 2S! Q4,.-1K ]4 Q0,ZXC ' Q0,ZK Q1J
^N"L Z"E ^E"E <NQWERTY;> EF FILE SAVED
 GC J S! B,.K S! .-1,ZK HX2 HK M2 Y FILE REWOUND
 OBX '''
IQWERTY 6R 30<-.; R 1A-12"E C 1;'> .,Q1+6X1 <NQWERTY;> EF FILE SAVED
 G1 BU0 MV HK     
GC J S! B,.K S! .-1,ZK HX2 HK
M2 M1 Q0"E MARKER NOT FOUND
 ' -6D !BX! ]3]2]1]0 !ENDQRB!




!Q REGISTER FUNCTION T IS A TAB FUNCTION WHICH DOES ONE OF 2 THINGS:
1. IF QX=0, THE "COLUMN NUMBER" OF THE CHAR. AFTER "." IS RETURNED IN X.
2. IF QX=+N, . IS MOVED TO THE POSITION IMMED. PRECEDING THE CHAR IN
   COLUMN N, UNLESS N IS COVERED BY A TAB, IN WHICH CASE . GOES AFTER
   THAT TAB CHARACTER.  QX IS SET TO THE RESULTING COLUMN NUMBER.!

!QRT! [4[5 .U4 0L 0U5
<QX"E .-Q4;'  QX"G Q5+1-QX;'
1A-13"E 1;'   1A-9"E (Q5+8)&(-8)-1U5'  C %5   >
Q5+1UX  ]5]4   !ENDQRT!
  