LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_Latch is
	port( D, C    : in STD_LOGIC;
	      Q, notQ : buffer STD_LOGIC );
end D_Latch;

architecture arch of D_Latch is

	signal set, reset : std_logic;		-- S and R values
	
	begin
		set <= (not D NAND C);
		reset <= (D NAND C);
		
		Q <= (reset NAND notQ);  
		notQ <= (set NAND Q);
		
end arch;