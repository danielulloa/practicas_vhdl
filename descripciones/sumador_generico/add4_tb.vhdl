library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity add4_tb is
end entity add4_tb;
architecture test of add4_tb is
	component add4 is
	port
	(
	a_i : in std_logic_vector (3 downto 0);
	b_i : in std_logic_vector (3 downto 0);
	c_i : in std_logic;
	s_o : out std_logic_vector (3 downto 0);
	c_o : out std_logic
	);
	end component add4;

	signal a_t : std_logic_vector (3 downto 0) := (others=>'0');
	signal b_t : std_logic_vector (3 downto 0) := (others=>'0');
	signal c_it : std_logic := '0';
	signal s_t : std_logic_vector (3 downto 0);
	signal c_ot : std_logic;
	type tabla1 is array (0 to 3) of std_logic_vector(3 downto 0);
	type tabla2 is array (0 to 3) of std_logic;
	constant ESTIMULO_A : tabla1 := ("1000","0101","1100","1010");
	constant ESTIMULO_B : tabla1 := ("0111","0011","0010","1000");
	constant ESTIMULO_CI : tabla2 := ('1','0','1','0');
	constant SUMA : tabla1 := ("0000","1000","1111","0010");
	constant ACARREO : tabla2 := ('1','0','0','1');
begin
dut: add4 port map
	(
	a_i => a_t, b_i => b_t, c_i => c_it, s_o => s_t, c_o=>c_ot
	);
Prueba:
	process begin
		report "Verifying add4"
		severity note;

		for i in tabla1'range loop
			a_t <= ESTIMULO_A(i);
			b_t <= ESTIMULO_B(i);
			c_it <= ESTIMULO_CI(i);
			wait for 1 ns;
			assert s_t = SUMA(i)
				report "Falla la suma para a = " & integer'image(to_integer(unsigned(a_t)))
					& " y b = " & integer'image(to_integer(unsigned(b_t)))
				severity failure;
			assert c_ot = ACARREO(i)
				report "Falla el acarreo para a = " & integer'image(to_integer(unsigned(a_t)))
					& " y b = " & integer'image(to_integer(unsigned(b_t)))
				severity failure;
		end loop;

		report "Success!"
		severity note;
		wait;

	end process Prueba;
end architecture test;
