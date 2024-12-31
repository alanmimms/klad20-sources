]1
[1
!STIMULUS
	WRT 113,105,107,111,103 - Write 0's to the 8080 bus
				  data registers
	WRT 210/143 - Set:  CONSOLE REQ, T ENB FOR COM/ADR,
			    LATCH DATA SENT, R CLK ENB L
	RD 103,3,2,1,0 - 8080 Regs should contain the data
			 put on the bus
RESPONSE
	Bus data bit \D0 is stuck at \D1
!
[2
!STIMULUS
	WRT 113,105,107,111,103 - Write 0's to the 8080 bus
				  data registers
	WRT 210/143 - Set:  CONSOLE REQ, T ENB FOR COM/ADR,
			    LATCH DATA SENT, R CLK ENB L
	RD 103,3,2,1,0 - 8080 Regs should contain the data
			 put on the bus
RESPONSE
	Bus data bits \S0 are stuck at \D1
!
[3
!STIMULUS
	WRT 113,105,107,111,103 - Write 0's to the 8080 bus
				  data registers
	WRT 210/143 - Set:  CONSOLE REQ, T ENB FOR COM/ADR,
			    LATCH DATA SENT, R CLK ENB L
	RD 103,3,2,1,0 - 8080 Regs should contain the data
			 put on the bus
RESPONSE
	Bus data bits 00-35 has some bits stuck at \D1
!
]2
[1
!STIMULUS
	MR	Master Reset
	ER 102	Examine 8080 Reg 102 - Should be all 0's
RESPONSE
	'RESET' signal is asserted     102:  \O0
!
[2
!STIMULUS
	MR	Master Reset
	ER 102	Examine 8080 Reg 102 - Should be all 0's
RESPONSE
	'MEM BUSY' signal is asserted     102:  \O0
!
[3
!STIMULUS
	MR	Master Reset
	ER 102	Examine 8080 Reg 102 - Should be all 0's
RESPONSE
	'I/O BUSY' signal is asserted     102:  \O0
!
[4
!STIMULUS
	MR	Master Reset
	ER 102	Examine 8080 Reg 102 - Should be all 0's
RESPONSE
	'BAD DATA' signal is asserted     102:  \O0
!
[5
!STIMULUS
	MR	Master Reset
	ER 102	Examine 8080 Reg 102 - Should be all 0's
RESPONSE
	'COM ADR' signal is asserted     102:  \O0
!
[6
!STIMULUS
	MR	Master Reset
	ER 102	Examine 8080 Reg 102 - Should be all 0's
RESPONSE
	'I/O DATA' signal is asserted     102:  \O0
!
[7
!STIMULUS
	MR	Master Reset
	ER 102	Examine 8080 Reg 102 - Should be all 0's
RESPONSE
	'DATA' signal is asserted     102:  \O0
!
]3
[1
!STIMULUS
	MR,SYNC CLOCKS	    T & R Clocks synced in maintenance mode
	LR (REG),DR (DATA)  Write Com/Adr cycle & data cycle data to 8080
				Regs 102...115 - Read Mem Stat Reg
	LR 210,DR 361	    Write 'I/O READ' control bits - CHECK NXM,CONSOLE
				REQ,T ENB FOR COM/ADR & DATA,
	Tick clock while watching for 'I/O BUSY' in 8080 I/O Reg 102
	  (It should assert only on a 'STATUS I/O WRITE') then watch
	  for it to clear
RESPONSE
	KS10 timed out - MMC failed to respond for 60 seconds
	Clock ticks given:  to see 'I/O BUSY' - \D0   Reg 102: \O2
			  to clear 'I/O BUSY' - \D1   Reg 102: \O3
!
[2
!STIMULUS
	MR,SYNC CLOCKS	    T & R Clocks synced in maintenance mode
	LR (REG),DR (DATA)  Write Com/Adr cycle & data cycle data to 8080
				Regs 102...115 - Read Mem Stat Reg
	LR 210,DR 361	    Write 'I/O READ' control bits - CHECK NXM,CONSOLE
				REQ,T ENB FOR COM/ADR & DATA,
	Tick clock while watching for 'I/O BUSY' in 8080 I/O Reg 102
	  (It should assert only on a 'STATUS I/O WRITE')
	Turn clocks back on then check to see if a ?MRE results
RESPONSE
	?MRE occurred - MMC hung?
	Clock ticks given:  to see 'I/O BUSY' - \D0   Reg 102: \O2
			  to clear 'I/O BUSY' - \D1   Reg 102: \O3
	8080 REG 101: \O4
!
[3
!STIMULUS
	MR,SYNC CLOCKS	    T & R Clocks synced in maintenance mode
	LR (REG),DR (DATA)  Write Com/Adr cycle & data cycle data to 8080
				Regs 102...115 - Read Mem Stat Reg
	LR 210,DR 361	    Write 'I/O READ' control bits - CHECK NXM,CONSOLE
				REQ,T ENB FOR COM/ADR & DATA,
	Tick clock while watching for 'I/O BUSY' in 8080 I/O Reg 102
	  (It should assert only on a 'STATUS I/O WRITE')
	Turn clocks back on then check to see if a ?MRE results
RESPONSE
	'I/O BUSY' appeared in Reg 102 
	Clock ticks given:  to see 'I/O BUSY' - \D0   Reg 102: \O2
			  to clear 'I/O BUSY' - \D1   Reg 102: \O3
!
[4
!STIMULUS
	MR,SYNC CLOCKS	    T & R Clocks synced in maintenance mode
	LR (REG),DR (DATA)  Write Com/Adr cycle & data cycle data to 8080
				Regs 102...115 - Read Mem Stat Reg
	LR 210,DR 361	    Write 'I/O READ' control bits - CHECK NXM,CONSOLE
				REQ,T ENB FOR COM/ADR & DATA,
	Tick clock while watching for 'I/O BUSY' in 8080 I/O Reg 102
	  (It should assert only on a 'STATUS I/O WRITE')
	Turn clocks back on then check to see if a ?MRE results
RESPONSE
	'I/O BUSY' still asserted in Reg 102
	Clock ticks given:  to see 'I/O BUSY' - \D0   Reg 102: \O2
			  to clear 'I/O BUSY' - \D1   Reg 102: \O3
!
[5
!STIMULUS
	MR,SYNC CLOCKS	    T & R Clocks synced in maintenance mode
	LR (REG),DR (DATA)  Write Com/Adr cycle & data cycle data to 8080
				Regs 102...115 - Write 0's to Mem Stat Reg
	LR 210,DR 361	    Write 'I/O WRITE' control bits - CHECK NXM,CONSOLE
				REQ,T ENB FOR COM/ADR & DATA,
	Tick clock until 'I/O BUSY' appears in 8080 I/O Reg 102
	Tick clock until 'I/O BUSY' clears from 8080 I/O Reg 102
RESPONSE
	KS10 timed out - MMC failed to respond for 60 seconds
	Clock ticks given:  to see 'I/O BUSY' - \D0   Reg 102: \O2
			  to clear 'I/O BUSY' - \D1   Reg 102: \O3
!
[6
!STIMULUS
	MR,SYNC CLOCKS	    T & R Clocks synced in maintenance mode
	LR (REG),DR (DATA)  Write Com/Adr cycle & data cycle data to 8080
				Regs 102...115 - Write 0's to Mem Stat Reg
	LR 210,DR 361	    Write 'I/O WRITE' control bits - CHECK NXM,CONSOLE
				REQ,T ENB FOR COM/ADR & DATA,
	Tick clock until 'I/O BUSY' appears in 8080 I/O Reg 102
	Tick clock until 'I/O BUSY' clears from 8080 I/O Reg 102
	Turn clocks back on then check to see if a ?MRE results
RESPONSE
	?MRE occurred - MMC hung?
	Clock ticks given:  to see 'I/O BUSY' - \D0   Reg 102: \O2
			  to clear 'I/O BUSY' - \D1   Reg 102: \O3
	8080 Reg 101: \O4
!
[7
!STIMULUS
	MR,SYNC CLOCKS	    T & R Clocks synced in maintenance mode
	LR (REG),DR (DATA)  Write Com/Adr cycle & data cycle data to 8080
				Regs 102...115 - Write 0's to Mem Stat Reg
	LR 210,DR 361	    Write 'I/O WRITE' control bits - CHECK NXM,CONSOLE
				REQ,T ENB FOR COM/ADR & DATA,
	Tick clock until 'I/O BUSY' appears in 8080 I/O Reg 102
	Tick clock until 'I/O BUSY' clears from 8080 I/O Reg 102
	Turn clocks back on then check to see if a ?MRE results
RESPONSE
	'I/O BUSY' never appeared in Reg 102
	Clock ticks given:  to see 'I/O BUSY' - \D0   Reg 102: \O2
			  to clear 'I/O BUSY' - \D1   Reg 102: \O3
!
[8
!STIMULUS
	MR,SYNC CLOCKS	    T & R Clocks synced in maintenance mode
	LR (REG),DR (DATA)  Write Com/Adr cycle & data cycle data to 8080
				Regs 102...115 - Write 0's to Mem Stat Reg
	LR 210,DR 361	    Write 'I/O WRITE' control bits - CHECK NXM,CONSOLE
				REQ,T ENB FOR COM/ADR & DATA,
	Tick clock until 'I/O BUSY' appears in 8080 I/O Reg 102
	Tick clock until 'I/O BUSY' clears from 8080 I/O Reg 102
	Turn clocks back on then check to see if a ?MRE results
RESPONSE
	'I/O BUSY' never cleared from Reg 102
	Clock ticks given:  to see 'I/O BUSY' - \D0   Reg 102: \O2
			  to clear 'I/O BUSY' - \D1   Reg 102: \O3
!
]4
[1
!STIMULUS
	MR,SYNC CLOCKS	    T & R Clocks synced in maintenance mode
	LR (REG),DR (DATA)  Write Com/Adr cycle & data cycle data to 8080
				Regs 102...115 - Read mem loc 0
	LR 210,DR 360	    Write 'MEM READ' control bits - CHECK NXM,CONSOLE
				REQ,T ENB FOR COM/ADR & DATA
	Tick clock while watching for 'MEM BUSY' in 8080 I/O Reg 102
	  then watch for it to disappear
RESPONSE
	KS10 timed out - MMC failed to respond for 60 seconds
	Clock ticks given:  to see 'MEM BUSY' - \D0   Reg 102: \O2
			  to clear 'MEM BUSY' - \D1   Reg 102: \O3
!
[2
!STIMULUS
	MR,SYNC CLOCKS	    T & R Clocks synced in maintenance mode
	LR (REG),DR (DATA)  Write Com/Adr cycle & data cycle data to 8080
				Regs 102...115 - Read mem loc 0
	LR 210,DR 360	    Write 'MEM READ' control bits - CHECK NXM,CONSOLE
				REQ,T ENB FOR COM/ADR & DATA
	Tick clock while watching for 'MEM BUSY' in 8080 I/O Reg 102
	Turn clocks back on then check to see if a ?MRE results
RESPONSE
	?MRE occurred - MMC hung?
	Clock ticks given:  to see 'MEM BUSY' - \D0   Reg 102: \O2
			  to clear 'MEM BUSY' - \D1   Reg 102: \O3
	8080 Regs 101: \O4    301: \O5
!
[3
!STIMULUS
	MR,SYNC CLOCKS	    T & R Clocks synced in maintenance mode
	LR (REG),DR (DATA)  Write Com/Adr cycle & data cycle data to 8080
				Regs 102...115 - Read mem loc 0
	LR 210,DR 360	    Write 'MEM READ' control bits - CHECK NXM,CONSOLE
				REQ,T ENB FOR COM/ADR & DATA
	Tick clock while watching for 'MEM BUSY' in 8080 I/O Reg 102
	Turn clocks back on then check to see if a ?MRE results
RESPONSE
	?NXM occurred
	Clock ticks given:  to see 'MEM BUSY' - \D0   Reg 102: \O2
			  to clear 'MEM BUSY' - \D1   Reg 102: \O3
	8080 Regs 101: \O4    301: \O5
!
[4
!STIMULUS
	MR,SYNC CLOCKS	    T & R Clocks synced in maintenance mode
	LR (REG),DR (DATA)  Write Com/Adr cycle & data cycle data to 8080
				Regs 102...115 - Read mem loc 0
	LR 210,DR 360	    Write 'MEM READ' control bits - CHECK NXM,CONSOLE
				REQ,T ENB FOR COM/ADR & DATA
	Tick clock while watching for 'MEM BUSY' in 8080 I/O Reg 102
	Turn clocks back on then check to see if a ?MRE results
RESPONSE
	'MEM BUSY' never appeared in Reg 102
	Clock ticks given:  to see 'MEM BUSY' - \D0   Reg 102: \O2
			  to clear 'MEM BUSY' - \D1   Reg 102: \O3
	8080 Regs 101: \O4    301: \O5
!
[5
!STIMULUS
	MR,SYNC CLOCKS	    T & R Clocks synced in maintenance mode
	LR (REG),DR (DATA)  Write Com/Adr cycle & data cycle data to 8080
				Regs 102...115 - Read mem loc 0
	LR 210,DR 360	    Write 'MEM READ' control bits - CHECK NXM,CONSOLE
				REQ,T ENB FOR COM/ADR & DATA
	Tick clock while watching for 'MEM BUSY' in 8080 I/O Reg 102
	Turn clocks back on then check to see if a ?MRE results
RESPONSE
	'MEM BUSY' never cleared from Reg 102
	Clock ticks given:  to see 'MEM BUSY' - \D0   Reg 102: \O2
			  to clear 'MEM BUSY' - \D1   Reg 102: \O3
	8080 Regs 101: \O4    301: \O5
!
[6
!STIMULUS
	MR,SYNC CLOCKS	    T & R Clocks synced in maintenance mode
	LR (REG),DR (DATA)  Write Com/Adr cycle & data cycle data to 8080
				Regs 102...115 - Read mem loc 0
	LR 210,DR 360	    Write 'MEM READ' control bits - CHECK NXM,CONSOLE
				REQ,T ENB FOR COM/ADR & DATA
	Tick clock while watching for 'MEM BUSY' in 8080 I/O Reg 102
	  then watch for it to disappear
RESPONSE
	KS10 timed out - MMC failed to respond for 60 seconds
	Clock ticks given:  to see 'MEM BUSY' - \D0   Reg 102: \O2
			  to clear 'MEM BUSY' - \D1   Reg 102: \O3
!
[7
!STIMULUS
	MR,SYNC CLOCKS	    T & R Clocks synced in maintenance mode
	LR (REG),DR (DATA)  Write Com/Adr cycle & data cycle data to 8080
				Regs 102...115 - Write 0's to mem loc 0
	LR 210,DR 360	    Write 'MEM WRITE' control bits - CHECK NXM,CONSOLE
				REQ,T ENB FOR COM/ADR & DATA
	Tick clock until 'MEM BUSY' appears in 8080 I/O Reg 102
	Tick clock until 'MEM BUSY' clears from 8080 I/O Reg 102
	Turn clocks back on then check to see if a ?MRE results
RESPONSE
	?MRE occurred - MMC hung?
	Clock ticks given:  to see 'MEM BUSY' - \D0   Reg 102: \O2
			  to clear 'MEM BUSY' - \D1   Reg 102: \O3
	8080 Regs 101: \O4    301: \O5
!
[8
!STIMULUS
	MR,SYNC CLOCKS	    T & R Clocks synced in maintenance mode
	LR (REG),DR (DATA)  Write Com/Adr cycle & data cycle data to 8080
				Regs 102...115 - WRITE 0'S TO MEM LOC 0
	LR 210,DR 360	    Write 'MEM WRITE' control bits - CHECK NXM,CONSOLE
				REQ,T ENB FOR COM/ADR & DATA
	Tick clock until 'MEM BUSY' appears in 8080 I/O Reg 102
	Tick clock until 'MEM BUSY' clears from 8080 I/O Reg 102
	Turn clocks back on then check to see if a ?MRE results
RESPONSE
	?NXM occurred
	Clock ticks given:  to see 'MEM BUSY' - \D0   Reg 102: \O2
			  to clear 'MEM BUSY' - \D1   Reg 102: \O3
	8080 Regs 101: \O4    301: \O5
!
[9
!STIMULUS
	MR,SYNC CLOCKS	    T & R Clocks synced in maintenance mode
	LR (REG),DR (DATA)  Write Com/Adr cycle & data cycle data to 8080
				Regs 102...115 - WRITE 0'S TO MEM LOC 0
	LR 210,DR 360	    WRITE 'MEM WRITE' CONTROL BITS - CHECK NXM,CONSOLE
				REQ,T ENB FOR COM/ADR & DATA
	Tick clock until 'MEM BUSY' appears in 8080 I/O Reg 102
	Tick clock until 'MEM BUSY' clears from 8080 I/O Reg 102
	Turn clocks back on then check to see if a ?MRE results
RESPONSE
	'MEM BUSY' never appeared in Reg 102
	Clock ticks given:  to see 'MEM BUSY' - \D0   Reg 102: \O2
			  to clear 'MEM BUSY' - \D1   Reg 102: \O3
	8080 Regs 101: \O4    301: \O5
!
[10
!STIMULUS
	MR,SYNC CLOCKS	    T & R Clocks synced in maintenance mode
	LR (REG),DR (DATA)  Write Com/Adr cycle & data cycle data to 8080
				Regs 102...115 - Write 0's to mem loc 0
	LR 210,DR 360	    Write 'MEM WRITE' write control bits - CHECK NXM,
				CONSOLE REQ,T ENB FOR COM/ADR & DATA
	Tick clock until 'MEM BUSY' appears in 8080 I/O Reg 102
	Tick clock until 'MEM BUSY' clears from 8080 I/O Reg 102
	Turn clocks back on then check to see if a ?MRE results
RESPONSE
	'MEM BUSY' never cleared from Reg 102
	Clock ticks given:  to see 'MEM BUSY' - \D0   Reg 102: \O2
			  to clear 'MEM BUSY' - \D1   Reg 102: \O3
	8080 Regs 101: \O4    301: \O5
!
]5
[1
!STIMULUS
	LR (REG),DR (DATA)  Write Com/Adr data to 8080 Regs 103,105,
			     107,109,111,113 - Read mem loc 0
	LR 210,DR 361	Set up mem cycle - CHECK NXM,CONSOLE REQ,
			  T ENB FOR COM/ADR & DATA, CLOSE LATCHES
	NXM should not set - No refresh error should occur
RESPONSE
	KS10 timed out - MMC failed to respond for 60 seconds
!
[2
!STIMULUS
	LR (REG),DR (DATA)  Write Com/Adr data to 8080 Regs 103,105,
			     107,109,111,113 - Read mem loc 0
	LR 210,DR 361	Set up mem cycle - CHECK NXM,CONSOLE REQ,
			  T ENB FOR COM/ADR & DATA, CLOSE LATCHES
	NXM should not set - No refresh error should occur
RESPONSE
	No ref err occurred but NXM set
	8080 Regs 101: \O0	301: \O1
!
[3
!STIMULUS
	LR (REG),DR (DATA)  Write Com/Adr data to 8080 Regs 103,105,
			     107,109,111,113 - Read mem loc 0
	LR 210,DR 361	Set up mem cycle - CHECK NXM,CONSOLE REQ,
			  T ENB FOR COM/ADR & DATA, CLOSE LATCHES
	NXM should not set - No refresh error should occur
RESPONSE
	Refresh error occurred & NXM not set
	8080 Regs 101: \O0	301: \O1
!
[4
!STIMULUS
	LR (REG),DR (DATA)  Write Com/Adr data to 8080 Regs 103,105,
			     107,109,111,113 - Read mem loc 0
	LR 210,DR 361	Set up mem cycle - CHECK NXM,CONSOLE REQ,
			  T ENB FOR COM/ADR & DATA, CLOSE LATCHES
	NXM should not set - No refresh error should occur
RESPONSE
	NXM set and refresh error occurred
	8080 Regs 101: \O0	301: \O1
!
[5
!STIMULUS
	LR (REG),DR (DATA)  Write Com/Adr data to 8080 Regs 103,105,
			     107,109,111,113 - Read mem loc 0
	LR 210,DR 361	Set up mem cycle - CHECK NXM,CONSOLE REQ,
			  T ENB FOR COM/ADR & DATA, CLOSE LATCHES
	NXM should not set - No refresh error should occur
RESPONSE
	KS10 timed out - MMC failed to respond for 60 seconds
!
[6
!STIMULUS
	LR (REG),DR (DATA)  Write Com/Adr data to 8080 Regs 103,105,
			     107,109,111,113 - Write mem loc 0
	LR 210,DR 361	Set up mem cycle - CHECK NXM,CONSOLE REQ,
			  T ENB FOR COM/ADR & DATA, CLOSE LATCHES
	NXM should not set - No refresh error should occur
RESPONSE
	NO ref err occurred but NXM set
	8080 Regs 101: \O0	301: \O1
!
[7
!STIMULUS
	LR (REG),DR (DATA)  Write Com/Adr data to 8080 Regs 103,105,
			     107,109,111,113 - Write mem loc 0
	LR 210,DR 361	Set up mem cycle - CHECK NXM,CONSOLE REQ,
			  T ENB FOR COM/ADR & DATA, CLOSE LATCHES
	NXM should not set - No refresh error should occur
RESPONSE
	Refresh error occurred & NXM not set
	8080 Regs 101: \O0	301: \O1
!
[8
!STIMULUS
	LR (REG),DR (DATA)  Write Com/Adr data to 8080 Regs 103,105,
			     107,109,111,113 - Write mem loc 0
	LR 210,DR 361	Set up mem cycle - CHECK NXM,CONSOLE REQ,
			  T ENB FOR COM/ADR & DATA, CLOSE LATCHES
	NXM should not set - No refresh error should occur
RESPONSE
	NXM set and refresh error occurred
	8080 Regs 101: \O0	301: \O1
!
[9
!STIMULUS
	LR (REG),DR (DATA)  Write Com/Adr data to 8080 Regs 103,105,
			     107,109,111,113 - Read mem loc 0
	LR 210,DR 361	Set up mem cycle - CHECK NXM,CONSOLE REQ,
			  T ENB FOR COM/ADR & DATA, CLOSE LATCHES
	NXM should not set - No refresh error should occur
RESPONSE
	KS10 timed out - MMC failed to respond for 60 seconds
!
[10
!STIMULUS
	LR (REG),DR (DATA)  Write Com/Adr data to 8080 Regs 103,105,
			     107,109,111,113 - Read & write mem loc 0
	LR 210,DR 360	Set up mem cycle - CHECK NXM,CONSOLE REQ,
			  T ENB FOR COM/ADR & DATA
	NXM should not set - Refresh error should occur
RESPONSE
	Refresh error occurred but NXM was set
	8080 Regs 101: \O0	301: \O1
!
[11
!STIMULUS
	LR (REG),DR (DATA)  Write Com/Adr data to 8080 Regs 103,105,
			     107,109,111,113 - Read & write mem loc 0
	LR 210,DR 360	Set up mem cycle - CHECK NXM,CONSOLE REQ,
			  T ENB FOR COM/ADR & DATA
	NXM should not set - Refresh error should occur
RESPONSE
	NXM did not set but refresh error did not occur
	8080 Regs 101: \O0	301: \O1
!
[12
!STIMULUS
	LR (REG),DR (DATA)  Write Com/Adr data to 8080 Regs 103,105,
			     107,109,111,113 - Read & write mem loc 0
	LR 210,DR 360	Set up mem cycle - CHECK NXM,CONSOLE REQ,
			  T ENB FOR COM/ADR & DATA
	NXM should not set - Refresh error should occur
RESPONSE
	Refresh error did not occur & NXM set
	8080 Regs 101: \O0	301: \O1
!
[13
!STIMULUS
	LR (REG),DR (DATA)  Write Com/Adr data to 8080 Regs 103,105,
			     107,109,111,113 - Read mem loc 0
	LR 210,DR 361	Set up mem cycle - CHECK NXM,CONSOLE REQ,
			  T ENB FOR COM/ADR & DATA, CLOSE LATCHES
	NXM should not set - No refresh error should occur
RESPONSE
	KS10 timed out - MMC failed to respond for 60 seconds
!
[14
!STIMULUS
	LR (REG),DR (DATA)  Write Com/Adr data to 8080 Regs 103,105,107,
		   109,111,113 - Neither read nor write mem loc 0
	LR 210,DR 360	Set up mem cycle - CHECK NXM,CONSOLE REQ,
			  T ENB FOR COM/ADR & DATA
	NXM should not set - Refresh error should occur
RESPONSE
	Refresh error occurred but NXM was set
	8080 Regs 101: \O0	301: \O1
!
[15
!STIMULUS
	LR (REG),DR (DATA)  Write Com/Adr data to 8080 Regs 103,105,107,
		   109,111,113 - Neither read nor write mem loc 0
	LR 210,DR 360	Set up mem cycle - CHECK NXM,CONSOLE REQ,
			  T ENB FOR COM/ADR & DATA
	NXM should not set - Refresh error should occur
RESPONSE
	NXM not set but refresh error did not occur
	8080 Regs 101: \O0	301: \O1
!
[16
!STIMULUS
	LR (REG),DR (DATA)  Write Com/Adr data to 8080 Regs 103,105,107,
		   109,111,113 - Neither read nor write mem loc 0
	LR 210,DR 360	Set up mem cycle - CHECK NXM,CONSOLE REQ,
			  T ENB FOR COM/ADR & DATA
	NXM should not set - Refresh error should occur
RESPONSE
	Refresh error did not occur & NXM set
	8080 Regs 101: \O0	301: \O1
!
]6
[1
!STIMULUS:
	LA 0	Write to mem loc 0
	DM \U0
	EM 0	Examine mem loc 0
RESPONSE:
	Bit \D1 of data returned is incorrect
!
[2
!STIMULUS:
	LA 0	Write to mem loc 0
	DM \U0
	EM 0	Examine mem loc 0
RESPONSE:
	Bits \S1 of data returned is incorrect
!
[3
!STIMULUS:
	LA 0	Write to mem loc 0
	DM \U0
	EM 0	Examine mem loc 0
RESPONSE:
	Bits 00-35 of data returned is incorrect
!
[4
!STIMULUS:
	LA 0	Write to mem loc 0
	DM \U0
RESPONSE:
	NXM SET
!
[5
!STIMULUS:
	LA 0	Write to mem loc 0
	DM \U0
	EM 0	Examine mem loc 0
RESPONSE:
	NXM set
!
[6
!STIMULUS:
	LA 0	Write to mem loc 0
	DM \U0
	EM 0	Examine mem loc 0
	Examine Mem Status Register
RESPONSE:
	Data returned ok but refresh error set
	Mem Stat Reg:  \U1
!
[7
!STIMULUS:
	LA 0	Write to mem loc 0
	DM \U0
	EM 0	Examine mem loc 0
	Examine Mem Status Register
RESPONSE:
	Data returned ok but memory parity error set
	Mem Stat Reg:  \U1
!
[8
!STIMULUS:
	LA 0	Write to mem loc 0
	DM \U0
	EM 0	Examine mem loc 0
	Examine Mem Status Register
RESPONSE:
	Data returned ok but ECC shut off
	Mem Stat Reg:  \U1
!
[9
!STIMULUS:
	LA 0	Write to mem loc 0
	DM \U0
	EM 0	Examine mem loc 0
	Examine Mem Status Register
RESPONSE:
	Data returned ok but power fail set
	Mem Stat Reg:  \U1
!
[10
!STIMULUS:
	LA 0	Write to mem loc 0
	DM \U0
	EM 0	Examine mem loc 0
RESPONSE:
	'MMC2 ECC CODE XX' stuck hi/lo - data bit is complemented
!
]7
[1
!STIMULUS
	MR	Master Reset
	EM 0	Examine mem loc 0 (Turns off ?NXM if it was on)
	MR	Master Reset
	ER 102	Examine 8080 Reg 102 - Should be all 0's -
		  ('MEM BUSY', 'I/O BUSY','BAD DATA', 'COM ADR',
		  'I/O DATA','DATA' - None should be asserted)
RESPONSE
	'MEM BUSY' asserted       102:  \O0
!
[2
!STIMULUS
	MR	Master Reset
	EM 0	Examine mem loc 0 (Turns off ?NXM if it was on)
	MR	Master Reset
	ER 102	Examine 8080 Reg 102 - Should be all 0's -
		  ('MEM BUSY', 'I/O BUSY','BAD DATA', 'COM ADR',
		  'I/O DATA','DATA' - None should be asserted)
RESPONSE
	'I/O BUSY' asserted       102:  \O0
!
[3
!STIMULUS
	MR	Master Reset
	EM 0	Examine mem loc 0 (Turns off ?NXM if it was on)
	MR	Master Reset
	ER 102	Examine 8080 Reg 102 - Should be all 0's -
		  ('MEM BUSY', 'I/O BUSY','BAD DATA', 'COM ADR',
		  'I/O DATA','DATA' - None should be asserted)
RESPONSE
	'BAD DATA' asserted       102:  \O0
!
[4
!STIMULUS
	MR	Master Reset
	EM 0	Examine mem loc 0 (Turns off ?NXM if it was on)
	MR	Master Reset
	ER 102	Examine 8080 Reg 102 - Should be all 0's -
		  ('MEM BUSY', 'I/O BUSY','BAD DATA', 'COM ADR',
		  'I/O DATA','DATA' - None should be asserted)
RESPONSE
	'COM ADR' asserted       102:  \O0
!
[5
!STIMULUS
	MR	Master Reset
	EM 0	Examine mem loc 0 (Turns off ?NXM if it was on)
	MR	Master Reset
	ER 102	Examine 8080 Reg 102 - Should be all 0's -
		  ('MEM BUSY', 'I/O BUSY','BAD DATA', 'COM ADR',
		  'I/O DATA','DATA' - None should be asserted)
RESPONSE
	'I/O DATA' asserted       102:  \O0
!
[6
!STIMULUS
	MR	Master Reset
	EM 0	Examine mem loc 0 (Turns off ?NXM if it was on)
	MR	Master Reset
	ER 102	Examine 8080 Reg 102 - Should be all 0's -
		  ('MEM BUSY', 'I/O BUSY','BAD DATA', 'COM ADR',
		  'I/O DATA','DATA' - None should be asserted)
RESPONSE
	'DATA' asserted       102:  \O0
!
[7
!STIMULUS
	MR	Master Reset
	EM 0	Examine mem loc 0 (Turns off ?NXM if it was on)
	MR	Master Reset
	ER 100	Examine 8080 Reg 100 - Should show 'MEM PE' not asserted
RESPONSE
	'MEM PE' asserted       100:  \O0
!
[8
!STIMULUS
	MR	Master Reset
	EM 0	Examine mem loc 0 (Turns off ?NXM if it was on)
	MR	Master Reset
	ER 301	Examine 8080 Reg 301 - Should show 'NXM' not asserted
RESPONSE
	'NXM' asserted       301:  \O0
!
]8
[1
!STIMULUS
	MR,PE 0		Shut off parity error checking by 8080
	LA 0,DM 0	Write 0's to memory loc 0 (Parity err should not occur)
	ER 100		Check to see if 8080 can see 'PE' (Bit 4 of Reg 100)
	EI 100000	Look to see if MSR shows 'PE' also
RESPONSE
	8080 & M8618 both see 'PARITY ERR' occurred on write
	I/O Reg 100: \O0    MSR: \U1
!
[2
!STIMULUS
	MR,PE 0		Shut off parity error checking by 8080
	LA 0,DM 0	Write 0's to memory loc 0 (Parity err should not occur)
	ER 100		Check to see if 8080 can see 'PE' (Bit 4 of Reg 100)
	EI 100000	Look to see if MSR shows 'PE' also
RESPONSE
	8080 thinks 'PARITY ERR' occurred on write but M8618 doesnt
	I/O Reg 100: \O0    MSR: \U1
!
[3
!STIMULUS
	MR,PE 0		Shut off parity error checking by 8080
	LA 0,DM 0	Write 0's to memory loc 0 (Parity err should not occur)
	ER 100		Check to see if 8080 can see 'PE' (Bit 4 of Reg 100)
	EI 100000	Look to see if MSR shows 'PE' also
RESPONSE
	M8618 thinks 'PARITY ERR' occurred on write but 8080 doesnt
	I/O Reg 100: \O0    MSR: \U1
!
[4
!STIMULUS
	MR,PE 0		Shut off parity error checking by 8080
	LA 0,DM 0	Write 0's to memory loc 0
	EM 0		Examine mem loc 0 (Parity err should not occur)
	ER 100		Check to see if 8080 can see 'PE' (Bit 4 of Reg 100)
	EI 100000	Look to see if MSR shows 'PE' also
RESPONSE
	8080 & M8618 both see 'PARITY ERR' occurred on read
	I/O Reg 100: \O0    MSR: \U1   Mem loc 0: \U2
!
[5
!STIMULUS
	MR,PE 0		Shut off parity error checking by 8080
	LA 0,DM 0	Write 0's to memory loc 0
	EM 0		Examine mem loc 0 (Parity err should not occur)
	ER 100		Check to see if 8080 can see 'PE' (Bit 4 of Reg 100)
	EI 100000	Look to see if MSR shows 'PE' also
RESPONSE
	8080 thinks 'PARITY ERR' occurred on read but M8618 doesnt
	I/O Reg 100: \O0    MSR: \U1   Mem loc 0: \U2
!
[6
!STIMULUS
	MR,PE 0		Shut off parity error checking by 8080
	LA 0,DM 0	Write 0's to memory loc 0
	EM 0		Examine mem loc 0 (Parity err should not occur)
	ER 100		Check to see if 8080 can see 'PE' (Bit 4 of Reg 100)
	EI 100000	Look to see if MSR shows 'PE' also
RESPONSE
	M8618 thinks 'PARITY ERR' occurred on read but 8080 doesnt
	I/O Reg 100: \O0    MSR: \U1   Mem loc 0: \U2
!
]9
[1
!STIMULUS:
	LA (\S1 Board select + 0 Address) (\S2existent memory)
	DM \U0
RESPONSE:
	NXM\S2set
!
[2
!STIMULUS:
	LA (\S1 Board select + 0 Address) (Nonexistent memory)
	DM \U0
	EM
RESPONSE:
	NXM not set & data ok
!
[3
!STIMULUS:
	LA (\S1 Board select + 0 Address) (Nonexistent memory)
	DM \U0
	EM
RESPONSE:
	NXM not set & data not ok
!
[4
!STIMULUS:
	LA (\S1 Board select + 0 Address) (Memory exists)
	DM \U0
	EM
RESPONSE:
	NXM not set & data not ok
!
[5
!STIMULUS:
	LA (\S1 Board select + 0 Address) (Memory exists)
	DM \U0
	EM
RESPONSE:
	NXM set
!
]10
[1
!STIMULUS:
	LA (00 Word group + 0 Address)
	DM 111111111111
	LA (\S0 Word group + 0 Address)
	DM 222222222222
	EM 00 (Bits 20,21) 00000 (Bits 22..35)
RESPONSE:
	DM 22.. Overwrote 11.. (Addr bit 20/21 stuck at 0/1)
!
]11
[1
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 0000001 0000001
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 28 COL 35' stuck at 0/1
!
[2
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 0000010 0000010
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 27 COL 34' Stuck at 0/1
!
[3
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 0000100 0000100
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 26 COL 33' Stuck at 0/1
!
[4
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 0001000 0001000
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 25 COL 32' Stuck at 0/1
!
[5
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 0010000 0010000
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 24 COL 31' Stuck at 0/1
!
[6
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 0100000 0100000
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 23 COL 30' Stuck at 0/1
!
[7
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 1000000 1000000
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 22 COL 29' Stuck at 0/1
!
]12
[1
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 0000000 0000001
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 28 COL 35' Stuck at 0/1
!
[2
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 0000000 0000010
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 27 COL 34' Stuck at 0/1
!
[3
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 0000000 0000100
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 26 COL 33' Stuck at 0/1
!
[4
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 0000000 0001000
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 25 COL 32' Stuck at 0/1
!
[5
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 0000000 0010000
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 24 COL 31' Stuck at 0/1
!
[6
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 0000000 0100000
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 23 COL 30' Stuck at 0/1
!
[7
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 0000000 1000000
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 22 COL 29' Stuck at 0/1
!
[8
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 0000001 0000000
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 28 COL 35' Stuck at 0/1
!
[9
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 0000010 0000000
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 27 COL 34' Stuck at 0/1
!
[10
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 0000100 0000000
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 26 COL 33' Stuck at 0/1
!
[11
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 0001000 0000000
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 25 COL 32' Stuck at 0/1
!
[12
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 0010000 0000000
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 24 COL 31' Stuck at 0/1
!
[13
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 0100000 0000000
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 23 COL 30' Stuck at 0/1
!
[14
!STIMULUS:
	LA (Row col bits) 0000000 0000000
	DM 000000000000
	LA (Row col bits) 1000000 0000000
	DM 777777777777
	EM 0
RESPONSE:
	DM 777.. Overwrote DM 000..
	'MMC3 ROW 22 COL 29' Stuck at 0/1
!
]13
[1
!STIMULUS:
	Write 0000.. to address  0,N
	Write 7777.. to address  N,0
	Write 2525.. to address  0,0
	Write 5252.. to address  N,N
	  For N = 1000000 (binary)
RESPONSE:
	'MMCA COL ADD EN H' stuck low - data in 0,N is overwritten
		by 0,0 for address bit 22/29
!
[2
!STIMULUS:
	Write 0000.. to address  0,N
	Write 7777.. to address  N,0
	Write 2525.. to address  0,0
	Write 5252.. to address  N,N
	  For N = 0100000 and 0010000 (Binary)
RESPONSE:
	'MMCA COL ADD EN H' stuck low - data in 0,N is overwritten
		by 0,0 for address bits 23,24/30,31
!
[3
!STIMULUS:
	Write 0000.. to address  0,N
	Write 7777.. to address  N,0
	Write 2525.. to address  0,0
	Write 5252.. to address  N,N
	  For N = 0001000 and 0000100 (Binary)
RESPONSE:
	'MMCA COL ADD EN H' stuck low - data in 0,N is overwritten
		by 0,0 for address bits 25,26/32,33
!
[4
!STIMULUS:
	Write 0000.. to address  0,N
	Write 7777.. to address  N,0
	Write 2525.. to address  0,0
	Write 5252.. to address  N,N
	  For N = 0000010 and 0000001 (Binary)
RESPONSE:
	'MMCA COL ADD EN H' stuck low - data in 0,N is overwritten
		by 0,0 for address bits 27,28/34,35
!
[5
!STIMULUS:
	Write 0000.. to address  0,N
	Write 7777.. to address  N,0
	Write 2525.. to address  0,0
	Write 5252.. to address  N,N
	  For N = 1000000 (Binary)
RESPONSE:
	'MMCA COL ADD EN H' stuck high - data in 0,N is overwritten
		by N,N for address bits 22/29
!
[6
!STIMULUS:
	Write 0000.. to address  0,N
	Write 7777.. to address  N,0
	Write 2525.. to address  0,0
	Write 5252.. to address  N,N
	  For N = 0100000 and 0010000 (Binary)
RESPONSE:
	'MMCA COL ADD EN H' stuck high - data in 0,N is overwritten
		by N,N for address bits 23,24/30,31
!
[7
!STIMULUS:
	Write 0000.. to address  0,N
	Write 7777.. to address  N,0
	Write 2525.. to address  0,0
	Write 5252.. to address  N,N
	  For N = 0001000 and 0000100 (Binary)
RESPONSE:
	'MMCA COL ADD EN H' stuck high - data in 0,N is overwritten
		by N,N for address bits 25,26/32,33
!
[8
!STIMULUS:
	Write 0000.. to address  0,N
	Write 7777.. to address  N,0
	Write 2525.. to address  0,0
	Write 5252.. to address  N,N
	  For N = 0000010 and 0000001 (Binary)
RESPONSE:
	'MMCA COL ADD EN H' stuck high - data in 0,N is overwritten
		by N,N for address bits 27,28/34,35
!
[9
!STIMULUS:
	Write 0000.. to address  0,N
	Write 7777.. to address  N,0
	Write 2525.. to address  0,0
	Write 5252.. to address  N,N
	  For N = 0000001, 0000010 ... 1000000
RESPONSE:
	'MMCA COL ADD EN H' stuck low - data in 0,N is overwritten
		by 0,0 for address bits 22-28/29-35
!
[10
!STIMULUS:
	Write 0000.. to address  0,N
	Write 7777.. to address  N,0
	Write 2525.. to address  0,0
	Write 5252.. to address  N,N
	  For N = 0000001, 0000010 ... 1000000
RESPONSE:
	'MMCA COL ADD EN H' stuck high - data in 0,N is overwritten
		by N,N for address bits 22-28/29-35
!
[11
!STIMULUS:
	Write 0000.. to address  0,N
	Write 7777.. to address  N,0
	Write 2525.. to address  0,0
	Write 5252.. to address  N,N
	  For N = 0000001, 0000010 ... 1000000
RESPONSE:
	'MMCA COL ADD EN H' stuck low - data in 0,N is overwritten
	  by 0,0 (for multiple chips)
!
[12
!STIMULUS:
	Write 0000.. to address  0,N
	Write 7777.. to address  N,0
	Write 2525.. to address  0,0
	Write 5252.. to address  N,N
	  For N = 0000001, 0000010 ... 1000000
RESPONSE:
	'MMCA COL ADD EN H' stuck high - data in 0,N is overwritten
	  by N,N (for multiple chips)
!
[13
!STIMULUS:
	Write 0000.. to address  0,N
	Write 7777.. to address  N,0
	Write 2525.. to address  0,0
	Write 5252.. to address  N,N
	  For N = 0000001, 0000010 ... 1000000
RESPONSE:
	'MMCA COL ADD EN H' stuck low and high - Data in 0,N is overwritten
	  by 0,0/N,N (For multiple chips)
!
[14
!STIMULUS:
	Write 0000.. to address  0,N
	Write 7777.. to address  N,0
	Write 2525.. to address  0,0
	Write 5252.. to address  N,N
	  FOR N = 0000001, 0000010 ... 1000000
RESPONSE:
	Data in various locations is overwritten by later writes
	  (This test cannot single out any particular error here)
!
[15
!STIMULUS:
	Write 0000.. to address  0,N
	Write 7777.. to address  N,0
	Write 2525.. to address  0,0
	Write 5252.. to address  N,N
	  FOR N = 0000001, 0000010 ... 1000000
RESPONSE:
	Data in various locations is overwritten or disappears
	  (Possibly -  'MMCB REF ADD EN H' stuck high so writes
	  alway go to the address being refreshed at the time)
!
]14
[1
!STIMULUS
	LI 100000	Write Mem Status Reg:  Clear ERR HOLD bit,
	DI 700000000376	  Set force bits 1'S (Single bit err), ECC on
	LA 17043,DM0	Write 0's into mem loc 17043
	EM 17043	Examine mem loc 17043 (Causes ECC error)
	EI (IO REG)	Examine IO Reg \O0
	Should return ?NDA (Or data other than mem addr 17043 if this
	   matched a different I/O Register)
RESPONSE
	Mem Stat Reg was read (Data is: \U1 )
!
[2
!STIMULUS
	LI 100000	Write Mem Status Reg:  Clear ERR HOLD bit,
	DI 700000000376	  Set force bits 1'S (Single bit err), ECC on
	LA 17043,DM0	Write 0's into mem loc 17043
	EM 17043	Examine mem loc 17043 (Causes ECC error)
	EI (IO REG)	Examine IO Reg \O0
	Should Read Mem Stat Reg - Returned address should be 17043
RESPONSE
	Mem Stat Reg was not read (?NDA returned instead)
!
]15
[1
!STIMULUS
	MR,SYNC CLKS
	LI (IO REG)	Write status to IO Reg \O0
	DI 0		   (Data is 0's)
	Tick clock 20 ticks (5 T Clocks) - 'I/O BUSY' should not
	   appear in 8080 Reg 102
RESPONSE
	'I/O BUSY' appeared in 8080 Reg 102
	8080 Reg 102: \U1
!
[2
!STIMULUS
	MR,SYNC CLKS
	LI (IO REG)	Write status to IO Reg \O0
	DI 0		   (Data is 0's)
	Tick clock 20 ticks (5 T Clocks) - 'I/O BUSY' should have
	   appeared in 8080 Reg 102
RESPONSE
	'I/O BUSY' did not appear in 8080 Reg 102
	8080 Reg 102: \U1
!
]16
[1
!STIMULUS
	MR		Ensure ECC on and PE not set
	LI (IO Reg)	Write status to IO Reg \O0
	DI 040000000001 Shut off ECC / Set PE - (Should return ?NDA)
	EI 100000	Examine Mem Stat Reg (Should show ECC on / PE on)
RESPONSE
	ECC shut off / PE set and no ?NDA occurred on DI \O0
	Mem Stat Reg: \U1
!
[2
!STIMULUS
	MR		Ensure ECC on and PE not set
	LI (IO Reg)	Write status to IO Reg \O0
	DI 040000000001 Shut off ECC / Set PE - (Should return ?NDA)
	EI 100000	Examine Mem Stat Reg (Should show ECC on / PE on)
RESPONSE
	ECC shut off / PE set (Also, ?NDA occurred on DI \O0)
	Mem Stat Reg: \U1
!
[3
!STIMULUS
	MR		Ensure ECC on and PE not set
	LI 100000	Write status to IO Reg 100000
	DI 040000000001 Shut off ECC / Set PE
	EI 100000	Examine Mem Stat Reg (Should show ECC now off)
RESPONSE
	ECC still on / PE not set and no ?NDA occurred on EI 100000)
	Mem Stat Reg: \U1
!
[4
!STIMULUS
	MR		Ensure ECC on and PE not set
	LI 100000	Write status to IO Reg 100000
	DI 040000000001 Shut off ECC / Set PE
	EI 100000	Examine Mem Stat Reg (Should show ECC now off)
RESPONSE
	ECC shut off / PE set but ?NDA occurred on EI 100000)
	Mem Stat Reg: \U1
!
[5
!STIMULUS
	MR		Ensure ECC on and PE not set
	LI 100000	Write status to IO Reg 100000
	DI 040000000001 Shut off ECC / Set PE
	EI 100000	Examine Mem Stat Reg (Should show ECC now off)
RESPONSE
	ECC still on / PE not set and ?NDA occurred on EI 100000)
	Mem Stat Reg: \U1
!
]17
[1
!STIMULUS:
	MR,PE 3		Shut off 8080 parity checking
	LI 100000,DI 0	Write 0's to Mem Stat Reg
	EI 100000	Read Mem Status Reg
	'ERR HOLD' should be 0 - ('MR' would turn it off if on)
RESPONSE:
	'MMC5 ERR HOLD' bit 00 asserted
!
[2
!STIMULUS:
	MR,PE 3		Shut off 8080 parity checking
	LI 100000,DI 0	Write 0's to Mem Stat Reg
	EI 100000	Read Mem Status Reg
	'UNCOR ERR HOLD' should be 0
RESPONSE:
	'MMC4 UNCOR ERR HOLD' bit 01 asserted
!
[3
!STIMULUS:
	MR,PE 3		Shut off 8080 parity checking
	LI 100000,DI 0	Write 0's to Mem Stat Reg
	EI 100000	Read Mem Status Reg
	'REFRESH ERR' should be 0 - ('MR' would turn it off if on)
RESPONSE:
	'MMC9 REF ERR' bit 02 asserted
!
[4
!STIMULUS:
	MR,PE 3		Shut off 8080 parity checking
	LI 100000,DI 0	Write 0's to Mem Stat Reg
	EI 100000	Read Mem Status Reg
	'PARITY ERR' should be 0 - ('DI 0' would turn it off if on)
RESPONSE:
	'MMC7 PARITY ERR' bit 03 asserted
!
[5
!STIMULUS:
	MR,PE 3		Shut off 8080 parity checking
	LI 100000,DI 0	Write 0's to Mem Stat Reg
	EI 100000	Read Mem Status Reg
	'ECC ON' should be 1 - ('DI 0' turns it on)
RESPONSE:
	'MMC3 ECC ON' bit 04 not asserted
!
[6
!STIMULUS:
	MR,PE 3		Shut off 8080 parity checking
	LI 100000,DI 0	Write 0's to Mem Stat Reg
	EI 100000	Read Mem Status Reg
	'POWER FAILED' should be 0
RESPONSE:
	'MMC5 POWER FAILED' bit 12 asserted
!
[7
!STIMULUS:
	MR,PE 3		Shut off 8080 parity checking
	LI 100000,DI 0	Write 0's to Mem Stat Reg
	EI 100000	Read Mem Status Reg
	DI 540040000001	WRITE 1'S TO Mem Stat Reg (Clear 'ERR HOLD',
			  clear 'REF ERR', set 'PE', turn off ECC)
	EI 100000	Read Mem Status Reg
RESPONSE:
	'MMC5 ERR HOLD' bit 00 asserted
!
[8
!STIMULUS:
	MR,PE 3		Shut off 8080 parity checking
	LI 100000,DI 0	Write 0's to Mem Stat Reg
	EI 100000	Read Mem Status Reg
	DI 540040000001	WRITE 1'S TO Mem Stat Reg (Clear 'ERR HOLD',
			  clear 'REF ERR', set 'PE', turn off ECC)
	EI 100000	Read Mem Status Reg
RESPONSE:
	'MMC4 UNCOR ERR HOLD' bit 01 asserted
!
[9
!STIMULUS:
	MR,PE 3		Shut off 8080 parity checking
	LI 100000,DI 0	Write 0's to Mem Stat Reg
	EI 100000	Read Mem Status Reg
	DI 540040000001	WRITE 1'S TO Mem Stat Reg (Clear 'ERR HOLD',
			  clear 'REF ERR', set 'PE', turn off ECC)
	EI 100000	Read Mem Status Reg
RESPONSE:
	'MMC9 REF ERR' bit 02 asserted
!
[10
!STIMULUS:
	MR,PE 3		Shut off 8080 parity checking
	LI 100000,DI 0	Write 0's to Mem Stat Reg
	EI 100000	Read Mem Status Reg
	DI 540040000001	WRITE 1'S TO Mem Stat Reg (Clear 'ERR HOLD',
			  clear 'REF ERR', set 'PE', turn off ECC)
	EI 100000	Read Mem Status Reg
RESPONSE:
	'MMC7 PARITY ERR' bit 03 not asserted
!
[11
!STIMULUS:
	MR,PE 3		Shut off 8080 parity checking
	LI 100000,DI 0	Write 0's to Mem Stat Reg
	EI 100000	Read Mem Status Reg
	DI 540040000001	WRITE 1'S TO Mem Stat Reg (Clear 'ERR HOLD',
			  clear 'REF ERR', set 'PE', turn off ECC)
	EI 100000	Read Mem Status Reg
RESPONSE:
	'MMC3 ECC ON' bit 04 asserted
!
[12
!STIMULUS:
	MR,PE 3		Shut off 8080 parity checking
	LI 100000,DI 0	Write 0's to Mem Stat Reg
	EI 100000	Read Mem Status Reg
	DI 540040000001	WRITE 1'S TO Mem Stat Reg (Clear 'ERR HOLD',
			  clear 'REF ERR', set 'PE', turn off ECC)
	EI 100000	Read Mem Status Reg
RESPONSE:
	'MMC5 POWER FAILED' bit 12 asserted
!
]18
[1
!STIMULUS
	MR,PE 3		Shut off 8080 parity checking
	LI 100000	Set 'MMC7 PARITY ERR' by writing
	DI 40000000000	  to Mem Status Register
	ER 100		Look at 8080 Reg 100 to see if PE detected
RESPONSE
	8080 Reg 100 is: \O0 - No mem par err detected
!
[2
!STIMULUS
	MR,PE 3		Shut off 8080 parity checking
	LI 100000	Set 'MMC7 PARITY ERR' by writing
	DI 40000000000	  to Mem Status Register
	ER 100		Look at 8080 Reg 100 to see if PE detected
	DI 0		Write status to clear 'MMC7 PARITY ERR'
RESPONSE
	8080 Reg 100 is: \O0 - Mem par err did not go away
!
]19
[1
!STIMULUS
	LI 100000	Write Mem Status Reg:  Clear Err Hold bit,
	DI 400000000376	  Set force bits 1'S (Single bit err), ECC on
	LA (ADDR),DM0	Write 0's to mem loc \O0
	EM (ADDR)	Examine mem loc \O0 (Cause a single bit error)
	EI 100000	Examine Mem Status Reg - Should contain memory
			  address \O0 (Loaded when ECC error occurred)
RESPONSE
	'MMC5 ERR HOLD' not set by 'EM' so the address returned in
	   Mem Stat Reg is 100000 (MSR)
!
[2
!STIMULUS
	LI 100000	Write Mem Status Reg:  Clear Err Hold bit,
	DI 400000000376	  Set force bits 1'S (Single bit err), ECC on
	LA (ADDR),DM0	Write 0's to mem loc \O0
	EM (ADDR)	Examine mem loc \O0 (Cause a single bit error)
	EI 100000	Examine Mem Status Reg - Should contain memory
			  address \O0 (Loaded when ECC error occurred)
RESPONSE
	Bit \D1 of returned address incorrect
!
[3
!STIMULUS
	LI 100000	Write Mem Status Reg:  Clear Err Hold bit,
	DI 400000000376	  Set force bits 1'S (Single bit err), ECC on
	LA (ADDR),DM0	Write 0's to mem loc \O0
	EM (ADDR)	Examine mem loc \O0 (Cause a single bit error)
	EI 100000	Examine Mem Status Reg - Should contain memory
			  address \O0 (Loaded when ECC error occurred)
RESPONSE
	Bits 14..21 of returned address incorrect
!
[4
!STIMULUS
	LI 100000	Write Mem Status Reg:  Clear Err Hold bit,
	DI 400000000376	  Set force bits 1'S (Single bit err), ECC on
	LA (ADDR),DM0	Write 0's to mem loc \O0
	EM (ADDR)	Examine mem loc \O0 (Cause a single bit error)
	EI 100000	Examine Mem Status Reg - Should contain memory
			  address \O0 (Loaded when ECC error occurred)
RESPONSE
	Bits 22..29 of returned address incorrect
!
[5
!STIMULUS
	LI 100000	Write Mem Status Reg:  Clear Err Hold bit,
	DI 400000000376	  Set force bits 1'S (Single bit err), ECC on
	LA (ADDR),DM0	Write 0's to mem loc \O0
	EM (ADDR)	Examine mem loc \O0 (Cause a single bit error)
	EI 100000	Examine Mem Status Reg - Should contain memory
			  address \O0 (Loaded when ECC error occurred)
RESPONSE
	Bits 30..35 of returned address incorrect
!
[6
!STIMULUS
	LI 100000	Write Mem Status Reg:  Clear Err Hold bit,
	DI 400000000376	  Set force bits 1'S (Single bit err), ECC on
	LA (ADDR),DM0	Write 0's to mem loc \O0
	EM (ADDR)	Examine mem loc \O0 (Cause a single bit error)
	EI 100000	Examine Mem Status Reg - Should contain memory
			  address \O0 (Loaded when ECC error occurred)
RESPONSE
	Bits 14-35 of returned address incorrect (multiple bit errors
	  not matching any particular chip)
!
]20
[1
!STIMULUS
	LI 100000	Write Mem Stat Reg:  Set force bits 1111110,
	DI 700040000374	  Turn on ECC, clear Err Hold, Ref Eff
	LA 33,DM 33	Write 0's to mem loc 33
	EM 33		Read mem loc 33 (Cause double bit ECC error)
	EI 100000	Read MSR - 'MMC5 ERR HOLD' should be asserted
RESPONSE
	'MMC5 ERR HOLD' bit 00 not asserted
!
[2
!STIMULUS
	LI 100000	Write Mem Stat Reg:  Set force bits 1111110,
	DI 700040000374	  Turn on ECC, clear Err Hold, Ref Eff
	LA 33,DM 33	Write 0's to mem loc 33
	EM 33		Read mem loc 33 (Cause double bit ECC error)
	EI 100000	Read MSR - 'MMC4 UNCOR ERR HOLD' should be set
RESPONSE
	'MMC4 UNCOR ERR HOLD' bit 01 not asserted
!
[3
!STIMULUS
	LI 100000	Write Mem Stat Reg:  Set force bits 1111110,
	DI 700040000374	  Turn on ECC, clear Err Hold, Ref Eff
	LA 33,DM 33	Write 0's to mem loc 33
	EM 33		Read mem loc 33 (Cause double bit ECC error)
	EI 100000	Read MSR - 'MMC9 REF ERR' should not be asserted
RESPONSE
	'MMC9 REF ERR' bit 02 asserted
!
[4
!STIMULUS
	LI 100000	Write Mem Stat Reg:  Set force bits 1111110,
	DI 700040000374	  Turn on ECC, clear Err Hold, Ref Eff
	LA 33,DM 33	Write 0's to mem loc 33
	EM 33		Read mem loc 33 (Cause double bit ECC error)
	EI 100000	Read MSR - 'MMC7 PARITY ERR' should not be asserted
RESPONSE
	'MMC7 PARITY ERR' bit 03 asserted
!
[5
!STIMULUS
	LI 100000	Write Mem Stat Reg:  Set force bits 1111110,
	DI 700040000374	  Turn on ECC, clear Err Hold, Ref Eff
	LA 33,DM 33	Write 0's to mem loc 33
	EM 33		Read mem loc 33 (Cause double bit ECC error)
	EI 100000	Read MSR - 'MMC3 ECC ON' should be asserted
RESPONSE
	'MMC3 ECC ON' bit 04 not asserted
!
[6
!STIMULUS
	LI 100000	Write Mem Stat Reg:  Set force bits 1111110,
	DI 700040000374	  Turn on ECC, clear Err Hold, Ref Eff
	LA 33,DM 33	Write 0's to mem loc 33
	EM 33		Read mem loc 33 (Cause double bit ECC error)
	EI 100000	Read MSR - 'MMC4 ERR' check bits should be 1111110
RESPONSE
	'MMC4 ERR' check bit\S0 incorrect
!
[7
!STIMULUS
	LI 100000	Write Mem Stat Reg:  Set force bits 1111110,
	DI 700040000374	  Turn on ECC, clear Err Hold, Ref Eff
	LA 33,DM 33	Write 0's to mem loc 33
	EM 33		Read mem loc 33 (Cause double bit ECC error)
	EI 100000	Read MSR - 'MMC5 POWER FAILED' should not be asserted
RESPONSE
	'MMC5 POWER FAILED' bit 12 asserted
!
[8
!STIMULUS
	LI 100000	Write Mem Stat Reg:  Set force bits 1111110,
	DI 700040000374	  Turn on ECC, clear Err Hold, Ref Eff
	LA 33,DM 33	Write 0's to mem loc 33
	EM 33		Read mem loc 33 (Cause double bit ECC error)
	EI 100000	Read MSR - 'MMC8 ERR ADDR' should be 0
RESPONSE
	'MMC8 ERR ADDR' is 100000 (Mem Stat Reg)
!
[9
!STIMULUS
	LI 100000	Write Mem Stat Reg:  Set force bits 1111110,
	DI 700040000374	  Turn on ECC, clear Err Hold, Ref Eff
	LA 33,DM 33	Write 0's to mem loc 33
	EM 33		Read mem loc 33 (Cause double bit ECC error)
	EI 100000	Read MSR - 'MMC8 ERR ADDR' should be 0
RESPONSE
	'MMC8 ERR ADDR' bit \D0 incorrect
!
[10
!STIMULUS
	LI 100000	Write Mem Stat Reg:  Set force bits 1111110,
	DI 700040000374	  Turn on ECC, clear Err Hold, Ref Eff
	LA 33,DM 33	Write 0's to mem loc 33
	EM 33		Read mem loc 33 (Cause double bit ECC error)
	EI 100000	Read MSR - 'MMC8 ERR ADDR' should be 0
RESPONSE
	'MMC8 ERR ADDR' bits \S0 incorrect
!
]21
[1
!STIMULUS
	MR		Clear everything
	LI 100000	Write Mem Stat Reg: Clear Err Hold ...,
	DI (STATUS)	  Set force bits 1111111, turn on ECC
	LA (ADDR),DM -1 Write 1's to mem loc \U0
	EM (ADDR)	Examine mem loc (Should cause single bit error)
	EI 100000	Read Mem Stat Reg (Check bits should be all 1's)
RESPONSE
	Check bit\S1 incorrect (MSR data follows)
!
]22
[1
!STIMULUS
	MR,LI 100000	Write Mem Stat Reg:  Set Clear Err Hold ...
	DI 700000000034	  Set force bits '007'
	LA 125,DM 052	Write '052' to mem loc '125'
	EM 125		Examine memory loc '125' (Causes ECC error and loads
			  force bits into mem stat reg)
RESPONSE
	Force bits returned incorrect
	Memory Status Register correct/actual:
!
[2
!STIMULUS
	MR,LI 100000	Write Mem Stat Reg:  Set Clear Err Hold ...
	DI 700000000360	  Set force bits '170'
	LA 125,DM 052	Write '052' to mem loc '125'
	EM 125		Examine memory loc '125' (Causes ECC error and loads
			  force bits into mem stat reg)
RESPONSE
	Force bits returned incorrect
	Memory Status Register correct/actual:
!
[3
!STIMULUS
RESPONSE
!
]23
[1
!STIMULUS
	MR (Clear everything)
	Write 0's to mem loc '222'
	Write status to mem (Set force bits '177')
	Write 0's to mem loc '111'
	Examine mem loc '111' (Causes ECC error and adr latched in Err Adr Reg)
	Examine mem loc '222' - Should have no effect on error data
	Examine Mem Status Register
RESPONSE
	EM 222 wiped out Err Adr 111 but EI 100000 did not wipe out 222
Mem Status Register C/A:
!
[2
!STIMULUS
	MR (Clear everything)
	Write 0's to mem loc '222'
	Write status to mem (Set force bits '177')
	Write 0's to mem loc '111'
	Examine mem loc '111' (Causes ECC error and adr latched in Err Adr Reg)
	Examine mem loc '222' - Should have no effect on error data
	Examine Mem Status Register
RESPONSE
	EI 100000 wiped out Err Adr 111
Mem Status Register C/A:
!
[3
!STIMULUS
	MR (Clear everything)
	Write 0's to mem loc '222'
	Write status to mem (Set force bits '177')
	Write 0's to mem loc '111'
	Examine mem loc '111' (Causes ECC error and adr latched in Err Adr Reg)
	Examine mem loc '222' - Should have no effect on error data
	Examine Mem Status Register
RESPONSE
	Err Adr 111 destroyed somehow
Mem Status Register C/A:
!
]24
[1
!STIMULUS
	MR,LI 100000	Write Mem Stat Reg:  Set PE, turn off ECC,
	DI 700000000176	  Set force bits to 077, clear Err Hold
	LA 17043,DM 0	Write 0's to mem loc 17043 then examine
	EM 0		  it - Causes single bit ECC error
	CAUSE ?MRE	Hang MMC by issuing only half a memory write
	ER 101		8080 Reg 101 should show 'REF ERR'
RESPONSE
	Mem ref err not set (8080 IO Reg 101: \U0 )
!
[2
!STIMULUS
	MR,LI 100000	Write Mem Stat Reg:  Set PE, turn off ECC,
	DI 700000000176	  Set force bits to 077, clear Err Hold
	LA 17043,DM 0	Write 0's to mem loc 17043 then examine
	EM 0		  it - Causes single bit ECC error
	CAUSE ?MRE	Hang MMC by issuing only half a memory write
	ER 101		Check 8080 Reg 101 for 'REF ERR'
	MR		Should reset 'MMC5 ERR HOLD'
	EI 100000	MSR should show 'MMC5 ERR HOLD' not asserted
RESPONSE
	'MMC5 ERR HOLD' bit 00 set (Mem Stat Reg: \U0 )
!
[3
!STIMULUS
	MR,LI 100000	Write Mem Stat Reg:  Set PE, turn off ECC,
	DI 700000000176	  Set force bits to 077, clear Err Hold
	LA 17043,DM 0	Write 0's to mem loc 17043 then examine
	EM 0		  it - Causes single bit ECC error
	CAUSE ?MRE	Hang MMC by issuing only half a memory write
	ER 101		Check 8080 Reg 101 for 'REF ERR'
	MR		Should not reset 'MMC4 UNCOR ERR HOLD'
	EI 100000	MSR should show 'MMC4 UNCOR ERR HOLD' still set
RESPONSE
	'MMC4 UNCOR ERR HOLD' bit 01 not set (Mem Stat Reg: \U0 )
!
[4
!STIMULUS
	MR,LI 100000	Write Mem Stat Reg:  Set PE, turn off ECC,
	DI 700000000176	  Set force bits to 077, clear Err Hold
	LA 17043,DM 0	Write 0's to mem loc 17043 then examine
	EM 0		  it - Causes single bit ECC error
	CAUSE ?MRE	Hang MMC by issuing only half a memory write
	ER 101		Check 8080 Reg 101 for 'REF ERR'
	MR		Should reset 'MMC9 REF ERR'
	EI 100000	MSR should show 'MMC9 REF ERR' not asserted
RESPONSE
	'MMC9 REF ERR' bit 02 set (Mem Stat Reg: \U0 )
!
[5
!STIMULUS
	MR,LI 100000	Write Mem Stat Reg:  Set PE, turn off ECC,
	DI 700000000176	  Set force bits to 077, clear Err Hold
	LA 17043,DM 0	Write 0's to mem loc 17043 then examine
	EM 0		  it - Causes single bit ECC error
	CAUSE ?MRE	Hang MMC by issuing only half a memory write
	ER 101		Check 8080 Reg 101 for 'REF ERR'
	MR		Should reset 'MMC7 PARITY ERR'
	EI 100000	MSR should show 'MMC7 PARITY ERR' not asserted
RESPONSE
	'MMC7 PARITY ERR' bit 03 set (Mem Stat Reg: \U0 )
!
[6
!STIMULUS
	MR,LI 100000	Write Mem Stat Reg:  Set PE, turn off ECC,
	DI 700000000176	  Set force bits to 077, clear Err Hold
	LA 17043,DM 0	Write 0's to mem loc 17043 then examine
	EM 0		  it - Causes single bit ECC error
	CAUSE ?MRE	Hang MMC by issuing only half a memory write
	ER 101		Check 8080 Reg 101 for 'REF ERR'
	MR		Should assert 'MMC3 ECC ON'
	EI 100000	MSR should show 'MMC3 ECC ON' asserted
RESPONSE
	ECC still turned off (bit 04) (Mem Stat Reg: \U0 )
!
[7
!STIMULUS
	MR,LI 100000	Write Mem Stat Reg:  Set PE, turn off ECC,
	DI 700000000176	  Set force bits to 077, clear Err Hold
	LA 17043,DM 0	Write 0's to mem loc 17043 then examine
	EM 0		  it - Causes single bit ECC error
	CAUSE ?MRE	Hang MMC by issuing only half a memory write
	ER 101		Check 8080 Reg 101 for 'REF ERR'
	MR		Should not affect 'MMC5 POWER FAILED'
	EI 100000	MSR should show 'MMC5 POWER FAILED' not asserted
RESPONSE
	'MMC5 POWER FAILED' bit 12 set (Mem Stat Reg: \U0 )
!
[8
!STIMULUS
	MR,LI 100000	Write Mem Stat Reg:  Set PE, turn off ECC,
	DI 700000000176	  Set force bits to 077, clear Err Hold
	LA 17043,DM 0	Write 0's to mem loc 17043 then examine
	EM 0		  it - Causes single bit ECC error
	CAUSE ?MRE	Hang MMC by issuing only half a memory write
	ER 101		Check 8080 Reg 101 for 'REF ERR'
	MR		Should reset 'MMC5 ERR HOLD'
	EI 100000	Err Addr should be 100000 since 'ERR HOLD' reset
RESPONSE
	Err Address bits 14..35 incorrect
!
]25
[1
!STIMULUS
	MR		Master Reset
	LI 100000	Write Mem Stat Reg:  Set force bits 1111111,
	DI 700000000377	  Turn off ECC, clear 'ERR HOLD' if it is set
	LA 77777	Write to mem loc 77777 - data is complement of what
	DM 360077700000	  Should be in the MSR when this location is read
	EM 77777	Read mem loc 77777 (Cause ECC error and init MSR)
	EI 100000	Read MSR - should contain '417700077777'
	EM 77777	Read mem loc 77777 - should contain '360077700000'
RESPONSE
	Bits \S0 of Memory Status Register was read improperly
!
[2
!STIMULUS
	MR		Master Reset
	LI 100000	Write Mem Stat Reg:  Set force bits 1111111,
	DI 700000000377	  Turn off ECC, clear 'ERR HOLD' if it is set
	LA 77777	Write to mem loc 77777 - data is complement of what
	DM 360077700000	  Should be in the MSR when this location is read
	EM 77777	Read mem loc 77777 (Cause ECC error and init MSR)
	EI 100000	Read MSR - should contain '417700077777'
	EM 77777	Read mem loc 77777 - should contain '360077700000'
RESPONSE
	Memory Status Register was read improperly
!
[3
!STIMULUS
	MR		Master Reset
	LI 100000	Write Mem Stat Reg:  Set force bits 1111111,
	DI 700000000377	  Turn off ECC, clear 'ERR HOLD' if it is set
	LA 77777	Write to mem loc 77777 - data is complement of what
	DM 360077700000	  Should be in the MSR when this location is read
	EM 77777	Read mem loc 77777 (Cause ECC error and init MSR)
	EI 100000	Read MSR - should contain '417700077777'
	EM 77777	Read mem loc 77777 - should contain '360077700000'
RESPONSE
	Bits \S0 of mem loc 77777 was read improperly
!
[4
!STIMULUS
	MR		Master Reset
	LI 100000	Write Mem Stat Reg:  Set force bits 1111111,
	DI 700000000377	  Turn off ECC, clear 'ERR HOLD' if it is set
	LA 77777	Write to mem loc 77777 - data is complement of what
	DM 360077700000	  Should be in the MSR when this location is read
	EM 77777	Read mem loc 77777 (Cause ECC error and init MSR)
	EI 100000	Read MSR - should contain '417700077777'
	EM 77777	Read mem loc 77777 - should contain '360077700000'
RESPONSE
	Mem loc 77777 was read improperly
!
]26
[1
!STIMULUS
	LI 100000	Write Mem Stat Reg: Clear Err Hold ...
	DI (STATUS)	  Set force bits \O1, Turn off ECC
	LA 11111,DM 0	Write 0's to mem loc 11111
	EM 11111	Should cause single bit ECC err & set 'MMC5 ERR HOLD'
RESPONSE
	'MMC5 ERR HOLD' bit 00 not set (Mem Stat Reg: \U0 )
!
[2
!STIMULUS
	LI 100000	Write Mem Stat Reg: Clear Err Hold ...
	DI (STATUS)	  Set force bits \O1, Turn off ECC
	LA 11111,DM 0	Write 0's to mem loc 11111
	EM 11111	Should cause single bit ECC err
RESPONSE
	Double bit error was detected - 'MMC4 UNCORR ERR HOLD'
	   bit 01 set (Mem Stat Reg: \U0 )
!
[3
!STIMULUS
	LI 100000	Write Mem Stat Reg: Clear Err Hold ...
	DI (STATUS)	  Set force bits \O1, Turn off ECC
	LA 11111,DM 0	Write 0's to mem loc 11111
	EM 11111	Should cause single bit err & load MMC8 Err Addr Reg
RESPONSE
	'MMC8 ERR ADDR' incorrect
!
]27
[1
!STIMULUS
	LI 100000	Write Mem Stat Reg: Clear Err Hold ...
	DI (STATUS)	  Set force bits \O1, Turn off ECC
	LA 11111,DM 0	Write 0's to mem loc 11111
	EM 11111	Should cause single bit ECC err & set 'MMC5 ERR HOLD'
RESPONSE
	'MMC5 ERR HOLD' bit 00 not set (Mem Stat Reg: \U0 )
!
[2
!STIMULUS
	LI 100000	Write Mem Stat Reg: Clear Err Hold ...
	DI (STATUS)	  Set force bits \O1, Turn off ECC
	LA 11111,DM 0	Write 0's to mem loc 11111
	EM 11111	Should cause single bit ECC err
RESPONSE
	Double bit error was detected - 'MMC4 UNCORR ERR HOLD'
	   Bit 01 set (Mem Stat Reg: \U0 )
!
[3
!STIMULUS
	LI 100000	Write Mem Stat Reg: Clear Err Hold ...
	DI (STATUS)	  Set force bits \O1, Turn off ECC
	LA 11111,DM 0	Write 0's to mem loc 11111
	EM 11111	Should cause single bit err & load MMC8 Err Addr Reg
RESPONSE
	'MMC8 ERR ADDR' incorrect
!
]28
[1
!STIMULUS
	LI 100000	Write Mem Stat Reg: Clear Err Hold ...
	DI (STATUS)	  Set force bits \O1, turn on ECC
	LA 11111,DM 0	Write 0's to mem loc 11111
	EM 11111	Should cause double bit ECC err & set 'MMC5 ERR HOLD'
RESPONSE
	'MMC5 ERR HOLD' bit 00 not set (Mem Stat Reg: \U0 )
!
[2
!STIMULUS
	LI 100000	Write Mem Stat Reg: Clear Err Hold ...
	DI (STATUS)	  Set force bits \O1, turn on ECC
	LA 11111,DM 0	Write 0's to mem loc 11111
	EM 11111	Should cause double bit ERR & set 'MMC4 UNCOR ERR HOLD'
RESPONSE
	'MMC4 UNCOR ERR HOLD' bit 01 not set (Mem Stat Reg: \U0 )
!
[3
!STIMULUS
	LI 100000	Write Mem Stat Reg: Clear Err Hold ...
	DI (STATUS)	  Set force bits \O1, turn on ECC
	LA 11111,DM 0	Write 0's to mem loc 11111
	EM 11111	Should cause double bit ERR & load MMC8 Err Addr Reg
RESPONSE
	'MMC8 ERR ADDR' incorrect
!
]29
[1
!STIMULUS:
	MR		Ensure 'MMC5 ERR HOLD' is not asserted
	EI 100000	Read Mem Status Reg: \U0 ('ERR HOLD' should not be set)
RESPONSE:
	'MMC5 ERR HOLD' bit 00 set
!
[2
!STIMULUS:
	MR		Ensure 'MMC5 ERR HOLD' is not asserted
	EI 100000	Read Mem Status Register
	DI 700000000016	Write Mem Stat Reg:  Set force bits 0000111
	LA 22222,DM \S1	Write \S1 to mem loc 22222
	EI 100000	Read Mem Status Reg: \U0 ('ERR HOLD' should not be set)
RESPONSE:
	'MMC5 ERR HOLD' bit 00 set
!
[3
!STIMULUS:
	MR		Ensure 'MMC5 ERR HOLD' is not asserted
	EI 100000	Read Mem Status Register
	DI 700000000016	Write Mem Stat Reg:  Set force bits 0000111
	LA 22222,DM \S1	Write \S1 to mem loc 22222
	EI 100000	Read Mem Status Register
	EM 22222	Examine mem loc 22222 (Should cause ECC error)
	EI 100000	Read Mem Status Reg: \U0 ('ERR HOLD' should be set)
RESPONSE:
	'MMC5 ERR HOLD' bit 00 not set
!
[4
!STIMULUS:
	MR		Ensure 'MMC5 ERR HOLD' is not asserted
	EI 100000	Read Mem Status Register
	DI 700000000016	Write Mem Stat Reg:  Set force bits 0000111
	LA 22222,DM \S1	Write \S1 to mem loc 22222
	EI 100000	Read Mem Status Register
	EM 22222	Examine mem loc 22222 (Should cause ECC error)
	EI 100000	Read Mem Status Register
	MR		Clear 'MMC5 ERR HOLD'
	EI 100000	Read Mem Status Reg: \U0 ('ERR HOLD' should not be set)
RESPONSE:
	'MMC5 ERR HOLD' bit 00 set
!
]30
[1
!STIMULUS
	MR		Clear everything
	LI 100000	Write Mem Stat Reg: Clear Err Hold ...,
	DI (STATUS)	  Set force bits \O1, turn on ECC
	LA 0,DM 0	Write 0's to mem loc 0
	EM 0		Examine mem loc (Should cause single bit error
			  - Data should not be corrected)
RESPONSE
	Data returned was corrected (Mem Stat Reg: \U0 )
!
]31
[1
!STIMULUS
	MR		Clear everything
	LI 100000	Write Mem Stat Reg: Clear Err Hold ...,
	DI (STATUS)	  Set force bits \O1, turn on ECC
	LA 0,DM 0	Write 0's to mem loc 0
	EM 0		Examine mem loc (Should cause single bit error
			  (Bit \D2) - and complement it
RESPONSE
	Data returned was not corrected (Mem Stat Reg: \U0 )
!
]32
[1
!STIMULUS
	MR		Clear everything
	LI 100000	Write Mem Stat Reg: Clear Err Hold ...,
	DI (STATUS)	  Set force bits \O1, turn on ECC
	LA 0,DM 0	Write 1's to mem loc 0
	EM 0		Examine mem loc (Should cause single bit error
			  - But data should not be corrected)
RESPONSE
	Data returned was corrected (Mem Stat Reg: \U0 )
!
]33
[1
!STIMULUS
	MR		Clear everything
	LI 100000	Write Mem Stat Reg: Clear Err Hold ...,
	DI (STATUS)	  Set force bits \O1, turn on ECC
	LA 0,DM -1	Write 1's to mem loc 0
	EM 0		Examine mem loc (Should cause single bit error
			  (Bit \D2) - and complement it
RESPONSE
	Data returned was not corrected (Mem Stat Reg: \U0 )
!
]34
[1
!STIMULUS
	MR		Clear everything
	LI 100000	Write Mem Stat Reg: Clear Err Hold ...,
	DI (STATUS)	  Set force bits \O1, turn on ECC
	LA 0,DM 0	Write 0's to mem loc 0
	EM 0		Examine mem loc (Should cause double bit error
			  - Data should not be corrected)
RESPONSE
	Data returned was corrected (Mem Stat Reg: \U0 )
!
]35
[1
!STIMULUS
	MR		Clear everything
	LI 100000	Write Mem Stat Reg: Clear Err Hold ...,
	DI (STATUS)	  Set force bits \O1, turn on ECC
	LA 0,DM 0	Write 0's to mem loc 0
	EM 0		Examine mem loc (Should cause double bit error
			  - Data should not be corrected)
RESPONSE
	Data returned was corrected (Mem Stat Reg: \U0 )
!
]36
[1
!STIMULUS
	MR		Clear everything
	LI 100000	Write Mem Stat Reg: Clear Err Hold ...,
	DI (STATUS)	  Set force bits \O1, turn on ECC
	LA 0,DM -1	Write 1's to mem loc 0
	EM 0		Examine mem loc (Should cause double bit error
			  - Data should not be corrected)
RESPONSE
	Data returned was corrected (Mem Stat Reg: \U0 )
!
]37
[1
!STIMULUS
	MR		Clear everything
	LI 100000	Write Mem Stat Reg: Clear Err Hold ...,
	DI (STATUS)	  Set force bits \O1, turn on ECC
	LA 0,DM -1	Write 1's to mem loc 0
	EM 0		Examine mem loc (Should cause double bit error
			  - Data should not be corrected)
RESPONSE
	Data returned was corrected (Mem Stat Reg: \U0 )
!
]38
[1
!STIMULUS:
	LA 0	Write to mem loc 0
	DM \U0
	EM 0	Examine mem loc 0
RESPONSE:
	Bit \D1 of data returned is incorrect
!
[2
!STIMULUS:
	LA 0	Write to mem loc 0
	DM \U0
	EM 0	Examine mem loc 0
RESPONSE:
	Bits \S1 of data returned is incorrect
!
[3
!STIMULUS:
	LA 0	Write to mem loc 0
	DM \U0
	EM 0	Examine mem loc 0
RESPONSE:
	Bits 00-35 of data returned is incorrect
!
]39
[1
!STIMULUS
	MR		Master Reset
	LA 77777,DM 0	Put address into 8080 I/O Regs
	LR 114,DR 0	Turn off data cycle bit
	LR 115,DR 4	Turn on comadr cycle bit
	LR 210,DR 360	Do half of a write to mem (causes ?MRE)
RESPONSE
	?MRE did not occur    8080 Reg 101:  \O0
!
[2
!STIMULUS
	MR		Master Reset
	LA 77777,DM 0	Put address into 8080 I/O Regs
	LR 114,DR 0	Turn off data cycle bit
	LR 115,DR 4	Turn on comadr cycle bit
	LR 210,DR 360	Do half of a write to mem (causes ?MRE)
	EI 100000	Read Mem Status Reg - Verify 'ERR HOLD' bit
			  and error address
RESPONSE
	MMC5 'ERR HOLD' bit not asserted
	Mem Stat Reg:  \U0
!
[3
!STIMULUS
	MR		Master Reset
	LA 77777,DM 0	Put address into 8080 I/O Regs
	LR 114,DR 0	Turn off data cycle bit
	LR 115,DR 4	Turn on comadr cycle bit
	LR 210,DR 360	Do half of a write to mem (causes ?MRE)
	EI 100000	Read Mem Status Reg - Verify 'ERR HOLD' bit
			 and error address
RESPONSE
	MMC8 'ERR ADDR' not correct
!
]40
[1
!STIMULUS
	MR		Master Reset
	HANG MMC	Cause a memory refresh error
RESPONSE
	?MRE did not occur    8080 Reg 101:  \O0
!
[2
!STIMULUS
	MR		Master Reset
	HANG MMC	Cause a memory refresh error
	EM 0		Should result in ?NXM
RESPONSE
	?MRE did occur (8080 Reg 101:  \O0) (Mem Stat Reg:  \U2)
	?NXM did not occur   EM 0:  \U5    8080 Reg 301:  \O1
	Mem Stat Reg (After EM 0):  \U3
!
[3
!STIMULUS
	MR		Master Reset
	HANG MMC	Cause a memory refresh error
	EM 0
	LA 0,DM 0	Should result in ?NXM
RESPONSE
	?MRE did occur (8080 Reg 101:  \O0) (Mem Stat Reg:  \U2)
	?NXM did not occur      8080 Reg 301:  \O1
	Mem Stat Reg (After DM 0):  \U4
!
]41
[1
!STIMULUS
	Sync T & R Clocks to a point shortly after a ?MRE has
	  Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller) (To keep refresh from disrupting this test)
RESPONSE
	Attempt to sync T & R Clocks failed - could not generate a
	  refresh error
!
[2
!STIMULUS
	Sync T & R Clocks to a point shortly after a ?MRE has
	  Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller) (To keep refresh from disrupting this test)
	Write 8080 I/O Regs 102..115 for a write status to turn
	  off 'MMC REF ERR'
	Write '360' TO 8080 I/O Reg 210 control bits for write
	  ('MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Do 13 ticks (3 T Clocks to do most of the write status)
	Write 8080 I/O Regs 102..115 for a write to memory
	Write '360' TO 8080 I/O Reg 210 control bits for write
	  ('MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick T Clock until 'MEM BUSY' appears in 8080 Reg 102
	  (It should occur after 5 more T Clocks to allow I/O
	  write to complete and then start memory write cycle)
RESPONSE
	'MEM BUSY' never appeared in I/O Reg 102: \O0
	  (A total of 56 ticks (14 T Clocks) were given since
	   the start of the mem I/O status write cycle)
!
[3
!STIMULUS
	Sync T & R Clocks to a point shortly after a ?MRE has
	  Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller) (To keep refresh from disrupting this test)
	Write 8080 I/O Regs 102..115 for a write status to turn
	  OFF 'MMC REF ERR'
	Write '360' TO 8080 I/O Reg 210 control bits for write
	  ('MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Do 13 ticks (3 T Clocks to do most of the write status)
	Write 8080 I/O Regs 102..115 for a write to memory
	Write '360' TO 8080 I/O Reg 210 control bits for write
	  ('MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick T Clock until 'MEM BUSY' appears in 8080 Reg 102
	  (It should occur after 5 more T Clocks to allow I/O
	  write to complete and then start memory write cycle)
RESPONSE
	'MEM BUSY' appeared in I/O Reg 102 after \D4 ticks
	  but it should have occurred after 34 ticks (8 T Clocks)
!
[4
!STIMULUS
	Sync T & R Clocks to a point shortly after a ?MRE has
	  Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller) (To keep refresh from disrupting this test)
	Write 8080 I/O Regs 102..115 for a write status to turn
	  off 'MMC REF ERR'
	Write '360' TO 8080 I/O Reg 210 control bits for write
	  ('MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Do 13 ticks (3 T Clocks to do most of the write status)
	Write 8080 I/O Regs 102..115 for a write to memory
	Write '360' TO 8080 I/O Reg 210 control bits for write
	  ('MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick T Clock until 'MEM BUSY' appears in 8080 Reg 102
	  (It should occur after 5 more T Clocks to allow I/O
	  write to complete and then start memory write cycle)
RESPONSE
	Mem status write did not occur properly - 'WRITE STATUS' and
	  'WRITE MEM' both succeeded but timing is off
	Number of ticks from start of 'WRITE STATUS' to see 'MMC REF ERR'
	  shut off in 8080 I/O Reg 101 - \D3 ticks  (Reg 101:  \O1)
	Number of ticks from start of 'WRITE STATUS' to see 'MEM BUSY'
	  in 8080 I/O Reg 102 - \D4 TICKS (102:  \O0)
	Mem Status Reg:  \U1  (Seen after clocks restarted)
!
]42
[1
!STIMULUS
	Sync T & R Clocks to a point shortly after a ?MRE has
	  Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller) (To keep refresh from disrupting this test)
RESPONSE
	Attempt to sync T & R Clocks failed - could not generate a
	  refresh error
!
[2
!STIMULUS
	Sync T & R Clocks to a point shortly after a ?MRE has
	  Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller) (To keep refresh from disrupting this test)
	Write 8080 I/O Regs 102..115,210 for a write status to turn off
	  'MMC REF ERR' (So that MMC will not be hung for a mem access)
	Write 8080 I/O Regs 102..115 for a read status to read 'ECC ON'
	  (Should appear as 'R DATA 4' bit in 8080 I/O Reg 3)
	WRITE '361' TO 8080 I/O REG 210 CONTROL BITS FOR READ
	  ('MEM','BUS REQ','XMIT ADR','LATCH DATA SENT','R CLK ENABLE L')
	Do 13 ticks (3 T Clocks to do most of the read status)
	Write 8080 I/O Regs 102..115 for a write to memory
	Write '360' to 8080 I/O Reg 210 control bits for write
	  ('MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick T Clock until 'MEM BUSY' appears in 8080 Reg 102
	  (It should occur after 5 more T Clocks to allow I/O
	  read to complete and then start memory write cycle)
RESPONSE
	'MEM BUSY' never appeared in I/O Reg 102: \O0
	  (A total of 56 ticks (14 T Clocks) were given since
	   the start of the Mem I/O Status Read cycle)
	Either 'READ STATUS' failed or 'WRITE MEM' failed
!
[3
!STIMULUS
	Sync T & R Clocks to a point shortly after a ?MRE has
	  Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller) (To keep refresh from disrupting this test)
	Write 8080 I/O Regs 102..115,210 for a write status to turn off
	  'MMC REF ERR' (So that MMC will not be hung for a mem access)
	Write 8080 I/O Regs 102..115 for a read status to read 'ECC ON'
	  (Should appear as 'R DATA 4' bit in 8080 I/O Reg 3)
	Write '361' to 8080 I/O Reg 210 control bits for read
	  ('MEM','BUS REQ','XMIT ADR','LATCH DATA SENT','R CLK ENABLE L')
	Do 13 ticks (3 T Clocks to do most of the read status)
	Write 8080 I/O Regs 102..115 for a write to memory
	Write '360' to 8080 I/O Reg 210 control bits for write
	  ('MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick T Clock until 'MEM BUSY' appears in 8080 Reg 102
	  (It should occur after 5 more T Clocks to allow I/O
	  read to complete and then start memory write cycle)
RESPONSE
	'MEM BUSY' appeared in I/O Reg 102 after \D4 ticks but it
	  should have occurred after 34 ticks (8 T Clocks) (Or
	  21 ticks (5 T Clocks) after writing 'WRITE MEM' data to
	  8080 Regs.  Therefore the 'READ STATUS' took longer or
	  shorter than it should have.
!
[4
!STIMULUS
	Sync T & R Clocks to a point shortly after a ?MRE has
	  Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller) (To keep refresh from disrupting this test)
	Write 8080 I/O Regs 102..115,210 for a write status to turn off
	  'MMC REF ERR' (So that MMC will not be hung for a mem access)
	Write 8080 I/O Regs 102..115 for a read status to read 'ECC ON'
	  (Should appear as 'R DATA 4' bit in 8080 I/O Reg 3)
	Write '361' to 8080 I/O Reg 210 control bits for read
	  ('MEM','BUS REQ','XMIT ADR','LATCH DATA SENT','R CLK ENABLE L')
	Do 13 ticks (3 T Clocks to do most of the read status)
	Write 8080 I/O Regs 102..115 for a write to memory
	Write '360' to 8080 I/O Reg 210 control bits for write
	  ('MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick T Clock until 'MEM BUSY' appears in 8080 Reg 102
	  (It should occur after 5 more T Clocks to allow I/O
	  read to complete and then start memory write cycle)
RESPONSE
	Mem status read did not occur properly - 'READ STATUS' and
	  'WRITE MEM' both succeeded but timing is off
	Number of ticks from start of 'READ STATUS' to see 'ECC ON' in
	  8080 I/O Reg 3 - \D3 ticks  (Reg 3:  \O2)
	Number of ticks from start of 'READ STATUS' to see 'MEM BUSY'
	  in 8080 I/O Reg 102 - \D4 ticks (102:  \O0)
	Mem Status Reg:  \U1  (Seen after clocks restarted)
!
]43
[1
!STIMULUS
	Sync T & R Clocks to a point shortly after a ?MRE has
	  Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller) (To keep refresh from disrupting this test)
RESPONSE
	Attempt to sync T & R Clocks failed - could not generate a
	  refresh error
!
[2
!STIMULUS
	Sync T & R Clocks to a point shortly after a ?MRE has
	  Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller) (To keep refresh from disrupting this test)
	Write 8080 I/O Regs 102..115 for a write to mem loc 0
	Write '360' to 8080 I/O Reg 210 control bits for write
	  ('MEM','BUS REQ','XMIT ADR','XMIT DATA')
	(A)  Tick T Clock until 'MEM BUSY' gets set in 8080 I/O Reg 102
	     (Should take 18 ticks (4.5 T Clocks))
	(B)  Tick T Clock until 'MEM BUSY' clears in 8080 I/O Reg 102
	     (Should take 8 ticks (2 T Clocks))
	Write 8080 I/O Regs 102..115 for a write to mem loc 0
	Write '360' to 8080 I/O Reg 210 control bits for write
	  ('MEM','BUS REQ','XMIT ADR','XMIT DATA')
	(C)  Tick T Clock until 'MEM BUSY' gets set in 8080 I/O Reg 102
	     (Should take 20 ticks (5 T Clocks))
	(D)  Tick T Clock until 'MEM BUSY' clears in 8080 I/O Reg 102
	     (Should take 8 ticks (2 T Clocks))
RESPONSE
	(A) - Took \D0 ticks to see 'MEM BUSY' assert
	(B) - Took \D1 ticks to see 'MEM BUSY' clear
	(C) - Took \D2 ticks to see 'MEM BUSY' assert
	(D) - Took \D3 ticks to see 'MEM BUSY' clear
!
]44
[1
!STIMULUS
	Sync T & R Clocks
	Write 8080 I/O Regs 102..115 for a write to mem loc 7777777
	Write '360' to 8080 I/O Reg 210 control bits for write
	  ('MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick T Clock until 'NXM' gets set in 8080 I/O Reg 301
	  (Should take 16 ticks (4 T Clocks))
RESPONSE
	'NXM' never appeared in I/O Reg 301: \O0   (\D2 ticks given)
!
[2
!STIMULUS
	Sync T & R Clocks
	Write 8080 I/O Regs 102..115 for a write to mem loc 7777777
	Write '360' to 8080 I/O Reg 210 control bits for write
	  ('MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick T Clock until 'NXM' gets set in 8080 I/O Reg 301
	  (Should take 16 ticks (4 T Clocks)) (It took \D2 ticks)
	Write 8080 I/O Regs 102..115 for a write to mem loc 0
	Write '360' to 8080 I/O Reg 210 control bits for write
	  ('MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick T Clock until 'MEM BUSY' gets set in 8080 I/O Reg 102
	  (Should take 16 ticks (4 T Clocks))
RESPONSE
	'MEM BUSY' never appeared in Reg 102 (\D3 more ticks)
	8080 I/O Regs 301:  \O0   102:  \O1
!
[3
!STIMULUS
	Sync T & R Clocks
	Write 8080 I/O Regs 102..115 for a write to mem loc 7777777
	Write '360' to 8080 I/O Reg 210 control bits for write
	  ('MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick T Clock until 'NXM' gets set in 8080 I/O Reg 301
	  (Should take 16 ticks (4 T Clocks)) (It took \D2 ticks)
	Write 8080 I/O Regs 102..115 for a write to mem loc 0
	Write '360' to 8080 I/O Reg 210 control bits for write
	  ('MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick T Clock until 'MEM BUSY' gets set in 8080 I/O Reg 102
	  (Should take 16 ticks (4 T Clocks))
RESPONSE
	'MEM BUSY' appeared in I/O Reg 102 but it took \D3 ticks
	8080 I/O Regs 301:  \O0   102:  \O1
!
]45
[1
!STIMULUS
	Sync T & R Clocks to a point shortly after a ?MRE has
	  Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller) (To keep refresh from disrupting this test)
RESPONSE
	Attempt to sync T & R Clocks failed - could not generate a
	  refresh error
!
[2
!STIMULUS
	MR,LA 111,DM 0	Write 0's to mem loc 111
	LI 100000	Write status to mem - Clear ERR HOLD ..
	DI 700000000376	  Set force bits '177' (Single bit ECC error)
	LA 222,DM 0	Write 0's to mem loc 222
	LI 100000	Write status to mem - Clear ERR HOLD ..
	DI 700000000374	  Set force bits '176' (Double bit ECC error)
	LA 333,DM 0	Write 0's to mem loc 333
	Sync T & R Clocks to a point shortly after a ?MRE has
	  Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller) (To keep refresh from disrupting this test)
	Write 8080 I/O Regs 102..115 for a read of mem loc '\O6'
	Write '360' to 8080 I/O Reg 210 control bits for write
	  ('MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick clock until 'COM ADR' asserts in 8080 Reg 102 indicating the
	  start of the memory cycle
RESPONSE
	'COM ADR' not asserted after \D0 ticks
	8080 I/O Reg 102:  \O1	
!
[3
!STIMULUS
	MR,LA 111,DM 0	Write 0's to mem loc 111
	LI 100000	Write status to mem - Clear ERR HOLD ..
	DI 700000000376	  Set force bits '177' (Single bit ECC error)
	LA 222,DM 0	Write 0's to mem loc 222
	LI 100000	Write status to mem - Clear ERR HOLD ..
	DI 700000000374	  Set force bits '176' (Double bit ECC error)
	LA 333,DM 0	Write 0's to mem loc 333
	Sync T & R Clocks to a point shortly after a ?MRE has
	  Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller) (To keep refresh from disrupting this test)
	Write 8080 I/O Regs 102..115 for a read of mem loc '\O6'
	Write '360' to 8080 I/O Reg 210 control bits for write
	  ('MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick clock until 'COM ADR' asserts in 8080 Reg 102 indicating the
	  start of the memory cycle - It took \D0 Ticks    102:  \O1
	Tick clock until 'MEM BUSY' asserts in Reg 102
RESPONSE
	'MEM BUSY' never appeared in Reg 102
	Reg 102:  \O3   After \D2 Ticks
!
[4
!STIMULUS
	MR,LA 111,DM 0	Write 0's to mem loc 111
	LI 100000	Write status to mem - Clear ERR HOLD ..
	DI 700000000376	  Set force bits '177' (Single bit ECC error)
	LA 222,DM 0	Write 0's to mem loc 222
	LI 100000	Write status to mem - Clear ERR HOLD ..
	DI 700000000374	  Set force bits '176' (Double bit ECC error)
	LA 333,DM 0	Write 0's to mem loc 333
	Sync T & R Clocks to a point shortly after a ?MRE has
	  Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller) (To keep refresh from disrupting this test)
	Write 8080 I/O Regs 102..115 for a read of mem loc '\O6'
	Write '360' to 8080 I/O Reg 210 control bits for write
	  ('MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick clock until 'COM ADR' asserts in 8080 Reg 102 indicating the
	  start of the memory cycle - It took \D0 ticks    102:  \O1
	Tick clock until 'MEM BUSY' asserts in Reg 102 (It took \D2 ticks)
	Tick clock until 'MEM BUSY' clears (It should take \D7 ticks)
RESPONSE
	'MEM BUSY' still asserted after \D4 ticks
	8080 I/O Reg 102:  \O5	
!
[5
!STIMULUS
	MR,LA 111,DM 0	Write 0's to mem loc 111
	LI 100000	Write status to mem - Clear ERR HOLD ..
	DI 700000000376	  Set force bits '177' (Single bit ECC error)
	LA 222,DM 0	Write 0's to mem loc 222
	LI 100000	Write status to mem - Clear ERR HOLD ..
	DI 700000000374	  Set force bits '176' (Double bit ECC error)
	LA 333,DM 0	Write 0's to mem loc 333
	Sync T & R Clocks to a point shortly after a ?MRE has
	  Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller) (To keep refresh from disrupting this test)
	Write 8080 I/O Regs 102..115 for a read of mem loc '\O6'
	Write '360' to 8080 I/O Reg 210 control bits for write
	  ('MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick clock until 'COM ADR' asserts in 8080 Reg 102 indicating the
	  start of the memory cycle - It took \D0 ticks    102:  \O1
	Tick clock until 'MEM BUSY' asserts in Reg 102 (It took \D2 ticks)
	Tick clock until 'MEM BUSY' clears - 'MEM BUSY' should have been
	  asserted for a total of \D7 ticks
RESPONSE
	Ticks needed to clear 'MEM BUSY' - \D5
	MEM BUSY was asserted for \D8 ticks - Timing is off
!
]46
[1
!STIMULUS
	LR 115,DR 4	Write Com/Adr data to 8080 Regs - Set 'COM/ADR CYCLE'
	LR 114,DR 0	  Set MEM WRITE, do not set 'DATA CYCLE' -- causes
	LR 113,DR 1	  ?MRE
	LR 210,DR 361	Set up mem cycle - 'CHECK NXM','CONSOLE REQ','T ENB
			  FOR COM/ADR & DATA', and 'R CLK ENB L'
	EI 100000	Read Mem Stat Reg - should show 'REF ERR'
	ER 101		Read 8080 Reg 101 - should show 'MMC REF ERR B'
RESPONSE
	Neither IO Reg 101 or MSR shows 'REF ERR'
	MSR:  \U0	I/O Reg 101:  \O1
!
[2
!STIMULUS
	LR 115,DR 4	Write Com/Adr data to 8080 regs - set 'COM/ADR CYCLE'
	LR 114,DR 0	  Set MEM WRITE, do not set 'DATA CYCLE' -- causes
	LR 113,DR 1	  ?MRE
	LR 210,DR 361	Set up mem cycle - 'CHECK NXM','CONSOLE REQ','T ENB
			  FOR COM/ADR & DATA', and 'R CLK ENB L'
	EI 100000	Read Mem Stat Reg - should show 'REF ERR'
	ER 101		Read 8080 Reg 101 - should show 'MMC REF ERR B'
RESPONSE
	MSR shows 'REF ERR' but I/O Reg 101 does not
	MSR:  \U0	I/O Reg 101:  \O1
!
[3
!STIMULUS
	LR 115,DR 4	Write Com/Adr data to 8080 regs - set 'COM/ADR CYCLE'
	LR 114,DR 0	  Set MEM WRITE, do not set 'DATA CYCLE' -- causes
	LR 113,DR 1	  ?MRE
	LR 210,DR 361	Set up mem cycle - 'CHECK NXM','CONSOLE REQ','T ENB
			  FOR COM/ADR & DATA', and 'R CLK ENB L'
	EI 100000	Read Mem Stat Reg - should show 'REF ERR'
	ER 101		Read 8080 Reg 101 - should show 'MMC REF ERR B'
RESPONSE
	IO Reg 101 shows 'REF ERR' but MSR does not
	MSR:  \U0	I/O Reg 101:  \O1
!
]47
[1
!STIMULUS
	Sync T & R Clocks in maintenance mode
	Write 8080 Regs 103..115,210 to neither write nor read memory - to
	  hang memory controller and cause a memory refresh error
	Tick T Clock forward 132 ticks (33 T Clocks) so that sometime in the
	  next \D4 ticks (\D6 T Clocks) 'MMC9 REFRESH ERR' will assert
	At this point we should be within 132 ticks of the time the refresh
	  error actually occurred
RESULTS
	After 6600 ticks (1650 T Clocks) a ?MRE still failed to appear
!
[2
!STIMULUS
	Sync T & R Clocks in maintenance mode
	Write 8080 Regs 103..115,210 to neither write nor read memory - To
	  hang memory controller and cause a memory refresh error
	Tick T Clock forward 132 ticks (33 T Clocks) so that sometime in the
	  next \D4 ticks (\D6 T Clocks) 'MMC9 REFRESH ERR' will assert
	?MRE did appear after \D0 ticks
	Do 60 ticks (15 T Clocks)
	Write 8080 Regs 102..115,210 for a write status to clear ?MRE
	Do 60 ticks (15 T Clocks) - Now ?MRE should be cleared from Reg 101
RESPONSE
	?MRE did not clear   8080 Reg 101:  \O1
!
[3
!STIMULUS
	Sync T & R Clocks in maintenance mode
	Write 8080 Regs 103..115,210 to neither write nor read memory - To
	  hang memory controller and cause a memory refresh error
	Tick T Clock forward 132 ticks (33 T Clocks) so that sometime in the
	  next \D4 ticks (\D6 T Clocks) 'MMC9 REFRESH ERR' will assert
	?MRE did appear after \D0 ticks
	Do 60 ticks (15 T Clocks)
	Write 8080 Regs 102..115,210 for a write status to clear ?MRE
	Do 60 ticks (15 T Clocks) - Now ?MRE should be cleared from Reg 101
	Write 8080 Regs 103..115,210 to neither write nor read memory - To
	  hang memory controller and cause a memory refresh error
	Tick T Clock forward 500 ticks (125 T Clocks) so that sometime in the
	  next \D7 to \D8 ticks 'MMC9 REFRESH ERR' will assert
RESPONSE
	No refresh error occurred even after \D2 additional ticks
!
[4
!STIMULUS
	Sync T & R Clocks in maintenance mode
	Write 8080 Regs 103..115,210 to neither write nor read memory - To
	  hang memory controller and cause a memory refresh error
	Tick T Clock forward 132 ticks (33 T Clocks) so that sometime in the
	  next \D4 ticks (\D6 T Clocks) 'MMC9 REFRESH ERR' will assert
	?MRE did appear after \D0 ticks
	Do 60 ticks (15 T Clocks)
	Write 8080 Regs 102..115,210 for a write status to clear ?MRE
	Do 60 ticks (15 T Clocks) - Now ?MRE should be cleared from Reg 101
	Write 8080 Regs 103..115,210 to neither write nor read memory - to
	  hang memory controller and cause a memory refresh error
	Tick T Clock forward 500 ticks (125 T Clocks) so that sometime in the
	  next \D7 to \D8 ticks 'MMC9 REFRESH ERR' will assert - it took
	  \D2 additional ticks
	Do 60 ticks (15 T Clocks)
	Write 8080 Regs 102..115,210 for a write status to clear ?MRE
	Do 60 ticks (15 T Clocks) - Now ?MRE should be cleared from Reg 101
RESPONSE
	?MRE did not clear   8080 Reg 101:  \O1
!
[5
!STIMULUS
	Sync T & R Clocks in maintenance mode
	Write 8080 Regs 103..115,210 to neither write nor read memory - To
	  hang memory controller and cause a memory refresh error
	Tick T Clock forward 132 ticks (33 T Clocks) so that sometime in the
	  next \D4 ticks (\D6 T Clocks) 'MMC9 REFRESH ERR' will assert
	?MRE did appear after \D0 ticks
	Do 60 ticks (15 T Clocks)
	Write 8080 Regs 102..115,210 for a write status to clear ?MRE
	Do 60 ticks (15 T Clocks) - Now ?MRE should be cleared from Reg 101
	Write 8080 Regs 103..115,210 to neither write nor read memory - To
	  hang memory controller and cause a memory refresh error
	Tick T Clock forward 500 ticks (125 T Clocks) so that sometime in the
	  next \D7 to \D8 ticks 'MMC9 REFRESH ERR' will assert - It took
	  \D2 additional ticks
	Do 60 ticks (15 T Clocks)
	Write 8080 Regs 102..115,210 for a write status to clear ?MRE
	Do 60 ticks (15 T Clocks) - Now ?MRE should be cleared from Reg 101
	Write 8080 Regs 103..115,210 to neither write nor read memory - To
	  hang memory controller and cause a memory refresh error
	Tick T Clock forward 640 ticks (160 T Clocks)
	Tick T Clock forward 4 ticks (1 T Clock) at a time until a ?MRE
	  occurs - It should have taken \D4 ticks since the previous ?MRE
RESPONSE
	Caused a ?MRE after \D3 ticks - Timing is faulty
!
[6
!STIMULUS
	Sync T & R Clocks in maintenance mode
	Write 8080 Regs 103..115,210 to neither write nor read memory - to
	  hang memory controller and cause a memory refresh error
	Tick T Clock forward 132 ticks (33 T Clocks) so that sometime in the
	  next \D4 ticks (\D6 T Clocks) 'MMC9 REFRESH ERR' will assert
	?MRE did appear after \D0 ticks
	Do 60 ticks (15 T Clocks)
	Write 8080 Regs 102..115,210 for a write status to clear ?MRE
	Do 60 ticks (15 T Clocks) - Now ?MRE should be cleared from Reg 101
	Write 8080 Regs 103..115,210 to neither write nor read memory - to
	  hang memory controller and cause a memory refresh error
	Tick T Clock forward 500 ticks (125 T Clocks) so that sometime in the
	  next \D7 to \D8 ticks 'MMC9 REFRESH ERR' will assert - It took
	  \D2 additional ticks
	Do 60 ticks (15 T Clocks)
	Write 8080 Regs 102..115,210 for a write status to clear ?MRE
	Do 60 ticks (15 T Clocks) - Now ?MRE should be cleared from Reg 101
	Write 8080 Regs 103..115,210 to neither write nor read memory - to
	  hang memory controller and cause a memory refresh error
	Tick T Clock forward 640 ticks (160 T Clocks)
	Tick T Clock forward 4 ticks (1 T Clock) at a time until a ?MRE
	  occurs - It should have taken \D4 ticks since the previous ?MRE
RESPONSE
	No refresh error occurred even after \D3 ticks    REG 101:  \O1
!
[7
!STIMULUS
RESPONSE
	TICKS TO SEE ?MRE \D0   REG101 \O1
!
]48
[1
!STIMULUS
	Sync T & R Clocks to a point shortly after a ?MRE has
	  Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller) (To keep refresh from disrupting this test)
RESPONSE
	Attempt to sync T & R Clocks failed - could not generate a
	  refresh error
!
[2
!STIMULUS
	Sync T & R Clocks to a point immediately after refresh error
	  has Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller)
	Write 8080 Regs 102..115,210 for a write status to clear ?MRE
	Tick T Clock forward 486 ticks (122 T Clocks) so that in 38
	  ticks 'MMC9 REFRESH REQ' will assert
RESPONSE
	'MMC9 REF ERR' did not clear - Write status failed
	8080 Reg 101:  \O0
!
[3
!STIMULUS
	Sync T & R Clocks to a point immediately after refresh error
	  has Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller)
	Write 8080 Regs 102..115,210 for a write status to clear ?MRE
	Tick T Clock forward 486 ticks (122 T Clocks) so that in 38
	  ticks 'MMC9 REFRESH REQ' will assert
	Write 8080 I/O Regs 102..115,210 for a write to mem - Just to keep
	  memory busy until after 'MMC9 REFRESH REQ' has been asserted
	  (Reg 210 contains '360' - 'MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick T Clock until 'MEM BUSY' appears and disappears from 8080
	  Reg 102 (so that a refresh cycle will occur immediately before
	  after 'MEM BUSY' clears and before the next memory write
RESPONSE
	'MEM BUSY' never appeared in 8080 I/O Reg 102:  \O0
	Number of ticks given:  \D1
!
[4
!STIMULUS
	Sync T & R Clocks to a point immediately after refresh error
	  has Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller)
	Write 8080 Regs 102..115,210 for a write status to clear ?MRE
	Tick T Clock forward 486 ticks (122 T Clocks) so that in 38
	  ticks 'MMC9 REFRESH REQ' will assert
	Write 8080 I/O Regs 102..115,210 for a write to mem - just to keep
	  memory busy until after 'MMC9 REFRESH REQ' has been asserted
	  (Reg 210 contains '360' - 'MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick T Clock until 'MEM BUSY' appears and disappears from 8080
	  Reg 102 (so that a refresh cycle will occur immediately before
	  after 'MEM BUSY' clears and before the next memory write
RESPONSE
	'MEM BUSY' appeared in 8080 I/O Reg 102 after \D1 ticks but it was
	  never cleared    (8080 I/O Reg 102:  \O0)
	Number of ticks given:  \D2  (after 'MEM BUSY' was set)
!
[5
!STIMULUS
	Sync T & R Clocks to a point immediately after refresh error
	  has Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller)
	Write 8080 Regs 102..115,210 for a write status to clear ?MRE
	Tick T Clock forward 486 ticks (122 T Clocks) so that in 38
	  ticks 'MMC9 REFRESH REQ' will assert
	Write 8080 I/O Regs 102..115,210 for a write to mem - Just to keep
	  memory busy until after 'MMC9 REFRESH REQ' has been asserted
	  (Reg 210 contains '360' - 'MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick T Clock until 'MEM BUSY' appears and disappears from 8080
	  Reg 102 (so that a refresh cycle will occur immediately before
	  after 'MEM BUSY' clears and before the next memory write
	Write 8080 I/O Regs 102..115,210 for a write to mem - It should take
	  16 extra ticks (4 T Clocks) since a refresh cycle will be occurring
	  (Reg 210 contains '360' - 'MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick T Clock until 'MEM BUSY' appears and disappears from 8080
	  Reg 102 - Then verify the number of ticks take for the write
RESPONSE
	'MEM BUSY' never appeared in 8080 I/O Reg 102:  \O0
	Number of ticks given:  \D3
!
[6
!STIMULUS
	Sync T & R Clocks to a point immediately after refresh error
	  has Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller)
	Write 8080 Regs 102..115,210 for a write status to clear ?MRE
	Tick T Clock forward 486 ticks (122 T Clocks) so that in 
	  ticks 'MMC9 REFRESH REQ' will assert
	Write 8080 I/O Regs 102..115,210 for a write to mem - Just to keep
	  memory busy until after 'MMC9 REFRESH REQ' has been asserted
	  (Reg 210 contains '360' - 'MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick T Clock until 'MEM BUSY' appears and disappears from 8080
	  Reg 102 (so that a refresh cycle will occur immediately before
	  after 'MEM BUSY' clears and before the next memory write
	Write 8080 I/O Regs 102..115,210 for a write to mem - It should take
	  16 extra ticks (4 T Clocks) since a refresh cycle will be occurring
	  (Reg 210 contains '360' - 'MEM','BUS REQ','XMIT ADR','XMIT DATA')
	Tick T Clock until 'MEM BUSY' appears and disappears from 8080
	  Reg 102 - Then verify the number of ticks take for the write
RESPONSE
	'MEM BUSY' appeared in 8080 I/O Reg 102 after \D3 ticks but it was
	  never cleared    (8080 I/O Reg 102:  \O0)
	Number of ticks given:  \D4  (After 'MEM BUSY' was set)
!
[7
!STIMULUS
	Sync T & R Clocks to a point immediately after refresh error
	  has Occurred (Sync clocks then cause a ?MRE by hanging the
	  memory controller)
	Write 8080 Regs 102..115,210 for a write status to clear ?MRE
	Tick T Clock forward 486 ticks (122 T Clocks) so that in 38
	  ticks 'MMC9 REFRESH REQ' will assert
	Write 8080 I/O Regs 102..115,210 for a write to mem - Just to keep
	  memory busy until after 'MMC9 REFRESH REQ' has been asserted
	  (Reg 210 contains '360' - 'MEM','BUS REQ','XMIT ADR','XMIT DATA')
	(A) Tick T Clock until 'MEM BUSY' appears and disappears from 8080
	    Reg 102 (So that a refresh cycle will occur immediately before
	    after 'MEM BUSY' clears and before the next memory write
	Write 8080 I/O Regs 102..115,210 for a write to mem - It should take
	  16 extra ticks (4 T Clocks) since a refresh cycle will be occurring
	  (Reg 210 contains '360' - 'MEM','BUS REQ','XMIT ADR','XMIT DATA')
	(B) Tick T Clock until 'MEM BUSY' appears and disappears from 8080
	    Reg 102 - Then verify the number of ticks take for the write -
	    It should take 24 ticks (6 T Clocks) which is 16 ticks longer
	    than normal (600 NS - 4 T Clocks)
RESPONSE
	'MEM BUSY' was asserted for \D4 ticks instead of 24 ticks
	(A) Ticks to appear - \D1    Disappear - \D2
	(B) Ticks to appear - \D3    Disappear - \D4
!
]49
[1
!S1:  Number of ticks required to generate ?MRE - \D1   101: \O0
!
[2
!S2:  After 60 more ticks - 101: \O0
!
[3
!S3:  Write 'CLEAR ?MRE' data to 8080 regs
S3:  Give 60 more ticks - 101: \O0
!
[4
!S4:  Write 'HANG MEM' data to 8080 regs then tick until ?MRE
S4:  Ticks - \D1    101 - \O0
!
[5
!S5:  Tick 60 then write 'CLEAR ?MRE' data to 8080 regs
S5:  Give 60 more ticks - 101: \O0
S5:  Give 668 more ticks
!
[6
!S6:  Write 'HANG MEM' data to 8080 regs then give 280 ticks
S6:  101: \O0
!
[7
!T1:  Call SYNC REFRESH - How \O0   When \O1
!
[8
!T2:  'CLEAR ?MRE' data written to 8080 regs then clock is ticked
T2:  Ticks: \D1    101: \O0
!
[9
!T3:  'HANG MEM' data written to 8080 regs then clock is ticked
T3:  Ticks: \D1    101: \O0
!
[10
!T4:  SYNC REFRESH returned with failure condition
!
]50
[1
!STIMULUS
	Write '\U0' to 64 locations
	Wait 30-45 seconds
	Refresh should be occurring and refreshing each location
	    just written to
RESPONSE
	Data returned incorrect - Location '\U1' not refreshed?
!
]51
[1
!STIMULUS
	MR		Master Reset
	LA 0,DM -1	Write 1's to mem loc 0
	EM 0		Read data back (should not cause ECC error)
RESPONSE
	ECC error occurred / 'MMC5 ERR HOLD' bit 00 set (Mem Stat Reg: \U0 )
!
   