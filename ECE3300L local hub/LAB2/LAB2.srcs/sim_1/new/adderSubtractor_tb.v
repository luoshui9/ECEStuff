`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2021 01:47:47 PM
// Design Name: 
// Module Name: adderSubtractor_tb
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


module adderSubtractor_tb(

    );
    
    reg [3:0] x,y;
    wire [3:0] s;
    wire overflow,c_out;
    
     adder_subtractor #(4) adderSub (
    .x(x), 
    .y(y),
    .add_n('b1),
    .s(s),
    .c_out(c_out),
    .overflow(overflow)
    );
    
    initial begin
        #10
        x = 'd0;
        y = 'd8;
                  
        
       end
       
      initial begin
        #60 $finish;
      end
    
endmodule
