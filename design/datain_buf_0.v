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


module datain_buf_0(
    input   clk,
    input   RST,
    input   in_valid,
    input   [19:0]  datain,
    output  state,
    output  [15:0]  reeeaaad
    );

    reg [4:0] addr;
    reg state_reg;      // 标记写完后开始读

    always @(posedge clk or negedge RST) begin
        if (!RST) begin
            addr <= 5'b0;
            state_reg <= 1'b0;
        end
        else if (in_valid) begin
            if (addr == 5'd29) begin
                addr <= 5'b0;
                state_reg <= 1'b1;
            end
            else begin
                addr <= addr + 1;
                state_reg <= state_reg;
            end
        end
        else if (state_reg) begin
            addr <= (addr==29) ? 0 : (addr + 1);
            state_reg <= state_reg;
        end
        else begin
            addr <= addr;
            state_reg <= state_reg;
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

    assign  state = state_reg;
    assign  reeeaaad = douta[19:4];


endmodule
