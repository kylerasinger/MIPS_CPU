library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity data_cache is
	port(
		data_in		: in std_logic_vector(31 downto 0);
	    	dc_reset     	: in std_logic;
	    	clk       	: in std_logic;
	    	address  	: in std_logic_vector(4 downto 0);
	    	data_write	: in std_logic;
 
	    	data_out     	: out std_logic_vector(31 downto 0)
	);
end data_cache;

architecture my_data_cache of data_cache is

	type memory_array is array(0 to 31) of std_logic_vector(31 downto 0);
	signal data_cache : memory_array := (others => (others => '0'));

begin
	data_out <= data_cache(to_integer(unsigned(address)));

	process(clk, dc_reset)
	begin
		if(dc_reset ='1') then
			for i in data_cache'range loop
				data_cache(i) <= (others => '0');
			end loop;
		elsif (rising_edge(clk)) then
			if(data_write = '1') then
				data_cache(to_integer(unsigned(address))) <= data_in;
			end if;
		end if;
	end process;

end my_data_cache;
