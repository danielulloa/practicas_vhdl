-- Fecha: motor.vhdl
-- Author: Daniel
-- Date: 28 marzo, 2022 - 22:13:22 Argentina Standard Time
library ieee;
use ieee.std_logic_1164.all;

entity motor2 is
	port
	(
		-- Input ports
	a_i : in std_logic;
	clk : in std_logic;
	rst_i : in std_logic;
		-- Output ports
	b_o : out std_logic
	);
end entity motor2;

architecture fsm of motor2 is
-- Declarations (optional)
	type estado is (E1, A1, A2);
	signal actual, sigue : estado;
begin

secuencial:
process(clk)
begin
	if (clk'event and clk='1') then
		if rst_i='1' then
			actual <= A2;
		else
			actual <= sigue;
		end if;
	end if;
end process secuencial;

combinacional:
process(actual, a_i)
begin
	case actual is
		when E1 =>
			b_o <= '1';
			if (a_i = '1') then
				sigue <= A1;
			else
				sigue <= E1;
			end if;
		when A1 =>
			b_o <= '0';
			if (a_i = '1') then
				sigue <= A2;
			else
				sigue <= A1;
			end if;
		when A2 =>
			b_o <= '0';
			if (a_i = '1') then
				sigue <= E1;
			else
				sigue <= A2;
			end if;
		when others =>
			b_o <= '0';
			sigue <= A2;
		end case;
end process;

end architecture fsm;
