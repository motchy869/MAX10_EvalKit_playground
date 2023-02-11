`timescale 1ns / 1ps
`default_nettype none

module testbench_clock_divider ();

/* parameters */
localparam CLK_PERIOD = 20; /* 50 MHz */
localparam RATE = 3; /* 1/3 */

/* signals for the simulation target */
bit clk_in;
bit rst = 1'b0;
logic clk_out;

/* Instantiate the target. */
clock_divider #(.RATE(RATE)) clock_divider_inst (.clk_in, .rst, .clk_out);

/* Generate clock. */
always #(CLK_PERIOD / 2) clk_in <= ~clk_in;

/* Simulate reset. */
initial begin
    #(2.75 * CLK_PERIOD)
    rst <= 1'b1;
    #(3 * CLK_PERIOD)
    rst <= 1'b0;
    #(10 * CLK_PERIOD)
    $stop;
end

/* assertions */
property p_clk_division_rise_to_fall;
    @(posedge clk_in) disable iff (rst) $rose(clk_out) |-> ##RATE $fell(clk_out);
endproperty

property p_clk_division_fall_to_rise;
    @(posedge clk_in) disable iff (rst) $fell(clk_out) |-> ##RATE $rose(clk_out);
endproperty

assert property (p_clk_division_rise_to_fall) else begin
    $display("ERROR: failed");
    $fatal;
end

assert property (p_clk_division_fall_to_rise) else begin
    $display("ERROR: failed");
    $fatal;
end

endmodule

`default_nettype wire
