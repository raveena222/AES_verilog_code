`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2023 19:37:42
// Design Name: 
// Module Name: rounds1to9
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


module rounds1to9(clk,rc,data,keyin,keyout,rndout);
input clk;
input [3:0]rc;
input [127:0]data;
input [127:0]keyin;
output [127:0]keyout;
output [127:0]rndout;

wire [127:0] sb,sr,mcl;

RoundKeyGenerator t0(.rc(rc),.inkey(keyin),.outkey(keyout));
//initial begin
//$monitor("%d ",keyout);
//end
ByteSubstitution t1(.data(data),.scramble(sb));
ShiftRows t2(.i_block(sb),.o_block(sr));
MixColumns t3(.i_block(sr),.o_block(mcl));
assign rndout= keyout^mcl;

endmodule