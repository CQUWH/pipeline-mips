// CQUWH
// 2020-12-25
`include "defines.vh"

module pc_reg (
    input  wire clk,
    input  wire rst,
    input  wire stallF,
    input  wire [31:0] pc_next,
    output reg  [31:0] pcF,
    output reg  ce
);
    always @(posedge clk) begin
        if(rst) begin
            ce <= 1'b0;
        end else begin
            ce <= 1'b1;
        end
    end

    always @(posedge clk) begin
        if(!ce) begin
            pcF <= 32'h0;
        end
        else if(~stallF) begin
            pcF <= pc_next;
        end
    end
endmodule //pc_reg