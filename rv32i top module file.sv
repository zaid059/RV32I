`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2023 02:37:40 PM
// Design Name: 
// Module Name: rv32i_top
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


module rv32i_top(
input logic clk,
input logic rst,
output logic [31:0] writeback_wire,
output logic [31:0] temp,
output logic [31:0] pcadre,
output logic [31:0] pcout,
output logic [3:0] aluresl
);


logic [31:0] pc_wire;
logic [31:0] add_wire;
logic [31:0] inst_wire;
logic [4:0] rs1_wire;
logic [4:0] rs2_wire;
logic [4:0] rd_wire;
logic regwrite_w;
logic smem_w;
logic wbmux_w;
logic op_b_sel_w;
logic [3:0] aluop_wire;
logic [31:0] RD1_wire;
logic [31:0] RD2_wire;
logic [31:0] imm_gen_wire;
logic [31:0] mux_wire;
logic [31:0] alu_wire;
logic [31:0] datamem_wire;
logic [3:0] WM_wire;

assign temp = inst_wire;
assign pcadre= add_wire;
assign aluresl= aluop_wire;
assign pcout=pc_wire;

pc_adder add_1(
            .a(pc_wire),
            .b(32'b100),
            .c(add_wire)
            );

pcounter pc(
        .pc_in(add_wire),
        .clk(clk),
        .rst(rst),
        .pc_out(pc_wire)
        );  
           
inst_mem inst(
            .A(pc_wire),
            .WD(),
            .clk(clk),
            .RD(inst_wire),
            .WM(4'b000)
        );
        
imm_gen imm(
             .instruction(inst_wire),
             .immediate(imm_gen_wire)
            );
            
CU CU(
        .inst(inst_wire),
        .rs1(rs1_wire),
        .rs2(rs2_wire),
        .rd(rd_wire),
        .Regwrite(regwrite_w),
        .s_mem(smem_w),
        .wb_mux(wbmux_w),
        .op_b_sel(op_b_sel_w),
        .aluop(aluop_wire),
        .WM(WM_wire)
 );
        
register rg(
        .clk(clk),
        .rst(rst),
        .WE3(regwrite_w),
        .RS1(rs1_wire),
        .RS2(rs2_wire),
        .rd(rd_wire),
        .WD3(writeback_wire),
        .RD1(RD1_wire),
        .RD2(RD2_wire)
 );
 
 mux mux_imm(
        .a(RD2_wire),
        .b(imm_gen_wire),
        .sel(op_b_sel_w),
        .c(mux_wire)
 
 );
         
ALU alu1(
        .A(RD1_wire),
        .B(mux_wire),
        .opcode(aluop_wire),
        .Out(alu_wire)
 );  
 
 data_mem data(
        .A(alu_wire),
        .WD(RD2_wire),
        .clk(clk),
        .WE(smem_w),
        .RD(datamem_wire),
        .WM(WM_wire)
 );
 
 mux mux_datamem(
         .a(datamem_wire),
         .b(alu_wire),
         .sel(wbmux_w),
         .c(writeback_wire)
    );
    
endmodule
