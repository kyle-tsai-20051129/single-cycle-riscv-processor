`timescale 1ns / 1ps


// Module definition
module Controller (
Opcode ,
ALUSrc , MemtoReg , RegWrite , MemRead , MemWrite ,
ALUOp
);
// Define the input and output signals
input [6:0] Opcode;
output ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite;
output [1:0] ALUOp;


// Define the Controller modules behavior
parameter [6:0] RTYPE = 7'b0110011;
parameter [6:0] RTYPEI = 7'b0010011;
parameter [6:0] LW = 7'b0000011;
parameter [6:0] SW = 7'b0100011;

assign MemtoReg = (Opcode == LW);
assign MemWrite = (Opcode == SW);
assign MemRead = (Opcode == LW);
assign ALUSrc = (Opcode == RTYPEI) || (Opcode == LW) || (Opcode == SW);
assign RegWrite = (Opcode != SW);
assign ALUOp = (Opcode == RTYPE) ? 2'b10:
               (Opcode == RTYPEI) ? 2'b00:
               (Opcode == LW) ? 2'b01:
               (Opcode == SW) ? 2'b01: 2'b00;






endmodule // Controller