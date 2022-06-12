-- controlador.vhdl
library ieee;
use ieee.std_logic_1164.all;

entity controlador is
	port
	(
		-- Input ports
	ready, r_w : in std_logic;
	clk, rst: in std_logic;
		-- Output ports
	oe, we : out std_logic

	);
end entity controlador;

architecture fsm of controlador is
	type estado is (start, idle, writing, reading);
	signal actual, sigue : estado;
begin

secuencial:
process(clk)
begin
	if (clk'event and clk='1') then
		if rst='1' then
			actual <= idle;
		else
			actual <= sigue;
		end if;
	end if;
end process secuencial;

combinacional:
process(actual, r_w, ready)
begin
	case actual is
		when idle =>
			oe <= '0';
			we <= '0';
			if (ready = '1') then
				sigue <= start;
			else
				sigue <= idle;
			end if;

		when start =>
			oe <= '0';
			we <= '0';
			if (r_w = '0') then
				sigue <= writing;
			elsif (r_w = '1') then
				sigue <= reading;
			else
				sigue <= idle;
			end if;

		when writing =>
			oe <= '0';
			we <= '1';
			if (ready = '1') then
				sigue <= idle;
			else
				sigue <= writing;
			end if;

		when reading =>
			oe <= '1';
			we <= '0';
			if (ready = '1') then
				sigue <= idle;
			else
				sigue <= reading;
			end if;

		when others =>
			oe <= '0';
			we <= '0';
			sigue <= idle;

		end case;
end process;

end architecture fsm;
