`default_nettype none

module clock_divider #(
    parameter RATE = 1
)
(
    input wire clk_in,
    input wire rst,
    output wire clk_out
);

reg clk_out_i = 1'b0;
reg [$bits(RATE)-1:0] count = 0;

assign clk_out = clk_out_i;

always @(clk_in, rst) begin
    if (rst) begin
        count <= 0;
        clk_out_i <= 1'b0;
    end else begin
        if (count == RATE-1) begin
            count <= 0;
            clk_out_i <= ~clk_out_i;
        end else begin
            count <= count + 1;
        end
    end
end

endmodule

`default_nettype wire
