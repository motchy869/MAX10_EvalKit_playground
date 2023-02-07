library ieee;
use ieee.std_logic_1164.all;

package double_ff_pkg is
    component double_ff is
        port (
            clk   : in std_logic;
            d_in  : in std_logic;
            d_out : out std_logic
        );
    end component;
end double_ff_pkg;
