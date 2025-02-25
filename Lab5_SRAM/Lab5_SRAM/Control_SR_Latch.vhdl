LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control_SR_Latch is
	port( S, R, C    : in STD_LOGIC;
	      Q, notQ    : buffer STD_LOGIC );
end Control_SR_Latch;

architecture arch of Control_SR_Latch is

	signal set, reset : std_logic;		-- S and R values
	
	begin
		set <= (S NAND C);
		reset <= (R NAND C);
		
		Q <= (set NAND notQ);  
		notQ <= (reset NAND Q);
		
end arch;