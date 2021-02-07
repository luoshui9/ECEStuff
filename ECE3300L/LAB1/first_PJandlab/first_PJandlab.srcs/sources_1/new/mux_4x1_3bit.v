`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2021 05:55:29 PM
// Design Name: 
// Module Name: mux_4x1_3bit
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


module mux_4x1_3bit(
    input [2:0]x,[2:0]y,[2:0]z,[2:0]w,
    input [1:0]s,
    output [2:0]f,
    output reg [1:0]ds
    );
    wire[2:0] result0,result1;
    mux_2x1_3bit(
         .x(x),
         .y(y),
         .s(s[0]),
         .w(result0)
        );

    mux_2x1_3bit(
         .x(z),
         .y(w),
         .s(s[0]),
         .w(result1)
        );
        
    mux_2x1_3bit(
         .x(result0),
         .y(result1),
         .s(s[1]),
         .w(f)
        );
    
    integer i;

    always @(ds) begin
    for (i=0;i<2;i=i+1) begin
        ds[i]=s[i]; 
        end
    end

           
        
endmodule
