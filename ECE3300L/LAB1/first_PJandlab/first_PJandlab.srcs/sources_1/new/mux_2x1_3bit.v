`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2021 05:50:34 PM
// Design Name: 
// Module Name: mux_2x1_3bit
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


module mux_2x1_3bit(
input [2:0]x,[2:0]y,
input s,
    output [2:0]w
    );
   
    mux_2x1_simple M0(
    .i0(x[0]), 
    .i1(y[0]), 
    .s(s),
    .f(w[0])
    );
    mux_2x1_simple M1(
    .i0(x[1]), 
    .i1(y[1]), 
    .s(s),
    .f(w[1])
    );
    mux_2x1_simple M2(
    .i0(x[2]), 
    .i1(y[2]), 
    .s(s),
    .f(w[2])
    );

endmodule

