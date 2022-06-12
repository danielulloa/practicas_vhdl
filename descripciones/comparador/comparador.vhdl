-- Fecha: comparador.vhdl
-- Author: Daniel
-- Date: 28 marzo, 2022 - 18:29:38 Argentina Standard Time 
library ieee;
use ieee.std_logic_1164.all;

entity comparador is
	port
	(
		-- Input ports
	a_i, b_i : in std_logic_vector (15 downto 0);
		-- Output ports
	amenorb, aigualb, amayorb : out std_logic	
	);
end entity comparador;

architecture arq of comparador is
-- Declarations (optional)
begin
	amenorb <= '1' when a_i < b_i else '0';
	aigualb <= '1' when a_i = b_i else '0';
	amayorb <= '1' when a_i > b_i else '0';
end architecture arq;
