library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux4_tb is
end entity mux4_tb;

architecture Test of mux4_tb is
-- Component Instantiation Statement (optional)
	component mux4 is
		port
		(
			i_i : in std_logic_vector (3 downto 0);
			sel_i : in std_logic_vector (1 downto 0);
			y_o : out std_logic
		);
	end component mux4;
-- Signal Assignment (optional)
	signal i_t : std_logic_vector (3 downto 0) := "0000";
	signal sel_t : std_logic_vector (1 downto 0) := "00";
	signal y_t : std_logic;
begin
-- Process Statement (optional)
dut: mux4 port map
	(
		i_i => i_t,
		sel_i => sel_t,
		y_o => y_t
	);

Prueba:
	process begin
		report "Verificando el multiplexor..."
		severity note;

		i_t <= "1010";
		sel_t <= "10";
		wait for 1 ns;
		assert y_t = '0'
			report "falla para sel=2 e i=1010"
			severity failure;
		report "paso al loop"
		severity note;
		for j in 0 to 15 loop
			i_t <= std_logic_vector(to_unsigned(j,4));
			for i in 0 to 3 loop
				sel_t <= std_logic_vector(to_unsigned(i,2));
				wait for 1 ns;
				assert y_t = i_t(i)
					report "falla para sel= " & integer'image(i) & " e i = " & integer'image(j)
					severity failure;
			end loop;
		end loop;
		report "verificación exitosa!"
		severity note;
		wait;
	end process Prueba;
end architecture Test;
