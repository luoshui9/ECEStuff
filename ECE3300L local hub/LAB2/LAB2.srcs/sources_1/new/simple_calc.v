`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2021 10:46:55 AM
// Design Name: 
// Module Name: simple_calc
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


module simple_calc(
    input [3:0] x,y,
    input [1:0] op_sel,
    output [7:0]result,
    output c_out,overflow
    
    );
    
    wire [3:0] adderResult;//store adder/subtractor results
    wire [7:0] multiplierResult; //store multiplier result
    
    adder_subtractor #(4) adderSubtractor(
    .x(x),
    .y(y),
    .add_n(op_sel[0]),
    .s(adderResult),
    .c_out(c_out),
    .overflow(overflow)
    );
    
    csa_multiplier multiplier(
    .m(x),
    .q(y),
    .p(multiplierResult)
    );
    
    // the result is determined by op_set[1] using a 8bit mux.
    mux_2x1_8bit mux(
    .i0({4'b0,adderResult}),
    .i1(multiplierResult),
    .s(op_sel[1]),
    .f(result)
    );
    
    
    
endmodule
