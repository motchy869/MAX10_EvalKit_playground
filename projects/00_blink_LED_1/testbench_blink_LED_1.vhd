library ieee;
use ieee.std_logic_1164.all;

library work;
use work.blink_LED_1_pkg.all;

entity testbench_blink_LED_1 is
end testbench_blink_LED_1;

architecture behavioral of testbench_blink_LED_1 is
    constant CLK_PERIOD : time := 20 ns; -- 50 MHz

    -- signals for the simulation target
    signal clk_in_intern : std_logic := '0';
    signal rst_intern    : std_logic := '0';
    signal led_intern    : std_logic := '0';
begin
    -- Instantiate the target.
    blink_LED_1_inst : entity work.blink_LED_1
        port map (
            clk       => clk_in_intern,
            rst_async => rst_intern,
            led       => led_intern
        );

    -- Generate clock.
    process
    begin
        clk_in_intern <= '1';
        wait for CLK_PERIOD / 2;
        clk_in_intern <= '0';
        wait for CLK_PERIOD / 2;
    end process;

    -- Simulate reset.
    process
    begin
        rst_intern <= '0';
        wait for 2.75 * CLK_PERIOD;
        rst_intern <= '1';
        wait for 3 * CLK_PERIOD;
        rst_intern <= '0';
        wait;
    end process;
end behavioral;
