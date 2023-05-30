`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2022/09/05 18:23:32
// Design Name:
// Module Name: Node
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


module Node9(
        input   clk,
        input   RST,
        input   [3:0]   position,
        input   [19:0]  in1, in2, in3, in4,
        input   vi1, vi2, vi3, vi4,
        input   ci1, ci2, ci3, ci4,
        output  [19:0]  o1, o2, o3, o4,
        output  vo1, vo2, vo3, vo4,
        output  co1, co2, co3, co4
    );

    wire    [19:0]  inject;
    wire    inject_valid;
    wire    [19:0]  eject;
    wire    eject_valid;
    wire    credit;

    Router  Router_0 (
                .clk        (clk),
                .RST        (RST),
                .position   (position),
                .in1(in1),  .in2(in2),  .in3(in3),  .in4(in4),  .in5(inject),
                .vi1(vi1),  .vi2(vi2),  .vi3(vi3),  .vi4(vi4),  .vi5(inject_valid),
                .ci1(ci1),  .ci2(ci2),  .ci3(ci3),  .ci4(ci4),
                .o1(o1),    .o2(o2),    .o3(o3),    .o4(o4),    .o5(eject),
                .vo1(vo1),  .vo2(vo2),  .vo3(vo3),  .vo4(vo4),  .vo5(eject_valid),
                .co1(co1),  .co2(co2),  .co3(co3),  .co4(co4),  .co5(credit)
            );

    ProcessorElement9    PE (
                            .clk        (clk),
                            .RST        (RST),
                            .datain     (eject),
                            .in_valid   (eject_valid),
                            .ci         (credit),
                            .dataout    (inject),
                            .out_valid  (inject_valid)
                        );

endmodule
