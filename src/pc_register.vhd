library IEEE;
use IEEE.std_logic_1164.all;

entity pc_register is
	port(
		pc_in : in std_logic_vector(31 downto 0);
		pc_reset : in std_logic;
		clk : in std_logic;
		
		pc_out : out std_logic_vector(31 downto 0)
	);

end pc_register;

architecture my_pc_register of pc_register is
begin
	process(pc_reset, clk, pc_in)
	begin
		if (pc_reset = '1') then
			pc_out <= (others => '0');
		elsif (rising_edge(clk)) then
			pc_out <= pc_in;
		end if;

	end process;

end my_pc_register;
