-- Fecha: motor.vhdl
-- Author: Daniel
-- Date: 28 marzo, 2022 - 22:13:22 Argentina Standard Time
library ieee;
use ieee.std_logic_1164.all;

entity motor is
	port
	(
		-- Input ports
	a_i : in std_logic;
	clk : in std_logic;
		-- Output ports
	b_o : out std_logic
	);
end entity motor;

architecture fsm of motor is
-- Declarations (optional)
	type estado is (E1, A1, A2);
	signal actual : estado;
begin

secuencial:
process(clk)
begin
	if (clk'event and clk='1') then
		case actual is
			when E1 =>
				if (a_i = '1') then
					actual <= A1;
					b_o <= '0';
				end if;
			when A1 =>
				if (a_i = '1') then
					actual <= A2;
					b_o <= '0';
				end if;
			when A2 =>
				if (a_i = '1') then
					actual <= E1;
					b_o <= '1';
				end if;
			when others =>
				actual <= A2;
				b_o <= '0';
		end case;
	end if;
end process;


end architecture fsm;
