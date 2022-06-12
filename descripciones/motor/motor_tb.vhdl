library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity motor_tb is
end entity motor_tb;
architecture test of motor_tb is
	component motor is
	port
	(
	a_i : in std_logic;
	clk : in std_logic;
	b_o : out std_logic
	);
	end component motor;

	signal a_t : std_logic := '1';
	signal b_t : std_logic;
	signal clk_t : std_logic := '1';
	constant FRECUENCIA : integer := 50;
	constant PERIODO : time := 1 us/FRECUENCIA;
	signal detener : boolean := false;

begin
dut: motor port map
	(
	a_i => a_t, clk => clk_t, b_o => b_t
	);

reloj:
process begin
	clk_t <= '1', '0' after PERIODO/2;
	wait for PERIODO;
	if detener then
		wait;
	end if;
end process reloj;

Prueba:
	process begin
		report "Verificando motor" severity note;

		a_t <= '0';
		wait for 5 ns;
		wait until rising_edge(clk_t);
		wait for 5 ns;

		report "Estado A2" severity note;
		a_t <= '1';
		wait for 5 ns;
		wait until rising_edge(clk_t);
		wait for 5 ns;
		assert b_t = '0'
		report "Falla transicion al estado E1" severity note;

		report "Estado E1" severity note;
		a_t <= '1';
		wait for 5 ns;
		wait until rising_edge(clk_t);
		wait for 5 ns;
		assert b_t = '0'
		report "Falla transicion al estado A1" severity note;

		report "Estado A1" severity note;
		a_t <= '1';
		wait for 5 ns;
		wait until rising_edge(clk_t);
		wait for 5 ns;
		assert b_t = '1'
		report "Falla transicion al estado A2" severity note;

		report "Estado A2" severity note;
		a_t <= '1';
		wait for 5 ns;
		wait until rising_edge(clk_t);
		wait for 5 ns;
		assert b_t = '0'
		report "Falla transicion al estado E1" severity note;


		report "Success!" severity note;
		detener <= true;
		wait;
	end process Prueba;
end architecture test;
