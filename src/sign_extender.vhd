library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity sign_extender is
	port(
		input	: in std_logic_vector(15 downto 0);
		func    : in std_logic_vector(1 downto 0);

		output 	: out std_logic_vector(31 downto 0)
	);
end sign_extender;

architecture my_sign_extender of sign_extender is

begin
	process(input, func)
	begin
		case func is
			-- lui
			when "00" => 
				output <= input(15 downto 0) & "0000000000000000";
			-- slti			
			when "01" =>
				output <= (31 downto 16 => input(15)) & input(15 downto 0);
			-- arithmetic			
			when "10" =>
				output <= (31 downto 16 => input(15)) & input(15 downto 0);
			-- logical			
			when "11" =>
				output <= "0000000000000000" & input(15 downto 0);
			when others =>
		end case;
	end process;
end my_sign_extender;
