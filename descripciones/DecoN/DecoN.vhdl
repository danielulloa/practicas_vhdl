library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DecoN is
	generic(N: positive :=3);
	port
	(
		-- Input ports
	a_i : in std_logic_vector (N-1 downto 0);
	ena_i : in std_logic;
		-- Output ports
	y_o : out std_logic_vector (2**N-1 downto 0)
	);
end entity DecoN;

architecture Proceso of DecoN is
-- Declarations (optional)
begin

-- proceso implicito
--	y_o <= (others => '0');
--	y_o(to_integer(unsigned(a_i))) <= ena_i;
-- no es posible porque se estaría cambiando de manear simultanea una salida a 0 y 1
-- proceso explicito
	process (a_i, ena_i) begin
		y_o <= (others => '0');
		y_o(to_integer(unsigned(a_i))) <= ena_i;
	end process;
end architecture Proceso;
