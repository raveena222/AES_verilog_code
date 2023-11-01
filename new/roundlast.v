`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2023 19:36:41
// Design Name: 
// Module Name: roundlast
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


module roundlast(clk,rc,rin,keylastin,fout);
input clk;
input [3:0]rc;
input [127:0]rin;
input [127:0]keylastin;
output [127:0]fout;

wire [127:0] sb,sr,mcl,keyout;

RoundKeyGenerator t0(.rc(rc),.inkey(keylastin),.outkey(keyout));
ByteSubstitution t1(.data(rin),.scramble(sb));
ShiftRows t2(.i_block(sb),.o_block(sr));
assign fout= keyout^sr;

endmodule