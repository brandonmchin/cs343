Library ieee;
Use ieee.std_logic_1164.all;

Entity Test_two_bit_equal is
End Test_two_bit_equal;

Architecture arch_test of test_two_bit_equal is
component two_bit_equal_port		-- MODIFIED
Port (
a, b: in std_logic_vector(1 downto 0);
aeqb : out std_logic);
End component;

Signal p1, p0 : std_logic_vector(1 downto 0);
Signal pout : std_logic;
Signal error : std_logic := '0';
begin
uut: two_bit_equal_port port map(a => p0, b => p1, aeqb => pout);	--MODIFIED
process
begin
p0 <= "00";
p1 <= "00";
wait for 1 ns;
if (pout = '0') then
 error <= '1';
end if;
wait for 200 ns;
p0 <= "01";
p1 <= "00";
wait for 1 ns;
if (pout = '1') then
 error <= '1';
end if;
wait for 200 ns;
p0 <= "01";
p1 <= "11";
wait for 1 ns;
if (pout = '1') then
 error <= '1';
end if;
wait for 200 ns;
p0 <= "11";
p1 <= "00";
wait for 1 ns;
if (pout = '1') then
 error <= '1';
end if;
wait for 200 ns;
p0 <= "11";
p1 <= "11";
wait for 1 ns;
if (pout = '0') then
 error <= '1';
end if;
wait for 200 ns;
p0 <= "10";
p1 <= "11";
wait for 1 ns;
if (pout = '1') then
 error <= '1';
end if;
wait for 200 ns;
p0 <= "10";
p1 <= "10";
wait for 1 ns;
if (pout = '0') then
 error <= '1';
end if;
wait for 200 ns;
p0 <= "11";
p1 <= "01";
wait for 1 ns;
if (pout = '1') then
 error <= '1';
end if;
wait for 200 ns;

if (error = '0') then
 report "No errors detected. Simulation successful" severity
failure;
else
 report "Error detected" severity failure;
end if;

end process;
End arch_test;