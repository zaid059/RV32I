`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2023 10:16:17 PM
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(
input logic [31:0] A,
input logic [31:0] B,
input logic [3:0] opcode,
output logic [31:0] Out
);
always_comb begin
    case(opcode)
        4'b0000: Out = A + B;//add
        4'b1000: Out = A - B;//sub
        4'b0001: Out = A << B;//sll
        4'b0010: Out = A < B;//slt
        4'b0011: Out = A < B;//sltu
        4'b0100: Out = A ^ B;//xor
        
        4'b0101: Out = A >> B;
        4'b1101: Out = A >>> B;
        4'b0110: Out = A | B;
        4'b0111: Out = A & B;
        4'b1111: Out = ( A==B ) ? 1'b1 : 1'b0;
        default: Out = 0;
    endcase
end

endmodule
