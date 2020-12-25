// CQUWH
// 2020-12-25
// 选择正确的 pc_next
`include "defines.vh"

module pc_mux (
    input  wire[31:0] pcF, 
    output reg[31:0]  pc_next
);

    assign pc_next = pcF + 4;

endmodule //pc_mux