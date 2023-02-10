`timescale 1ns / 1ps
`default_nettype none

module testbench_blink_LED_1_with_SystemVerilog ();

/* parameters */
localparam CLK_PERIOD = 20; /* 50 MHz */

/* signals for the simulation target */
logic clk = 1'b0;
logic rst = 1'b0;
logic led = 1'b0;

/* Instantiate the target. */
blink_LED_1_with_SystemVerilog blink_LED_1_with_SystemVerilog_inst (.clk, .rst_async(rst), .led);

/* Generate clock. */
always #(CLK_PERIOD / 2) clk <= ~clk;

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
