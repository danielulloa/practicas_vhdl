-- Fecha: robot.vhdl
-- Author: Daniel
-- Date: 04 abril, 2022 - 20:44:56 Argentina Standard Time
library ieee;
use ieee.std_logic_1164.all;

entity robot is
	port
	(
		-- Input ports
	d_i, i_i, a_i, r_i, p_i, b_i : in std_logic;
	clk, rst_i: in std_logic;
		-- Output ports
	d_o, i_o, a_o, r_o, p_o, b_o : out std_logic

	);
end entity robot;

architecture fsm of robot is
	type estado is (d, i, a, r, p, b);
	signal actual, sigue : estado;
begin

secuencial:
process(clk)
begin
	if (clk'event and clk='1') then
		if rst_i='1' then
			actual <= p;
		else
			actual <= sigue;
		end if;
	end if;
end process secuencial;

combinacional:
process(actual, d_i, i_i, a_i, r_i, p_i, b_i)
begin
	case actual is
		when d =>
			r_o<= '0'; i_o<= '0'; a_o<= '0'; p_o<= '0'; b_o<= '0';
			d_o <= '1';
			if (b_i = '0') then
				sigue <= p;
			elsif (a_i = '1') then
				sigue <= a;
			elsif (i_i = '1') then
				sigue <= i;
			elsif (r_i = '1') then
				sigue <= r;
			elsif (p_i = '1') then
				sigue <= p;
			else
				sigue <= d;
			end if;

		when a =>
			d_o<= '0'; i_o<= '0'; r_o<= '0'; p_o<= '0'; b_o<= '0';
			a_o <= '1';
			if (b_i = '0') then
				sigue <= p;
			elsif (d_i = '1') then
				sigue <= d;
			elsif (i_i = '1') then
				sigue <= i;
			elsif (r_i = '1') then
				sigue <= r;
			elsif (p_i = '1') then
				sigue <= p;
			else
				sigue <= a;
			end if;

		when i =>
			d_o<= '0'; r_o<= '0'; a_o<= '0'; p_o<= '0'; b_o<= '0';
			i_o <= '1';
			if (b_i = '0') then
				sigue <= p;
			elsif (a_i = '1') then
				sigue <= a;
			elsif (d_i = '1') then
				sigue <= d;
			elsif (r_i = '1') then
				sigue <= r;
			elsif (p_i = '1') then
				sigue <= p;
			else
				sigue <= i;
			end if;

		when r =>
			d_o<= '0'; i_o<= '0'; a_o<= '0'; p_o<= '0'; b_o<= '0';
			r_o <= '1';
			if (b_i = '0') then
				sigue <= p;
			elsif (d_i = '1') then
				sigue <= d;
			elsif (i_i = '1') then
				sigue <= i;
			elsif (a_i = '1') then
				sigue <= a;
			elsif (p_i = '1') then
				sigue <= p;
			else
				sigue <= r;
			end if;

		when p =>
			d_o<= '0'; i_o<= '0'; a_o<= '0'; r_o<= '0'; b_o<= '0';
			p_o <= '1';
			if (b_i = '0') then
				sigue <= b;
			elsif (d_i = '1') then
				sigue <= d;
			elsif (i_i = '1') then
				sigue <= i;
			elsif (r_i = '1') then
				sigue <= r;
			elsif (a_i = '1') then
				sigue <= a;
			else
				sigue <= p;
			end if;

		when b =>
			d_o<= '0'; i_o<= '0'; a_o<= '0'; r_o<= '0'; p_o<= '0';
			b_o <= '1';
			if (b_i = '1') then
				sigue <= p;
			else
				sigue <= b;
			end if;

		when others =>
			d_o<= '0'; i_o<= '0'; a_o<= '0'; r_o<= '0'; b_o<= '0';
			p_o <= '1';
			sigue <= p;

		end case;
end process;

end architecture fsm;
