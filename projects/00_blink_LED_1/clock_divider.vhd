library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_divider is
    generic (
        RATE : positive
    );
    port (
        clk_in  : in std_logic;
        rst     : in std_logic;
        clk_out : out std_logic
    );
end clock_divider;

architecture rtl of clock_divider is
    signal clk_out_i : std_logic := '0';
    signal count : natural range 0 to RATE := 0;
begin
    process(clk_in, rst)
    begin
        if (rst='1') then
            count <= 0;
        elsif rising_edge(clk_in) then
            if (count = RATE - 1) then
                clk_out_i <= not clk_out_i;
                count <= 0;
            else
                count <= count + 1;
            end if;
        end if;
    end process;

    clk_out <= clk_out_i;
end rtl;
