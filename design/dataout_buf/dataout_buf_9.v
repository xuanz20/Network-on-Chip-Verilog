`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/05 16:46:33
// Design Name: 
// Module Name: dataout_buf
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


module dataout_buf_9(
    input   clk,
    input   RST,
    input   enable,     // inject data enable signal
    output  [19:0]  dataout,
    output  reg  out_valid
    );

    reg     [4:0] addr; // depth: 30
    reg     in_process;
    reg     op_finish;
    reg     en_pipe;


    always @(posedge clk or negedge RST) begin
        if (!RST) begin
            addr <= 5'd0;
            in_process <= 1'b0;
            op_finish <= 1'b0;
            en_pipe <= 1'b0;
        end
        else begin
            if (enable && !op_finish) begin
                if (!in_process) begin  // head process
                    addr <= 5'd0;
                    in_process <= 1'b1;
                    op_finish <= 1'b0;
                    en_pipe <= enable;
                end
                else if (in_process && addr == 5'd29) begin // tail process
                    addr <= 5'd0;
                    in_process <= 1'b0;
                    op_finish <= 1'b1;
                    en_pipe <= 1'b0;
                end
                else if (in_process && addr < 5'd29) begin
                    addr <= addr + 1;
                    in_process <= 1'b1;
                    op_finish <= 1'b0;
                    en_pipe <= enable;
                end
                else begin
                    addr <= addr;
                    in_process <= in_process;
                    op_finish <= op_finish;
                    en_pipe <= en_pipe;
                end
            end
            else if (!enable) begin
                addr <= addr;
                in_process <= in_process;
                op_finish <= op_finish;
                en_pipe <= enable;
            end
            else begin
                addr <= addr;
                in_process <= in_process;
                op_finish <= op_finish;
                en_pipe <= en_pipe;
            end
        end
    end

    always @(posedge clk or negedge RST) begin
        if (!RST) begin
            out_valid <= 1'b0;
        end
        else begin
            out_valid <= en_pipe;
        end
    end

    dataout_buf_IP9 dataout_buf_IP9 (
        .clka   (clk),
        .dina   (20'd0),
        .addra  (addr),
        .wea    (1'b0),
        .douta  (dataout)
    );
    
endmodule
