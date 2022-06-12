library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity add4 is
	port
	(
		-- Input ports
		a_i, b_i: in std_logic_vector(3 downto 0);
		c_i: in std_logic;
		-- Output ports
		s_o : out std_logic_vector(3 downto 0);
		c_o : out std_logic
	);
end entity add4;

architecture estructural of add4 is
	signal c: std_logic_vector(4 downto 0);
begin
	c(0) <= c_i;
--	sum0: entity work.add1 port map(a_i(0), b_i(0), c(0), s_o(0), c(1));
--	sum1: entity work.add1 port map(a_i(1), b_i(1), c(1), s_o(1), c(2));
--	sum2: entity work.add1 port map(a_i(2), b_i(2), c(2), s_o(2), c(3));
--	sum3: entity work.add1 port map(a_i(3), b_i(3), c(3), s_o(3), c(4));
	sum4: for k in 0 to 3 generate
		sum: entity work.add1 port map(a_i(k), b_i(k), c(k), s_o(k), c(k+1));
	end generate;
	c_o <= c(4);
end architecture estructural;
