`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2021 10:55:37 PM
// Design Name: 
// Module Name: csa_multiplier_tb
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


module csa_multiplier_tb(  
    );
    
    reg [3:0] m,q;
    wire [7:0] result;
        
    csa_multiplier mutiplier(
        .m(m),
        .q(q),
        .p(result)
    );
 
      initial begin
        m = 'd0;
        q = 'd10;
        
        #10;
        
        m = 'd5;
        q = 'd5;
        
        #10;
        
        m = 'd9;
        q = 'd5;
        
        #10;
        
        m = 'd12;
        q = 'd13;
        
        #10;
        
        m = 'd15;
        q = 'd10;                
        
       end
       
      initial begin
        #60 $finish;
      end
       
endmodule
