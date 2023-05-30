`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2022/09/03 19:46:46
// Design Name:
// Module Name: Router_test
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


module Router_test();

    reg clk;
    reg RST;
    reg [19:0] in1, in2, in3, in4, in5;
    reg vi1, vi2, vi3, vi4, vi5;
    wire [19:0] o1,o2,o3,o4,o5;

    always #10 clk <= ~clk;

    initial begin
        clk <= 1'b0;
        RST <= 1'b0;
        in1 <= 20'b0;
        in2 <= 20'b0;
        in3 <= 20'b0;
        in4 <= 20'b0;
        in5 <= 20'b0;
        vi1 <= 0;
        vi2 <= 0;
        vi3 <= 0;
        vi4 <= 0;
        vi5 <= 0;
        #20;
        RST <= 1'b1;
        vi1 <= 1;
        vi2 <= 1;
        vi3 <= 1;
        vi4 <= 1;
        vi5 <= 1;
        in1 <= {16'd1,4'd10};           // output 1
        in2 <= {16'd2,4'd10};           // output 1
        in3 <= {16'd3,4'd0};            // output 3
        in4 <= {16'd4,4'd3};            // output 2
        in5 <= {16'd5,4'd15};           // output 1
        #20;
        in1 <= {16'd6,4'd13};
        in2 <= {16'd7,4'd5};
        in3 <= {16'd8,4'd3};
        in4 <= {16'd9,4'd0};
        in5 <= {16'd10,4'd7};
        #20 {vi1,vi2,vi3,vi4,vi5} <= {1'b0,1'b0,1'b0,1'b0,1'b0};
        #200;
        $finish;
    end

    Router  router (
                .clk    (clk),
                .RST    (RST),
                .position   (4'b101),
                .in1    (in1),
                .in2    (in2),
                .in3    (in3),
                .in4    (in4),
                .in5    (in5),
                .vi1    (vi1),
                .vi2    (vi2),
                .vi3    (vi3),
                .vi4    (vi4),
                .vi5    (vi5),
                .ci1    (1'b1),
                .ci2    (1'b1),
                .ci3    (1'b1),
                .ci4    (1'b1),
                .o1     (o1),
                .o2     (o2),
                .o3     (o3),
                .o4     (o4),
                .o5     (o5),
                .vo1     (vo1),
                .vo2     (vo2),
                .vo3     (vo3),
                .vo4     (vo4),
                .vo5     (vo5),
                .co1     (co1),
                .co2     (co2),
                .co3     (co3),
                .co4     (co4),
                .co5     (co5)
            );
endmodule
