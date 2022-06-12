library ieee;
use ieee.std_logic_1164.all;

entity add1 is
	port
	(
		-- Input ports
		a_i, b_i, c_i: in std_logic;
		-- Output ports
		s_o, c_o: out std_logic
	);
end entity add1;

architecture concurrente of add1 is
begin
	c_o <= (a_i and b_i) or (a_i and c_i) or (b_i and c_i);
	s_o <= a_i xor b_i xor c_i;
end architecture concurrente;
