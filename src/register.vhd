library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

entity regfile is
	port( 
		din : in std_logic_vector(31 downto 0);				--data to be written
		reg_reset : in std_logic; 								--sets all to 0 when == 1
		clk : in std_logic;
		write : in std_logic;								--writes to write_address (sync)
		read_a : in std_logic_vector(4 downto 0);			--address for out_a reg (async)
		read_b : in std_logic_vector(4 downto 0);			--address for out_b reg (async)
		write_address : in std_logic_vector(4 downto 0);	--address for din to be written to (sync)

		out_a : out std_logic_vector(31 downto 0);
		out_b : out std_logic_vector(31 downto 0)
	);
end regfile ;

architecture my_regfile of regfile is 

	--an array of size 32 of 32bit std_logic_vectors
	type register_array is array(0 to 31) of std_logic_vector(31 downto 0);

	--register output signal, initialized to 0
	signal registers : register_array := (others => (others => '0'));
begin

	
		
		out_a <= registers(to_integer(unsigned(read_a)));
		out_b <= registers(to_integer(unsigned(read_b)));

		process(clk, reg_reset)
		begin
		    if reg_reset = '1' then
                    registers <= (others => (others => '0'));
            elsif rising_edge(clk) then
				if write = '1' then
					registers(to_integer(unsigned(write_address))) <= din;
				end if;
			end if;
		end process;


end my_regfile;
