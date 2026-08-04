`timescale 1ns / 1ps

module Datapath # (
parameter PC_W = 8 , // Program Counter
parameter INS_W = 32 , // Instruction Width
parameter RF_ADDRESS = 5 , // Register File Address
parameter DATA_W = 32 , // Data WriteData
parameter DM_ADDRESS = 9 , // Data Memory Address
parameter ALU_CC_W = 4 // ALU Control Code Width
)(
input clk , // CLK in Datapath figure
input reset , // Reset in Datapath figure
input reg_write , // RegWrite in Datapath figure
input mem2reg , // MemtoReg in Datapath figure
input alu_src , // ALUSrc in Datapath figure
input mem_write , // MemWrite in Datapath Figure
input mem_read , // MemRead in Datapath Figure
input [ ALU_CC_W -1:0] alu_cc , // ALUCC in Datapath Figure
output [6:0] opcode , // opcode in Datapath Figure
output [6:0] funct7 , // Funct7 in Datapath Figure
output [2:0] funct3 , // Funct3 in Datapath Figure
output [ DATA_W -1:0] alu_result // Datapath_Result in Datapath Figure
);
// Write your code here
wire [PC_W-1:0] pc, pcplus4;
wire [INS_W-1:0] instruction;
wire [RF_ADDRESS-1:0] rd_rg_wrt_wire;
wire [RF_ADDRESS-1:0] rd_rg_addr_wire1;
wire [RF_ADDRESS-1:0] rd_rg_addr_wire2;
wire [DATA_W-1:0] write_back_data, reg1, reg2;
wire [DATA_W-1:0] extimm;
wire [DATA_W-1:0] srcb;
wire [DATA_W-1:0] datamem_read;
wire [DATA_W-1:0] alu_out;

//PC and PCPlus4
FlipFlop f (
    .clk(clk),
    .reset(reset),
    .d(pcplus4),
    .q(pc)
);
assign pcplus4 = pc + 4;

//Instruction Memory
InstMem im (
    .addr(pc),
    .instruction(instruction)
);

assign opcode = instruction[6:0];
assign funct3 = instruction[14:12];
assign funct7 = instruction [31:25];

assign rd_rg_wrt_wire = instruction [11:7];
assign rd_rg_addr_wire1 = instruction [19:15];
assign rd_rg_addr_wire2 = instruction [24:20];

//RegFile
RegFile r (
    .clk(clk),
    .reset(reset),
    .rg_wrt_en(reg_write),
    .rg_wrt_addr(rd_rg_wrt_wire),
    .rg_rd_addr1(rd_rg_addr_wire1),
    .rg_rd_addr2(rd_rg_addr_wire2),
    .rg_wrt_data(write_back_data),
    .rg_rd_data1(reg1),
    .rg_rd_data2(reg2)
);


//ImmGen
ImmGen ig (
    .InstCode(instruction),
    .ImmOut(extimm)
);

//MUX before ALU
Mux m1 (
    .S(alu_src),
    .D0(reg2),
    .D1(extimm),
    .Y(srcb)
);

//ALU
ALU a (
    .A_in(reg1),
    .B_in(srcb),
    .ALU_Sel(alu_cc),
    .Carry_Out(),
    .Zero(),
    .Overflow(),
    .ALU_Out(alu_out)
);
assign alu_result = alu_out;

//DataMem

DataMem dm (
    .MemRead(mem_read),
    .MemWrite(mem_write),
    .addr(alu_out[8:0]),
    .write_data(reg2),
    .read_data(datamem_read)
);
    
//Mux after DataMem
Mux m2(
    .S(mem2reg),
    .D0(alu_out),
    .D1(datamem_read),
    .Y(write_back_data)
);



endmodule // Datapath