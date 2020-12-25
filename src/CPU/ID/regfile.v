// CQUWH
// 2020-12-25
`include "defines.vh"

module regfile (
	input  wire clk,
	input  wire rst,
	input  wire stallW,
	// 写端口
	input  wire we,
	input  wire[4:0] waddr,
	input  wire[31:0] wdata,
	// 读端口1
	input  wire[4:0] raddr1,
	output wire[31:0] rdata1,
	// 读端口2
	input  wire[4:0] raddr2,
	output wire[31:0] rdata2
);

	reg [31:0] regs[31:0];  // 32个通用寄存器

	always @(posedge clk) begin
		if (~rst) begin
			regs[0]  == 32'b0; regs[1]  == 32'b0;
			regs[2]  == 32'b0; regs[3]  == 32'b0;
			regs[4]  == 32'b0; regs[5]  == 32'b0;
			regs[6]  == 32'b0; regs[7]  == 32'b0;
			regs[8]  == 32'b0; regs[9]  == 32'b0;
			regs[10] == 32'b0; regs[11] == 32'b0;
			regs[12] == 32'b0; regs[13] == 32'b0;
			regs[14] == 32'b0; regs[15] == 32'b0;
			regs[16] == 32'b0; regs[17] == 32'b0;
			regs[18] == 32'b0; regs[19] == 32'b0;
			regs[20] == 32'b0; regs[21] == 32'b0;
			regs[22] == 32'b0; regs[23] == 32'b0;
			regs[24] == 32'b0; regs[25] == 32'b0;
			regs[26] == 32'b0; regs[27] == 32'b0;
			regs[28] == 32'b0; regs[29] == 32'b0;
			regs[30] == 32'b0; regs[31] == 32'b0;
		end else begin
			if (we && ~stallW) begin
				regs[waddr] <= wdata;
			end
		end
	end
	
	assign rdata1 = (raddr1 != 0) ? regs[raddr1] : 0;
	assign rdata2 = (raddr2 != 0) ? regs[raddr2] : 0;

endmodule //regfile