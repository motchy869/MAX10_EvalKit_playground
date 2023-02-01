library ieee;
use ieee.std_logic_1164.all;

library work;
use work.clock_divider_pkg.all;

entity blink_led_1 is
    port (
        clk : in std_logic;
        rst : in std_logic;
        led : out std_logic
    );
end blink_led_1;

architecture rtl of blink_led_1 is
    constant CLK_FREQ : integer := 50e6; -- 50 MHz
begin
    clock_divider_inst : entity work.clock_divider
        generic map (
            RATE => CLK_FREQ / 2 -- 2 Hz
        )
        port map (
            clk_in  => clk,
            rst     => rst,
            clk_out => led
        );
end rtl;
