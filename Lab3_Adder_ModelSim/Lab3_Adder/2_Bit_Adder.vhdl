-- 1-bit Adder

-- This is just to make a reference to some common things needed.
LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- We declare the 1-bit adder with the inputs and outputs
-- shown inside the port().
-- This will add two bits together(x,y), with a carry in(cin) and 
-- output the sum(sum) and a carry out(cout).
entity BIT_ADDER is
	port( a, b, cin         : in  STD_LOGIC;
	      sum, cout         : out STD_LOGIC );
end BIT_ADDER;

-- This describes the functionality of the 1-BIT adder.
architecture BHV of BIT_ADDER is
begin
	
	-- Calculate the sum of the 1-BIT adder.
	sum <=  (not a and not b and cin) or
			(not a and b and not cin) or
			(a and not b and not cin) or
			(a and b and cin);

	-- Calculates the carry out of the 1-BIT adder.
	cout <= (not a and b and cin) or
			(a and not b and cin) or
			(a and b and not cin) or
			(a and b and cin);
end BHV;


-- Structural description of a 2-bit Adder. This device
-- adds two 2-bit numbers together using two 1-bit adders
-- described above.

-- This is just to make a reference to some common things needed.
LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This describes the black-box view of the component we are
-- designing. The inputs and outputs are again described
-- inside port(). It takes two 2-bit values as input (x and y)
-- and produces a 2-bit output (ANS) and a carry out bit (Cout).

entity add2 is
	port( a, b		: in	STD_LOGIC_VECTOR(1 downto 0);
	      ans		: out	STD_LOGIC_VECTOR(1 downto 0);
	      cout		: out	STD_LOGIC		);
end add2;

-- Although we have already described the inputs and outputs,
-- we must now describe the functionality of the adder (ie:
-- how we produced the desired outputs from the given inputs).

architecture STRUCTURE of add2 is

-- We are going to need two 1-bit adders, so include the
-- design that we have already done above.

component BIT_ADDER
	port( a, b, cin		: in  STD_LOGIC;
	      sum, cout		: out STD_LOGIC );
end component;

-- Now create the signals which are going to be necessary
-- to pass the outputs of one adder to the inputs of the next
-- in the sequence.
signal c0, c1 : STD_LOGIC;
begin

c0 <= '0';
b_adder0: BIT_ADDER port map (a(0), b(0), c0, ans(0), c1);
b_adder1: BIT_ADDER port map (a(1), b(1), c1, ans(1), cout);

END STRUCTURE;