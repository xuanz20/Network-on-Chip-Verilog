`timescale 1ns/1ps

module Network_FPGA (
        input sys_clk_p, sys_clk_n, RST
    );

    wire sys_clk;
    wire    state;
    wire    [15:0]  reeeaaad;
    IBUFDS  sys_clk_ibufgds(
                .O  (sys_clk),
                .I  (sys_clk_p),
                .IB (sys_clk_n)
            );

    wire    state;
    wire    [15:0]  reeeaaad;
    wire    locked;
    wire    pll_clk;
    
    //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG

  clk_wiz_0 clk_wiz
   (
    // Clock out ports
    .clk_out1(pll_clk),     // output clk_out1
    // Status and control signals
    .reset(~RST), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(sys_clk));      // input clk_in1
// INST_TAG_END ------ End INSTANTIATION Template ---------

    Network net(
        .clk(pll_clk),
        .RST(RST),
        .state(state),
        .reeeaaad(reeeaaad)
        );

    
    ila_0   ila (
        .clk    (pll_clk),
        .probe0 (state),
        .probe1 (reeeaaad)
    );


endmodule //moduleName
