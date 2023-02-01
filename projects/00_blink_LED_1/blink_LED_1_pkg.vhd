library ieee;
use ieee.std_logic_1164.all;

package blink_LED_1_pkg is
    component blink_LED_1 is
        port (
            clk : in std_logic;
            rst : in std_logic;
            led : out std_logic
        );
    end component;
end blink_LED_1_pkg;
