library ieee;
use ieee.std_logic_1164.all;

library work;
use work.double_ff_pkg.all;
use work.clock_divider_pkg.all;

entity blink_led_1 is
    port (
        clk       : in std_logic;
        rst_async : in std_logic;
        led       : out std_logic
    );
end blink_led_1;

architecture rtl of blink_led_1 is
    constant CLK_FREQ : integer := 50e6; -- 50 MHz
    signal rst_sync : std_logic;
begin
    double_ff_inst : entity work.double_ff
        port map (
            clk   => clk,
            d_in  => rst_async,
            d_out => rst_sync
        );
    clock_divider_inst : entity work.clock_divider
        generic map (
            RATE => CLK_FREQ / 2 -- 2 Hz
        )
        port map (
            clk_in  => clk,
            rst     => rst_sync,
            clk_out => led
        );
end rtl;
