`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/05 17:54:50
// Design Name: 
// Module Name: datain_buf
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


module datain_buf(
    input   clk,
    input   RST,
    input   in_valid,
    input   [19:0]  datain
    );

    reg [4:0] addr;
    reg state;      // 标记写完后开始读

    always @(posedge clk or negedge RST) begin
        if (!RST) begin
            addr <= 5'b0;
            state <= 1'b0;
        end
        else if (in_valid) begin
            if (addr == 5'd29) begin
                addr <= 5'b0;
                state <= 1'b1;
            end
            else begin
                addr <= addr + 1;
                state <= state;
            end
        end
        else if (state) begin
            addr <= (addr==29) ? 0 : (addr + 1);
            state <= state;
        end
        else begin
            addr <= addr;
            state <= state;
        end
    end

    wire    [19:0]  douta;

    datain_buf_IP   datain_buf_0 (
        .clka    (clk),
        .dina   (datain),
        .addra  (addr),
        .wea    (in_valid),
        .douta  (douta)
    );

endmodule
