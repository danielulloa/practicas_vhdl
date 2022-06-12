--------------------------------------------------------------------------------
-- Company: <UNPSJB>
-- Engineer: <ULLOA DANIEL>
--
-- Create Date: 13 agosto, 2021 - 17:47:46 Argentina Standard Time
-- Design Name: <name_of_top-level_design>
-- Component Name: <name_of_this_component>
-- Target Device: <target device>
-- Tool versions: <tool_versions>
-- Description:
--    Multiplexor de 4 canales
-- Dependencies:
--    <Dependencies here>
-- Revision:
--    <Code_revision_information>
-- Additional Comments:
--    <Additional_comments>
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity mux4 is
	port
	(
		-- Input ports
		i_i : in std_logic_vector (3 downto 0);
		sel_i : in std_logic_vector (1 downto 0);
		-- Output ports
		y_o : out std_logic
	);
end entity mux4;
architecture Tabla of mux4 is
-- Declarations (optional)
begin
-- Process Statement (optional)
-- Concurrent Procedure Call (optional)
-- Concurrent Signal Assignment (optional)
-- Conditional Signal Assignment (optional)
-- Selected Signal Assignment (optional)
-- Component Instantiation Statement (optional)
-- Generate Statement (optional)
	with sel_i select
		y_o <= 	i_i(0) when "00",
			i_i(1) when "01",
			i_i(2) when "10",
			i_i(3) when others;
			--'0' when others;

end architecture Tabla;
