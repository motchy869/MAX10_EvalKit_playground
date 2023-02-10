`default_nettype none

module double_ff (
    input wire clk,
    input wire d_in,
    output reg d_out = 1'b0
);

logic temp = 1'b0;

always_ff @(posedge clk) begin
    temp <= d_in;
    d_out <= temp;
end

endmodule

`default_nettype wire
