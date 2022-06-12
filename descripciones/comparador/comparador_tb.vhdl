library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparador_tb is
end entity comparador_tb;
architecture test of comparador_tb is
	component comparador is
	port
	(
	a_i : in std_logic_vector (15 downto 0);
	b_i : in std_logic_vector (15 downto 0);
	amenorb : out std_logic;
	aigualb : out std_logic;
	amayorb : out std_logic
	);
	end component comparador;

	signal a_t : std_logic_vector (15 downto 0) := "0000000000000000";
	signal b_t : std_logic_vector (15 downto 0) := "0000000000000000";
	signal amenorb_t : std_logic;
	signal aigualb_t : std_logic;
	signal amayorb_t : std_logic;
begin
dut: comparador port map
	(
	a_i => a_t, b_i => b_t, amenorb => amenorb_t, aigualb => aigualb_t, amayorb => amayorb_t
	);
Prueba:
	process begin
		report "Verificando comparador"	severity note;

		report " a = 0xff, b = 0x0" severity note;
		a_t <= "1111111111111111";
		b_t <= "0000000000000000";
		wait for 1 ns;
		assert amenorb_t = '0'
			report "falla para a_t = 0xff y b = 0x0" severity failure;
		assert amayorb_t = '1'
			report "falla para a_t = 0xff y b = 0x0" severity failure;
		assert aigualb_t = '0'
			report "falla para a_t = 0xff y b = 0x0" severity failure;

		report " a = 0xff, b = 0xff" severity note;
		a_t <= "1111111111111111";
		b_t <= "1111111111111111";
		wait for 1 ns;
		assert amenorb_t = '0'
			report "falla para a_t = 0x0 y b = 0x0" severity failure;
		assert amayorb_t = '0'
			report "falla para a_t = 0x0 y b = 0x0" severity failure;
		assert aigualb_t = '1'
			report "falla para a_t = 0x0 y b = 0x0" severity failure;

		report " a = 0x0, b = 0xff" severity note;
		a_t <= "0000000000000000";
		b_t <= "1111111111111111";
		wait for 1 ns;
		assert amenorb_t = '1'
			report "falla para a_t = 0x0 y b = 0x0" severity failure;
		assert amayorb_t = '0'
			report "falla para a_t = 0x0 y b = 0x0" severity failure;
		assert aigualb_t = '0'
			report "falla para a_t = 0x0 y b = 0x0" severity failure;


		report "Success!"
		severity note;
		wait;
	end process Prueba;
end architecture test;
