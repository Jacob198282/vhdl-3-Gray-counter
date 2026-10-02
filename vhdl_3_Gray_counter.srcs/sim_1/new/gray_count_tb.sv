`timescale 1us / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2026 12:43:17
// Design Name: 
// Module Name: gray_count_tb
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


module gray_count_tb();
    parameter N = 3;
    
    logic clk_i;
    logic rst_i;
    logic [N-1:0] led_o;
    
    gray_count UUT (
        .clk_i(clk_i),
        .rst_i(rst_i),
        .led_o(led_o)
    );
    
    always #10 clk_i = ~clk_i;
    
    initial begin
        clk_i = 0;
        rst_i = 0;
        led_o = 0;
        $monitor ("Time = %0t, rst_i = %0b, led_o = %0b", $time, rst_i, led_o);
        rst_i <= 1;
        #13 rst_i <= 0;
        #33 rst_i <= 1;
        #10 rst_i <= 0;
        #100;
        $finish;
    end
endmodule
