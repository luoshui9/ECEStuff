`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2021 10:39:04 AM
// Design Name: 
// Module Name: mux_2x1_8bit
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


module mux_2x1_8bit(
    input[7:0] i0,i1,
    input s,
    output reg [7:0]f
    );
    
    always@(i1,i0,s) begin
        case (s)
        1: f = i1;
        0: f = i0;
        endcase
     end
    
endmodule
