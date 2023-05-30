module RouteCompute (
        input      clk,
        input      RST,
        input [19:0] datain,    // 输入数据，包含了原始的16位data和4位的addr;
        input in_valid,         // 输入是否有效
        input [3:0] pos,        // 当前Router的位置
        output [22:0] dataout,  // 输出数据，包含了16位data，4位addr和3位target
        output out_valid        // 输出是否有效
    );

    reg [19:0]  in_pipe; // 输入打一拍
    reg         out_valid_pipe; // 输出有效信号打一拍

    always @(posedge clk or negedge RST) begin
        if (!RST) begin
            in_pipe <= 20'b0;
            out_valid_pipe <= 1'b0;
        end
        else begin
            if (!in_valid) begin
                in_pipe <= 20'b0;
                out_valid_pipe <= 1'b0;
            end
            else begin
                in_pipe <= datain;
                out_valid_pipe <= in_valid;
            end
        end
    end

    reg [2:0]   target;
    always @(posedge clk or negedge RST) begin // negative-first
        if (!RST) begin
            target <= 3'b000;
        end
        else begin
            if (!in_valid) begin
                target <= 3'b000;
            end
            else begin
                if (pos[0]) begin // 当前位置为奇数，横向>纵向
                    if (pos[1:0] > datain[1:0])
                        target <= 3'b011;
                    else if (pos[3:2] > datain[3:2])
                        target <= 3'b010;
                    else if (pos[1:0] < datain[1:0])
                        target <= 3'b001;
                    else if (pos[3:2] < datain[3:2])
                        target <= 3'b100;
                    else
                        target <= 3'b101;
                end
                else begin
                    if (pos[3:2] > datain[3:2])
                        target <= 3'b010;
                    else if (pos[1:0] > datain[1:0])
                        target <= 3'b011;
                    else if (pos[3:2] < datain[3:2])
                        target <= 3'b100;
                    else if (pos[1:0] < datain[1:0])
                        target <= 3'b001;
                    else
                        target <= 3'b101;
                end
            end
        end
    end

    assign out_valid = out_valid_pipe;
    assign dataout[22:3] = in_pipe;
    assign dataout[2:0] = target;

endmodule //RouteCompute
