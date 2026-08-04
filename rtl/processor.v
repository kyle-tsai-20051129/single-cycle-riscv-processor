`timescale 1ns / 1ps
module processor
(
input clk , reset ,
output [31:0] Result
);

//Define wires
wire [6:0] funct7;
wire [2:0] funct3;
wire [6:0] opcode;
wire [1:0] aluop;
wire [3:0] operation;
wire regwrite,alusrc, memread, memwrite, memtoreg;


// Define the processor modules behavior
Datapath d (
    .clk(clk),
    .reset(reset),
    .reg_write(regwrite),
    .mem2reg(memtoreg),
    .alu_src(alusrc),
    .mem_write(memwrite),
    .mem_read(memread),
    .alu_cc(operation),
    .opcode(opcode),
    .funct7(funct7),
    .funct3(funct3),
    .alu_result(Result)
);

Controller c (
    .Opcode(opcode),
    .ALUSrc(alusrc),
    .MemtoReg(memtoreg),
    .RegWrite(regwrite),
    .MemRead(memread),
    .MemWrite(memwrite),
    .ALUOp(aluop)
);

ALUController ac (
    .ALUOp(aluop),
    .Funct7(funct7),
    .Funct3(funct3),
    .Operation(operation)
);    
    




    

endmodule // processor