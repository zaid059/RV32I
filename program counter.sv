`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2023 02:40:14 PM
// Design Name: 
// Module Name: pcounter
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


module pcounter(
input logic[31:0] pc_in,
input logic clk,
input logic rst,
output logic[31:0] pc_out);

always @(posedge clk)
begin
if(rst==1'b0)
begin
pc_out <=32'h00000000;
end
else
begin
pc_out<=pc_in;

end
end

endmodule
  
