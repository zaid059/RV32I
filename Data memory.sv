`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2023 12:05:45 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem(
 input logic[31:0]A,
 input logic[31:0]WD,
 input logic clk,
 input logic WE,
 input logic[3:0] WM,
 output logic[31:0]RD
 
);

 //Create Memory
    logic[31:0] datamem[1023:0];
    
 //Write 
 always_ff @(posedge clk) begin
             if (WE) begin
             if ( WM[0]) begin
                datamem[A][7:0] <= WD[7:0];
            end
                else if (WM[1]) begin
                datamem[A][15:8]<=WD[15:8];
            end
                else if (WM[2]) begin
                datamem[A][23:16]<=WD[23:16];
            end
                else if (WM[3]) begin
                datamem[A][31:24] <= WD[31:24];
            end
    end
end

 assign RD =datamem[A]; 
endmodule
