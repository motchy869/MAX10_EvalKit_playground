`timescale 1ns / 1ps
`default_nettype none

module testbench_clock_divider ();

localparam CLK_PERIOD = 20; /* 50 MHz */

/* signals for the simulation target */
logic clk_in = 1'b0;
logic rst = 1'b0;
logic clk_out = 1'b0;

/* Instantiate the target. */
clock_divider #(.RATE(3)) clock_divider_inst (.clk_in, .rst, .clk_out);

/* Generate clock. */
always #(CLK_PERIOD / 2) clk_in <= ~clk_in;

/* Simulate reset. */
initial begin
    #(2.75 * CLK_PERIOD)
    rst <= 1'b1;
    #(3 * CLK_PERIOD)
    rst <= 1'b0;
	 #(5 * CLK_PERIOD)
    $stop;
end

endmodule

`default_nettype wire
