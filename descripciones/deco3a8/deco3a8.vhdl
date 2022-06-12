--------------------------------------------------------------------------------
-- Company: <UNPSJB>
-- Engineer: <ULLOA DANIEL>
--
-- Create Date: 13 agosto, 2021 - 00:22:02 Argentina Standard Time
-- Design Name: <name_of_top-level_design>
-- Component Name: <name_of_this_component>
-- Target Device: <target device>
-- Tool versions: <tool_versions>
-- Description:
--    Decodificador de 8 salidas y tres entradas
-- Dependencies:
--    <Dependencies here>
-- Revision:
--    <Code_revision_information>
-- Additional Comments:
--    <Additional_comments>
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity deco3a8 is
	port
	(
		-- Input ports
		a_i : in std_logic_vector (2 downto 0);
		ena_i : in std_logic;
		-- Output ports
		y_o : out std_logic_vector (7 downto 0)
	);
end entity deco3a8;
architecture Tabla of deco3a8 is
-- Declarations (optional)
	signal auxY : std_logic_vector (7 downto 0);
begin
-- Process Statement (optional)
-- Concurrent Procedure Call (optional)
-- Concurrent Signal Assignment (optional)
-- Conditional Signal Assignment (optional)
-- Selected Signal Assignment (optional)
-- Component Instantiation Statement (optional)
-- Generate Statement (optional)
	with a_i select
		auxY <= "00000001" when "000",
			"00000010" when "001",
			"00000100" when "010",
			"00001000" when "011",
			"00010000" when "100",
			"00100000" when "101",
			"01000000" when "110",
			"10000000" when "111",
			"00000000" when others;
	y_o <= auxY when ena_i = '1' else
		(others => '0');
end architecture Tabla;
