`default_nettype none

module double_ff (
    input logic clk,
    input logic d_in,
    output logic d_out
);

logic temp = 1'b0;

always_ff @(posedge clk) begin
    temp <= d_in;
    d_out <= temp;
end

endmodule

`default_nettype wire
