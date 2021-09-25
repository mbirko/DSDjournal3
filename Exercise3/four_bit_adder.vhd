library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;


entity four_bit_adder is
    generic
    (	--	array size paremeter
			DATA_WIDTH : natural := 4
    );
    port
    (	-- name     dir	type					array size, if any
			cin	:	in		std_logic_vector 	( 0 downto 0 );
			a   	:  in 	std_logic_vector	((DATA_WIDTH-1) downto 0);
			b   	:  in 	std_logic_vector	((DATA_WIDTH-1) downto 0);
			sum 	:  out 	std_logic_vector	((DATA_WIDTH-1) downto 0);
			cout 	:	out 	std_logic
    );

end entity;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

architecture unsigned_imp of four_bit_adder is
	signal temp : std_logic_vector (DATA_WIDTH downto 0);
begin 
		-- cast to unsinged, resize to fasilitate carry out
		temp <= std_logic_vector(	resize(unsigned(a), (DATA_WIDTH + 1)) + 
											resize(unsigned(b), (DATA_WIDTH + 1)) + 
											resize(unsigned(cin), (DATA_WIDTH + 1))	);
		-- four bit result on sum
		sum <= temp(DATA_WIDTH-1 downto 0);
		-- carry out to cout
		cout <= temp(DATA_WIDTH);

end;    

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

architecture signed_imp of four_bit_adder is
	signal temp : std_logic_vector (DATA_WIDTH downto 0);
begin    
		-- input array castes til signed og resizes til + 1 af den oprindelige stoerelse.
		-- 
		temp <= std_logic_vector(	resize(signed(a), (DATA_WIDTH + 1)) + 
											resize(signed(b), (DATA_WIDTH + 1)) + 
											resize(signed(cin), (DATA_WIDTH + 1))	);
		-- four bit result on sum									
		sum <= temp((DATA_WIDTH-1) downto 0);
		-- carry out to cout		
		cout <= temp(DATA_WIDTH);
end signed_imp;    
