`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2021 01:30:18 PM
// Design Name: 
// Module Name: simple_cal_tb
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


module simple_cal_tb(

    );
    
    reg [3:0] x,y;
    reg [1:0] op_sel;
    wire [7:0] result;
    wire c_out,overflow;
    
    simple_calc calculator(
    .x(x),
    .y(y),
    .op_sel(op_sel),
    .result(result),
    .c_out(c_out),
    .overflow(overflow)
    );
    
    
     initial begin
        #10
        op_sel = 'b01;
        x = 'd0;
        y = 'd8;
                  
        
       end
       
      initial begin
        #60 $finish;
      end
    
endmodule
