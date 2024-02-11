`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2024 10:06:14
// Design Name: 
// Module Name: waveform_design_test
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


module waveform_design_test(clk,shift_ena,count_ena,data,q);
input clk,shift_ena,count_ena,data;
output reg [3:0]q;
reg [1:0] cnt = 0;
// Internal variables for debugging
reg [1:0] cnt1 = 0;
reg [1:0] x =0;
always@(posedge clk)
begin
    q <= 4'd0;
    // Shift enable Logic
    if (shift_ena == 1'b1)
    begin
        if (data == 1'b1) 
        begin
            cnt = cnt+1'b1;
            // Checking the 2nd risiging edge of data
            if (cnt == 2'b10)
            begin
                q <= {q[2:0],1'b0};
                @(posedge clk)
                q <= {q[2:0],1'b1};
                // For debugging
                cnt1 = cnt1 +1'b1;
            end
            else begin
                @(posedge clk)
                q <= {q[2:0],1'b1};
                // For debugging
                x = x+1;
            end
        end
        else 
        begin
        // if data = 0 left shift 0
            q <= {q[2:0],1'b0};
        end    
    end
    // Count enable logic
    else if(count_ena == 1'b1)
    begin
        // Output should be retained
        q <= q;
        // Next clock pulse output should decrement
        @(posedge clk)
        q <= q - 4'd1;
    end
    // When both the inputs are low, output should retain
    else
        q <= q;
end
endmodule

// IGNORE THIS COMMENTED BOX


/*always @(posedge clk)
begin
    q <= 4'd0;
    if(shift_ena == 1'b1)
        q <= {q[2:0],data};
    else if (count_ena == 1'b1)
        q <= q-4'd1;
end*/

/*always@(posedge clk)
begin
    q = 4'd0;
    if(shift_ena)
    begin
        @(negedge data) begin
            q = {q[3:1],1'b1};
            end
        if (data == 0) begin
            q = q << 1;
            end
        @(posedge data) begin
        @(posedge clk)
        q = {q[3:1],1'b1};
        end
    end
    else if (count_ena)
        q = q-1;
    else
        q = q;
end*/

