// CQUWH
// 2020-12-25
// IF/ID流水线寄存器
`include "defines.vh"

module if_id (
    input  wire       clk,
    input  wire       rst,
    input  wire       stallD,
    input  wire       flushD,
    input  wire[31:0] pcF,
    input  wire[31:0] instrF,
    output wire[31:0] pcD,
    output wire[31:0] instrD
);

    always @(posedge clk) begin
        if(rst | flushD) begin
            pcD    <= `ZeroWord;
            instrD <= `ZeroWord;
        end
        else if(~stallD) begin
            pcD    <= pcF;
            instrD <= instrF;
        end
    end

endmodule //if_id