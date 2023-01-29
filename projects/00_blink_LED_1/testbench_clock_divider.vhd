library ieee;
use ieee.std_logic_1164.all;

library work;
use work.clock_divider_pkg.all;

entity testbench_clock_divider is
end testbench_clock_divider;

architecture behavioral of testbench_clock_divider is
    constant CLK_PERIOD : time := 20 ns;

    -- signals for the simulation target
    signal clk_in_intern  : std_logic := '0';
    signal rst_intern     : std_logic := '0';
    signal clk_out_intern : std_logic := '0';
begin
    -- Instantiate the target.
    clock_divider_inst : entity work.clock_divider
        generic map (
            RATE => 4
        )
        port map (
            clk_in  => clk_in_intern,
            rst     => rst_intern,
            clk_out => clk_out_intern
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

configuration cfg_testbench_clock_divider of testbench_clock_divider is
    for behavioral
    end for;
end cfg_testbench_clock_divider;
