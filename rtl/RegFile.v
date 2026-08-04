`timescale 1ns / 1ps

// Module definition
module RegFile (
clk , reset , rg_wrt_en ,
rg_wrt_addr ,
rg_rd_addr1 ,
rg_rd_addr2 ,
rg_wrt_data ,
rg_rd_data1 ,
rg_rd_data2
);
// Define the input and output signals
input clk;
input reset;
input rg_wrt_en;
input [4:0] rg_wrt_addr;
input [4:0] rg_rd_addr1;
input [4:0] rg_rd_addr2;
input [31:0] rg_wrt_data;
output [31:0] rg_rd_data1;
output [31:0] rg_rd_data2;

// Define the Register File module behavior
reg [31:0] register [0:31];

//Integer for for loop purpose inside always block
integer i;

//Positive edge triggered by clock or reset
always @(posedge clk or posedge reset)
begin
if (reset == 1'b1)
    begin
        for(i = 0; i <= 31; i = i+1)
            register[i] <= 32'b0;
    end
else if (rg_wrt_en)
    begin
        register[rg_wrt_addr] <= rg_wrt_data;
    end
 
end

//Reading does not depend on clk or reset
assign rg_rd_data1 = register[rg_rd_addr1];
assign rg_rd_data2 = register[rg_rd_addr2];

endmodule // RegFile