`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2024 10:37:00
// Design Name: 
// Module Name: waveform_design_test_tb
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

/*module waveform_design_test_tb();
reg clk,shift_ena,count_ena,data;
wire [3:0]q;
waveform_design_test uut(clk,shift_ena,count_ena,data,q);
initial begin
    clk = 1'b0;
    while(1)
    #10 clk = ~clk;
end
initial begin
    {shift_ena,count_ena} = 2'd0;
    @(posedge clk)
    #50 {shift_ena,data} = 2'b11;
    #20 data = 1'b0;
    #40 data = 1'b1;
    #20 data = 1'bx;
    shift_ena = 1'b0;
    #10 count_ena = 1'b1;
end
endmodule*/


module waveform_design_test_tb();
reg clk,shift_ena,count_ena,data;
wire [3:0]q;
waveform_design_test uut(clk,shift_ena,count_ena,data,q);
initial begin
    clk = 1'b0;
    while(1)
    #10 clk = ~clk;
end
initial begin
    {shift_ena,count_ena} = 2'd0;
    #50 {shift_ena,data} = 2'b11;
    #20 data = 1'b0;
    #40 data = 1'b1;
    #20 data = 1'bx;
    shift_ena = 1'b0;
    #60 count_ena = 1'b1;
end
endmodule

