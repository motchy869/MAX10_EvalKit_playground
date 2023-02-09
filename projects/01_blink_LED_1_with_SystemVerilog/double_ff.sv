`default_nettype none

module double_ff (
    input wire clk,
    input wire d_in,
    output wire d_out
);

reg temp = 1'b0;

always @(posedge clk) begin
    temp <= d_in;
    d_out <= temp;
end

endmodule

`default_nettype wire
