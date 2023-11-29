`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2023 09:54:15 PM
// Design Name: 
// Module Name: imm_gen
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


module imm_gen(
      input [31:0] instruction,
      output [31:0] immediate
    );
    logic [6:0] opcode;
    assign opcode=instruction[6:0];
    
      assign immediate = (opcode == 7'b0010011) ? {{20{instruction[31]}}, instruction[31:20]} :                     // I-type immediate
                        (opcode == 7'b0100011) ? {{20{instruction[31]}}, instruction[31:25], instruction[11:7]} : // S-type immediate
                        (opcode == 7'b0110111 ) ? {{12{instruction[31]}}, instruction[31:12]} :                     // U-type immediate
                        32'b0;
    

endmodule
