library ieee;
use ieee.std_logic_1164.all;

entity CompNANDn is
	generic(N : positive := 4);
	port
	(
		-- Input ports
	entrada_i : in std_logic_vector (N-1 downto 0);
		-- Output ports
	salida_o : out std_logic
	);
end entity CompNANDn;

architecture Algoritmica of CompNANDn is
-- Declarations (optional)
begin
NANDgenerica:
process (entrada_i)
	variable aux : std_logic;
begin
	aux := '0';

	for i in N-1 downto 0 loop
		if entrada_i(i) = '0' then
			aux := '1';
		end if;
	end loop;

	salida_o <= aux;
end process NANDgenerica;
end architecture Algoritmica;
