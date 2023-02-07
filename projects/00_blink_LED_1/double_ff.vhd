library ieee;
use ieee.std_logic_1164.all;

entity double_ff is
    port (
        clk   : in std_logic;
        d_in  : in std_logic;
        d_out : out std_logic
    );
end double_ff;

architecture rtl of double_ff is
    signal temp : std_logic := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            temp <= d_in;
            d_out <= temp;
        end if;
    end process;
end rtl;
