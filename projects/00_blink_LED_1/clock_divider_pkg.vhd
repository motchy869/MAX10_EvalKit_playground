library ieee;
use ieee.std_logic_1164.all;

package clock_divider_pkg is
    component clock_divider is
        generic (
            RATE : positive
        );
        port (
            clk_in    : in std_logic;
            rst_async : in std_logic;
            clk_out   : out std_logic
        );
    end component;
end clock_divider_pkg;
