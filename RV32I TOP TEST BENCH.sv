`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2023 11:15:11 PM
// Design Name: 
// Module Name: rv32i_tb
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


module rv32i_tb();

// Inputs
 logic clk;
 logic rst;
 logic [31:0] writeback_wire;
 logic [31:0] temp;
 logic [31:0] pcadre;
 logic [3:0] aluresl;
 logic [31:0] pcout;
 
  // Instantiate the DUT
  rv32i_top dut (
    .clk(clk),
    .rst(rst),
    .writeback_wire(writeback_wire),
    .temp(temp),
    .pcadre(pcadre),
    .aluresl(aluresl),
    .pcout(pcout)
  );


  // Clock generation
  initial begin
    clk = 0;
    forever #5 
    clk=~clk;
  end

 initial begin
        rst=1;
        #10
        rst=0;
        #10;
        rst=1;
        #150; 
    end
    
  
endmodule
