library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;


entity four_bit_adder is
    generic
    (
        DATA_WIDTH : natural := 4
    );
    port
    (
			cin	:	in	std_logic_vector ( 0 downto 0 );
			a   	:  in std_logic_vector((DATA_WIDTH-1) downto 0);
			b   	:  in std_logic_vector((DATA_WIDTH-1) downto 0);
			sum 	:  out std_logic_vector((DATA_WIDTH-1) downto 0);
			cout 	:	out std_logic
    );

end entity;



architecture signed_imp of four_bit_adder is
signal temp : std_logic_vector (DATA_WIDTH downto 0);
begin    
		
		temp <= std_logic_vector(resize(signed(a),5) + resize(signed(b),5) + resize(signed(cin),5));
		sum <= temp(DATA_WIDTH-1 downto 0);
		cout <= temp(DATA_WIDTH);
end signed_imp;    
