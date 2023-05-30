`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/05 15:53:12
// Design Name: 
// Module Name: ProcessorElement
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


module ProcessorElement5(
    input clk,
    input RST,
    input [19:0] datain,
    input in_valid,
    input ci, 
    output  [19:0] dataout,
    output  out_valid
    );

    reg     [2:0]   cnt;        // number of data allocated

    always @(posedge clk or negedge RST) begin
        if (!RST) begin
            cnt <= 3'b0;
        end
        else begin
            if (cnt < 3'b100) begin // still can allocate
                if (ci == 1) begin
                    cnt <= cnt;
                end
                else begin
                    cnt <= cnt + 1;
                end 
            end
            else begin // cannot allocate
                if (ci == 1'b1) begin
                    cnt <= cnt - 3'b1;
                end
                else begin
                    cnt <= cnt;
                end
            end
        end
    end

    wire    enable;
    assign  enable = (cnt < 3'd4) ? 1 : 0;

    dataout_buf_5 dataout_buffer (
        .clk        (clk),
        .RST        (RST),
        .enable     (enable),
        .dataout    (dataout),
        .out_valid  (out_valid)
    );

    datain_buf  datain_buffer (
        .clk        (clk),
        .RST        (RST),
        .in_valid   (in_valid),
        .datain     (datain)
    );

endmodule
