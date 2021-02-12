`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2021 05:32:31 PM
// Design Name: 
// Module Name: csa_multiplier
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


module csa_multiplier(
    input [3:0]m,q,
    output [7:0]p
    );
    // transfer m,q into miqr.
    wire [3:0] miq0,miq1,miq2,miq3;
    mq_4bit mqRow1(
        .m(m),
        .q(q[0]),
        .mq(miq0)
    );
    
    mq_4bit mqRow2(
        .m(m),
        .q(q[1]),
        .mq(miq1)
    );
    
    mq_4bit mqRow3(
        .m(m),
        .q(q[2]),
        .mq(miq2)
    );
    
    mq_4bit mqRow4(
        .m(m),
        .q(q[3]),
        .mq(miq3)
    );
    
    // wire up everything for the adder inputs.
    wire [3:0] xRow1,yRow1,cinRow1,coutRow1,sRow1;
    wire [3:0] xRow2,yRow2,cinRow2,coutRow2,sRow2;
    wire [3:0] xRow3,yRow3,cinRow3,sRow3;
    wire coutRow3;
    assign xRow1 = {1'b0,miq0[3:1]};
    assign yRow1 = miq1;    
    assign cinRow1 = {miq2[2:0],1'b0};
    assign xRow2 = {miq2[3],sRow1[3:1]};
    assign yRow2 = {miq3[2:0],1'b0};
    assign cinRow2 = coutRow1;
    assign xRow3 = {miq3[3],sRow2[3:1]};
    assign yRow3 = coutRow2;
    
    // wire up output
    assign p[0] = miq0[0];
    assign p[1] = sRow1[0];
    assign p[2] = sRow2[0];
    assign p[6:3] = sRow3;
    assign p[7] = coutRow3;
    
    // put signals into adders
    generate
    genvar i;
        for(i=0;i<4;i=i+1) begin
            full_adder adderRow1
            (
                .x(xRow1[i]),
                .y(yRow1[i]),
                .c_in(cinRow1[i]),
                .s(sRow1[i]),
                .c_out(coutRow1[i])
            );    
        end
        
        for(i=0;i<4;i=i+1) begin
            full_adder adderRow2
            (
                .x(xRow2[i]),
                .y(yRow2[i]),
                .c_in(cinRow2[i]),
                .s(sRow2[i]),
                .c_out(coutRow2[i])
            );    
        end
        
    endgenerate
    
    adder_subtractor #(4)  adderRow3
    (
        .x(xRow3),
        .y(yRow3),
        .add_n(1'b0),
        .s(sRow3),
        .c_out(coutRow3)
    );
    

    
endmodule
