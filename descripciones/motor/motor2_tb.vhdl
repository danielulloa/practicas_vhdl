library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity motor2_tb is
end entity motor2_tb;
architecture test of motor2_tb is
	component motor2 is
	port
	(
	a_i : in std_logic;
	clk : in std_logic;
	rst_i : in std_logic;
	b_o : out std_logic
	);
	end component motor2;

	signal a_t : std_logic := '0';
	signal b_t : std_logic;
	signal clk_t : std_logic := '1';
	signal rst_t : std_logic := '1';
	constant FRECUENCIA : integer := 50;
	constant PERIODO : time := 1 us/FRECUENCIA;
	signal detener : boolean := false;

begin
dut: motor2 port map
	(
	a_i => a_t, clk => clk_t, b_o => b_t, rst_i => rst_t
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


		report "Verificando motor2" severity note;

		-- prueba estado inicial
		-- resetea maquina

		rst_t <= '1';
		wait for PERIODO;
		wait for 2 ns;
		rst_t <= '0';
		wait for PERIODO;
		wait until rising_edge(clk_t);
		wait for 2 ns;
		assert b_t = '0'
			report "Falla estado inicial A2" severity note;
		wait for PERIODO;

		-- prueba pasa a estado

		a_t <= '1';
		wait until rising_edge(clk_t);
		wait for 2 ns;
		assert b_t = '1'
			report "Falla transicion A2 -> E1" severity note;
	--	wait for 2 ns;
	--	wait for PERIODO;

		a_t <= '0';
		wait until rising_edge(clk_t);
		wait for 2 ns;
		assert b_t = '1'
			report "Falla mantener estado E1" severity note;
	--	wait for 2 ns;
	--	wait for PERIODO;

		a_t <= '1';
		wait until rising_edge(clk_t);
		wait for 2 ns;
		assert b_t = '0'
			report "Falla transicion E1->A1" severity note;
		wait until rising_edge(clk_t);
		wait for 2 ns;
		assert b_t = '0'
			report "Falla transicion A1->A2" severity note;
		wait for 2 ns;
		wait for PERIODO;

		report "Success!" severity note;
		detener <= true;
		wait;
	end process Prueba;
end architecture test;
