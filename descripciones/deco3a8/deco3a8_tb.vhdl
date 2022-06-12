--------------------------------------------------------------------------------
-- Company: <UNPSJB>
-- Engineer: <ULLOA DANIEL>
--
-- Create Date: 13 agosto, 2021 - 00:25:22 Argentina Standard Time
-- Design Name: <name_of_top-level_design>
-- Component Name: <name_of_this_component>
-- Target Device: <target device>
-- Tool versions: <tool_versions>
-- Description:
--    Testbench para el decodificador
-- Dependencies:
--    <Dependencies here>
-- Revision:
--    <Code_revision_information>
-- Additional Comments:
--    <Additional_comments>
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity deco3a8_tb is
end entity deco3a8_tb;

architecture Test of deco3a8_tb is
-- Declarations (optional)
	component deco3a8 is
		port
		(
		a_i : in std_logic_vector (2 downto 0);
		ena_i : in std_logic;
		y_o : out std_logic_vector (7 downto 0)
		);
	end component deco3a8;
-- Generate Statement (optional)
	signal a_t : std_logic_vector (2 downto 0) := "000";
	signal ena_t : std_logic := '1';
	signal y_t : std_logic_vector (7 downto 0);
begin
-- Process Statement (optional)
-- Concurrent Procedure Call (optional)
-- Concurrent Signal Assignment (optional)
-- Conditional Signal Assignment (optional)
-- Selected Signal Assignment (optional)
-- Component Instantiation Statement (optional)
dut: deco3a8 port map
		(
		a_i => a_t,
		ena_i => ena_t,
		y_o => y_t
		);
Prueba:
	process begin
		report "Verificando el decodificador 3 a 8"
		severity note;

		ena_t <= '0';
		a_t <= "100";
		wait for 1 ns;
		assert y_t = "00000000"
			report "Activa la salida 4 cuando ena=0"
			severity failure;

		ena_t <= '1';
		a_t <= "101";
		wait for 1 ns;
		assert y_t = "00100000"
			report "No ctiva la salida 6 cuando ena=1"
			severity failure;

		ena_t <= '1';
		a_t <= "011";
		wait for 1 ns;
		assert y_t = "00001000"
			report "No activa la salida 3 cuando ena=1"
			severity failure;

		ena_t <= '0';
		for test in 0 to 7 loop
			a_t <= std_logic_vector(to_unsigned(test,3));
			wait for 1 ns;
			assert to_integer(unsigned(y_t)) = 0
				report "Activa la salida " & integer'image(test)& " con ena=0"
				severity failure;
		end loop;

		ena_t <= '1';
		for test in 0 to 7 loop
			a_t <= std_logic_vector(to_unsigned(test,3));
			wait for 1 ns;
			assert to_integer(unsigned(y_t)) = 2**test
				report "No activa la salida " & integer'image(test)& " con ena=1"
				severity failure;
		end loop;

		report "Verificación exitosa!"
		severity note;
		wait;

	end process Prueba;
end Test;
