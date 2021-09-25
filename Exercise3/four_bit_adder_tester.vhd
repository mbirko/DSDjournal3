library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;


--Four_bit_adder "testbench" til test på DE2 board
entity four_bit_adder_tester is
	generic
   (	--	array size paremeter
			DATA_WIDTH : natural := 4
	);	
	port
	(
		-- Input ports
		-- carry in og A og B sker paa switch DATA_WIDTH * 2 til 0. 
		SW	: in  std_logic_vector((DATA_WIDTH * 2) downto 0); 
		-- Output ports
		-- sum og carry bliver vist paa LED DATA_WIDTH til 0
		LEDR	: out std_logic_vector(DATA_WIDTH downto 0) 	
	);															
end four_bit_adder_tester;

architecture implementation of four_bit_adder_tester is

begin

-- direkte instancering af adderen
DUT: entity four_bit_adder(signed_imp)
port map	
	(	
		-- carry in paa switch 0. 
		cin(0) => sw(0),
		-- input A bindes til switches DATA_WIDTH til 1
		a => SW(DATA_WIDTH  downto 1),	 
		-- input B bindes til switches DATA_WIDTH * 2 til DATA_WIDTH + 1
		b => SW((DATA_WIDTH*2) downto (DATA_WIDTH+1)),
		--  sum bindes til LEDer DATA-WIDTH - 1 
		sum => LEDR((DATA_WIDTH - 1) downto 0),		
		-- Carry ud bindes til LED DATA_WIDTH
		cout => LEDR(DATA_WIDTH)
	);	

end implementation;