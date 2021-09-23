library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;


--Four_bit_adder "testbench" til test på DE2 board
entity four_bit_adder_simple_tester is

	port
	(
		-- Input ports
		SW	: in  std_logic_vector(8 downto 1); 	-- Der bruges 2 x 4 switches til 
																-- de to 4-bit tal A og B og 1 switch til carry ind 		
		-- Output ports
		LEDR	: out std_logic_vector(4 downto 1) 	-- Der bruges 4 LEDer til 4-bit tal sum 
	);															-- Der bruges 1 LED til carry out
end four_bit_adder_simple_tester;

architecture implementation of four_bit_adder_simple_tester is

begin

-- direkte instancering af 4-bit adderen
DUT: entity four_bit_adder_simple

port map	
	(	
		a => SW( 4 downto 1),	-- 4-bit tal A bindes til switches 4, 3, 2 og 1 
		b => SW(8 downto 5),		-- 4-bit tal B bindes til switches 8, 7, 6 og 5
		sum => LEDR(4 downto 1)-- 4-bit tal sum bindes til LEDer 3, 3, 1 og 0	Cout => LEDR(4)			-- Carry ud bindes til LED 4
		
	);	

end implementation;