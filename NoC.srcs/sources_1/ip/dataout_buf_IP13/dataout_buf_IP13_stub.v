// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Wed Sep  7 17:28:13 2022
// Host        : Jeff running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/DELL/Desktop/NoC on
//               FPGA/NoC.srcs/sources_1/ip/dataout_buf_IP13/dataout_buf_IP13_stub.v}
// Design      : dataout_buf_IP13
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_3,Vivado 2019.1" *)
module dataout_buf_IP13(clka, wea, addra, dina, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[4:0],dina[19:0],douta[19:0]" */;
  input clka;
  input [0:0]wea;
  input [4:0]addra;
  input [19:0]dina;
  output [19:0]douta;
endmodule
