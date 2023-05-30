`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2022/09/05 19:58:19
// Design Name:
// Module Name: Network_tb
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


module Network_tb();

    reg clk;
    reg RST;
    integer i;
    integer fout0;
    integer fout1;
    integer fout2;
    integer fout3;
    integer fout4;
    integer fout5;
    integer fout6;
    integer fout7;
    integer fout8;
    integer fout9;
    integer fout10;
    integer fout11;
    integer fout12;
    integer fout13;
    integer fout14;
    integer fout15;
    reg [15:0] my_result;

    always #10 clk <= ~clk;
    initial begin
        clk <= 1'b0;
        RST <= 1'b0;
        /*$readmemb("../../../../dat/data_in_0.txt",   NoC.node0.PE.dataout_buffer.dataout_buf_IP0.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory);
        $readmemb("../../../../dat/data_in_1.txt",   NoC.node1.PE.dataout_buffer.dataout_buf_IP1.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory);
        $readmemb("../../../../dat/data_in_2.txt",   NoC.node2.PE.dataout_buffer.dataout_buf_IP2.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory);
        $readmemb("../../../../dat/data_in_3.txt",   NoC.node3.PE.dataout_buffer.dataout_buf_IP3.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory);
        $readmemb("../../../../dat/data_in_4.txt",   NoC.node4.PE.dataout_buffer.dataout_buf_IP4.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory);
        $readmemb("../../../../dat/data_in_5.txt",   NoC.node5.PE.dataout_buffer.dataout_buf_IP5.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory);
        $readmemb("../../../../dat/data_in_6.txt",   NoC.node6.PE.dataout_buffer.dataout_buf_IP6.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory);
        $readmemb("../../../../dat/data_in_7.txt",   NoC.node7.PE.dataout_buffer.dataout_buf_IP7.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory);
        $readmemb("../../../../dat/data_in_8.txt",   NoC.node8.PE.dataout_buffer.dataout_buf_IP8.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory);
        $readmemb("../../../../dat/data_in_9.txt",   NoC.node9.PE.dataout_buffer.dataout_buf_IP9.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory);
        $readmemb("../../../../dat/data_in_10.txt",  NoC.node10.PE.dataout_buffer.dataout_buf_IP10.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory);
        $readmemb("../../../../dat/data_in_11.txt",  NoC.node11.PE.dataout_buffer.dataout_buf_IP11.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory);
        $readmemb("../../../../dat/data_in_12.txt",  NoC.node12.PE.dataout_buffer.dataout_buf_IP12.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory);
        $readmemb("../../../../dat/data_in_13.txt",  NoC.node13.PE.dataout_buffer.dataout_buf_IP13.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory);
        $readmemb("../../../../dat/data_in_14.txt",  NoC.node14.PE.dataout_buffer.dataout_buf_IP14.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory);
        $readmemb("../../../../dat/data_in_15.txt",  NoC.node15.PE.dataout_buffer.dataout_buf_IP15.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory);*/
    end

    initial begin
        fout0   <= $fopen("../../../../dat/data_out_0.txt", "w");
        fout1   <= $fopen("../../../../dat/data_out_1.txt", "w");
        fout2   <= $fopen("../../../../dat/data_out_2.txt", "w");
        fout3   <= $fopen("../../../../dat/data_out_3.txt", "w");
        fout4   <= $fopen("../../../../dat/data_out_4.txt", "w");
        fout5   <= $fopen("../../../../dat/data_out_5.txt", "w");
        fout6   <= $fopen("../../../../dat/data_out_6.txt", "w");
        fout7   <= $fopen("../../../../dat/data_out_7.txt", "w");
        fout8   <= $fopen("../../../../dat/data_out_8.txt", "w");
        fout9   <= $fopen("../../../../dat/data_out_9.txt", "w");
        fout10  <= $fopen("../../../../dat/data_out_10.txt", "w");
        fout11  <= $fopen("../../../../dat/data_out_11.txt", "w");
        fout12  <= $fopen("../../../../dat/data_out_12.txt", "w");
        fout13  <= $fopen("../../../../dat/data_out_13.txt", "w");
        fout14  <= $fopen("../../../../dat/data_out_14.txt", "w");
        fout15  <= $fopen("../../../../dat/data_out_15.txt", "w");
        #20 RST <= 1'b1;
        #8000;
        for (i = 0; i < 30; i = i + 1) begin
            my_result = NoC.node0.PE.datain_buffer.datain_buf_0.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory[i][19:4];
            $fdisplay(fout0, "%d", my_result);
            my_result = NoC.node1.PE.datain_buffer.datain_buf_0.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory[i][19:4];
            $fdisplay(fout1, "%d", my_result);
            my_result = NoC.node2.PE.datain_buffer.datain_buf_0.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory[i][19:4];
            $fdisplay(fout2, "%d", my_result);
            my_result = NoC.node3.PE.datain_buffer.datain_buf_0.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory[i][19:4];
            $fdisplay(fout3, "%d", my_result);
            my_result = NoC.node4.PE.datain_buffer.datain_buf_0.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory[i][19:4];
            $fdisplay(fout4, "%d", my_result);
            my_result = NoC.node5.PE.datain_buffer.datain_buf_0.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory[i][19:4];
            $fdisplay(fout5, "%d", my_result);
            my_result = NoC.node6.PE.datain_buffer.datain_buf_0.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory[i][19:4];
            $fdisplay(fout6, "%d", my_result);
            my_result = NoC.node7.PE.datain_buffer.datain_buf_0.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory[i][19:4];
            $fdisplay(fout7, "%d", my_result);
            my_result = NoC.node8.PE.datain_buffer.datain_buf_0.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory[i][19:4];
            $fdisplay(fout8, "%d", my_result);
            my_result = NoC.node9.PE.datain_buffer.datain_buf_0.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory[i][19:4];
            $fdisplay(fout9, "%d", my_result);
            my_result = NoC.node10.PE.datain_buffer.datain_buf_0.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory[i][19:4];
            $fdisplay(fout10, "%d", my_result);
            my_result = NoC.node11.PE.datain_buffer.datain_buf_0.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory[i][19:4];
            $fdisplay(fout11, "%d", my_result);
            my_result = NoC.node12.PE.datain_buffer.datain_buf_0.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory[i][19:4];
            $fdisplay(fout12, "%d", my_result);
            my_result = NoC.node13.PE.datain_buffer.datain_buf_0.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory[i][19:4];
            $fdisplay(fout13, "%d", my_result);
            my_result = NoC.node14.PE.datain_buffer.datain_buf_0.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory[i][19:4];
            $fdisplay(fout14, "%d", my_result);
            my_result = NoC.node15.PE.datain_buffer.datain_buf_0.inst.native_mem_module.blk_mem_gen_v8_4_3_inst.memory[i][19:4];
            $fdisplay(fout15, "%d", my_result);
        end

        $fclose(fout0);
        $fclose(fout1);
        $fclose(fout2);
        $fclose(fout3);
        $fclose(fout4);
        $fclose(fout5);
        $fclose(fout6);
        $fclose(fout7);
        $fclose(fout8);
        $fclose(fout9);
        $fclose(fout10);
        $fclose(fout11);
        $fclose(fout12);
        $fclose(fout13);
        $fclose(fout14);
        $fclose(fout15);
        $finish;
    end

    Network     NoC(
                    .clk    (clk),
                    .RST    (RST)
                );

endmodule
