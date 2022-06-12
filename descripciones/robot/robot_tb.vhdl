-- Fecha: robot_tb.vhdl
-- Author: Daniel
-- Date: 04 abril, 2022 - 21:45:15 Argentina Standard Time
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity robot_tb is
end entity robot_tb;
architecture test of robot_tb is
	component robot is
	port
	(
	d_i, i_i, a_i, r_i, p_i, b_i : in std_logic;
	clk, rst_i : in std_logic;
	d_o, i_o, a_o, r_o, p_o, b_o : out std_logic
	);
	end component robot;

	signal di_t : std_logic := '0';
	signal ii_t : std_logic := '0';
	signal ai_t : std_logic := '0';
	signal ri_t : std_logic := '0';
	signal pi_t : std_logic := '0';
	signal bi_t : std_logic := '1';
	signal do_t : std_logic;
	signal io_t : std_logic;
	signal ao_t : std_logic;
	signal ro_t : std_logic;
	signal po_t : std_logic;
	signal bo_t : std_logic;
	signal clk_t : std_logic := '1';
	signal rst_t : std_logic := '1';
	constant FRECUENCIA : integer := 50;
	constant PERIODO : time := 1 us/FRECUENCIA;
	signal detener : boolean := false;

begin
dut: robot port map
	(
	clk => clk_t,
	rst_i => rst_t,
	d_i => di_t,
	i_i => ii_t,
	a_i => ai_t,
	r_i => ri_t,
	p_i => pi_t,
	b_i => bi_t,
	d_o => do_t,
	i_o => io_t,
	a_o => ao_t,
	r_o => ro_t,
	p_o => po_t,
	b_o => bo_t
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


		report "Verificando robot" severity note;

		-- prueba estado inicial
		-- resetea maquina

		rst_t <= '1';
		wait for PERIODO;
		wait for 2 ns;
		rst_t <= '0';
		wait for PERIODO;
		wait until rising_edge(clk_t);
		assert po_t = '1'
			report "Falla estado inicial P" severity note;
		wait for PERIODO;

		-- prueba pasa a estado B

		bi_t <= '0';
		wait for 2 ns;
		wait for PERIODO;
		wait until rising_edge(clk_t);
		assert bo_t = '1'
			report "Falla transicion P->B" severity note;
		wait for 2 ns;
		wait for PERIODO;

		-- prueba bateria baja

		bi_t <= '1';
		wait until rising_edge(clk_t);
		wait for 2 ns;
		assert po_t = '1'
			report "Falla transicion P->B" severity note;
		wait for 2 ns;
		wait for PERIODO;

		-- prueba avanzar

		ai_t <= '1';
		wait until rising_edge(clk_t);
		wait for 2 ns;
		assert ao_t = '1'
			report "Falla transicion P->A" severity note;
		wait for 2 ns;
		wait for PERIODO;

		-- prueba avanzar sin entrada
		ai_t <= '0';
		wait until rising_edge(clk_t);
		wait for 2 ns;
		assert ao_t = '1'
			report "Falla mantener A" severity note;
		wait for 2 ns;
		wait for PERIODO;

		-- prueba bateria
		bi_t <= '0';
		wait until rising_edge(clk_t);
		wait for 2 ns;
		assert po_t = '1'
			report "Falla transicion A->P" severity note;
		wait for 2 ns;
		wait for PERIODO;
		assert bo_t = '1'
			report "Falla transicion P->B" severity note;
		wait for 2 ns;
		wait for PERIODO;

		report "Success!" severity note;
		detener <= true;
		wait;
	end process Prueba;
end architecture test;
