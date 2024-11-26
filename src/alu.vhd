library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

--should have a fixed STL

entity alu is
	port(
		x, y : in std_logic_vector(31 downto 0);
		add_sub : in std_logic ; 
			-- 0 = add, 1 = sub
		logic_func : in std_logic_vector(1 downto 0) ;
			-- 00 AND, 01 OR, 10 XOR, 11 NOR
		func : in std_logic_vector(1 downto 0) ; 
			-- 00 = lui, 01 = setless, 10 = arith, 11 = logic
		
		output : out std_logic_vector(31 downto 0);
		overflow : out std_logic;
		zero : out std_logic 
	); 

end;

architecture my_alu of alu is

	signal logic_unit_output : std_logic_vector(31 downto 0);
	signal add_sub_unit_output : std_logic_vector(31 downto 0);	

begin


	-- ADD SUBTRACT UNIT
	with add_sub select
		add_sub_unit_output <=	(x + y) when '0',
					(x - y) when others;
 


	-- ADD SUB OVERFLOW LOGIC AND ZERO
	process(x(31), y(31), add_sub, add_sub_unit_output)
		variable add_overflow_input : std_logic_vector(3 downto 0); 
	begin
		add_overflow_input := x(31) & y(31) & add_sub_unit_output(31) & add_sub;
		
		case add_overflow_input is
			when "0010" =>
				overflow <= '1';
			when "1100" =>
				overflow <= '1';
			when "0111" =>
				overflow <= '1';
			when "1001" =>
				overflow <= '1';
			when others =>
				overflow <= '0';
		end case;

		--not sure if i should put a zero case for "1000...000" (negative all 0's)
		case add_sub_unit_output is
			when "00000000000000000000000000000000" =>
				zero <= '1';
			when others =>
				zero <= '0';
		end case;
	end process;
	


	-- LOGIC UNIT
	with logic_func select
		logic_unit_output <=    (x and y) when "00",
			  		(x or y)  when "01",
			  		(x xor y) when "10", -- 11-12, changed NOR to XOR
			  		(x nor y) when others;
	
	-- MULTIPLEXER
	process(func, add_sub_unit_output, logic_unit_output, y)
	begin
	    case func is
		when "00" => 
		    -- LUI
		    output <= y(31 downto 0);
		when "01" =>
		    -- STL (Set Less Than)
			if add_sub_unit_output(31) = '1' then
		            output <= "10000000000000000000000000000000";
		        else
		            output <= (others => '0');
		        end if;
		when "10" =>
		    -- ADD/SUB
		    output <= add_sub_unit_output;
		when others =>
		    -- Default case, logic unit output
		    output <= logic_unit_output;
	    end case;
	end process;




end my_alu;
