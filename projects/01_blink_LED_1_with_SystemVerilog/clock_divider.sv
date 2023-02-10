`default_nettype none

module clock_divider #(
    parameter RATE = 1
)
(
    input wire clk_in,
    input wire rst,
    output reg clk_out = 1'b0
);

logic [$bits(RATE)-1:0] count = 0;

always_ff @(posedge clk_in, posedge rst) begin
    if (rst) begin
        count <= 0;
        clk_out <= 1'b0;
    end else begin
        if (count == RATE-1) begin
            count <= 0;
            clk_out <= ~clk_out;
        end else begin
            count <= count + 1;
        end
    end
end

endmodule

`default_nettype wire
