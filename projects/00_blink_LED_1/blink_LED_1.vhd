library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity blink_led_1 is
    generic(
        CLK_FREQ : integer := 50000000 -- 50 MHz
    );
    port(
        clk : in std_logic;
        led : out std_logic
    );
end blink_led_1;

architecture rtl of blink_led_1 is
    signal counter : integer range 0 to CLK_FREQ := 0;
    signal led_i : std_logic := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if (counter >= CLK_FREQ - 1) then
                counter <= 0;
                led_i <= not led_i;
            else
                counter <= counter + 1;
				end if;
        end if;
    end process;

    led <= led_i;
end rtl;
