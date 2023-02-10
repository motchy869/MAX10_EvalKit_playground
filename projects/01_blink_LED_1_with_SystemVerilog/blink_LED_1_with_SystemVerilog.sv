`default_nettype none

module blink_LED_1_with_SystemVerilog (
    input wire clk,
    input wire rst_async,
    input wire led
);

localparam CLK_FREQ = 50e6; /* 50 MHz */
logic rst_sync;

double_ff double_ff_inst (
    .clk(clk),
    .d_in(rst_async),
    .d_out(rst_sync)
);

clock_divider #(
    .RATE(CLK_FREQ / 2) /* 2 Hz */
) clock_divider_inst (
    .clk_in(clk),
    .rst(rst_sync),
    .clk_out(led)
);

endmodule

`default_nettype wire
