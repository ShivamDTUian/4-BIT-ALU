`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:11:03 03/18/2017 
// Design Name: 
// Module Name:    comparator 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Comparator(comp_out, A, B, Opcode);

	input [3:0] A, B, Opcode;
	output [3:0] comp_out;
	wire AeB, AnB, AgB, AlB;

	assign AeB = (A == B);
	assign AnB = (A != B);

	assign comp_out = (Opcode == 4'b1100) ? {3'b000, AeB}
						 : (Opcode == 4'b1101) ? {3'b000, AnB}
						 : (Opcode == 4'b1110) ? {3'b000, ($signed(A) > $signed(B))}
						 : (Opcode == 4'b1111) ? {3'b000, ($signed(A) < $signed(B))}
						 : 4'b0000;

endmodule
 32 changes: 32 additions & 0 deletions32  
Logical.v
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,32 @@
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:59:32 09/06/2024
// Design Name: 
// Module Name:    logical 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Logical(logical_out, A, B, Opcode);

	output [3:0] logical_out;
	input [3:0] A, B, Opcode;

	assign logical_out = (Opcode == 4'b1000) ? (A & B)
							 : (Opcode == 4'b1001) ? (A | B)
							 : (Opcode == 4'b1010) ? (A ^ B)
							 : (Opcode == 4'b1011) ? ~(A | B)
							 : 4'b0000;

endmodule
