library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;


entity four_bit_adder_simple is
    generic
    (
        DATA_WIDTH : natural := 4
    );

    port
    (
        a   :   in std_logic_vector(DATA_WIDTH-1) downto 0);
        b   :   in std_logic_vector(DATA_WIDTH-1) downto 0)
        sum :   in std_logic_vector(DATA_WIDTH-1) downto 0)
    );

end entity;
architecture arch of ent is

    signal 

begin

end arch ; -- arch
architecture unsigned_impl of four_bit_adder_simple is
signal temp_a : unsigned ((DATA_WIDTH-1) downto 0);
begin
    temp_a <=unsigned(a);
    sum <= std_logic_vector(temp_a + unsigned(b));

end unsigned_impl;    