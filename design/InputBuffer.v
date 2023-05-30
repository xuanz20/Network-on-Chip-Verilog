module InputBuffer (
        input      clk,
        input      RST,
        input [22:0] data,  // 22:7是data，6:3是addr，2:0是target
        input valid,        // data信号是否应被写入buffer
        input pop,          // 是否应将fifo头部数据pop，1为pop
        output [22:0] out   // fifo头部数据
    );

    reg [2:0] state, next_state;    // 有效范围是0~4，代表fifo中有效的数据
    localparam WRONG = 3'd0;

    always @(posedge clk or negedge RST) begin
        if(!RST)
            state <= 0;
        else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case(state)
            0:
                next_state = valid ? 1 : pop ? WRONG : 0;
            1:
                next_state = valid ? pop ? 1 : 2 : pop ? 0 : 1;
            2:
                next_state = valid ? pop ? 2 : 3 : pop ? 1 : 2;
            3:
                next_state = valid ? pop ? 3 : 4 : pop ? 2 : 3;
            4:
                next_state = valid ? pop ? 4 : WRONG : pop ? 3 : 4;
            default:
                next_state = 0;
        endcase
    end

    reg [22:0] fifo [3:0];  // fifo[3] 为头部（出数据）
    always @(posedge clk or negedge RST) begin
        if (!RST) begin
            {fifo[3],fifo[2],fifo[1],fifo[0]} <= {23'b0,23'b0,23'b0,23'b0};
        end
        else begin
            if (pop) begin
                if(valid) begin     // pop并写入
                    case (state)
                        0:
                            {fifo[3],fifo[2],fifo[1],fifo[0]} <= {data,23'b0,23'b0,23'b0};
                        1:
                            {fifo[3],fifo[2],fifo[1],fifo[0]} <= {data,23'b0,23'b0,23'b0};
                        2:
                            {fifo[3],fifo[2],fifo[1],fifo[0]} <= {fifo[2],data,23'b0,23'b0};
                        3:
                            {fifo[3],fifo[2],fifo[1],fifo[0]} <= {fifo[2],fifo[1],data,23'b0};
                        4:
                            {fifo[3],fifo[2],fifo[1],fifo[0]} <= {fifo[2],fifo[1],fifo[0],data};
                        default:
                            {fifo[3],fifo[2],fifo[1],fifo[0]} <= {23'b0,23'b0,23'b0,23'b0};
                    endcase
                end
                else begin      // pop但不写入
                    case (state)
                        2:
                            {fifo[3],fifo[2],fifo[1],fifo[0]} <= {fifo[2],23'b0,23'b0,23'b0};
                        3:
                            {fifo[3],fifo[2],fifo[1],fifo[0]} <= {fifo[2],fifo[1],23'b0,23'b0};
                        4:
                            {fifo[3],fifo[2],fifo[1],fifo[0]} <= {fifo[2],fifo[1],fifo[0],23'b0};
                        default:
                            {fifo[3],fifo[2],fifo[1],fifo[0]} <= {23'b0,23'b0,23'b0,23'b0};
                    endcase
                end
            end
            else begin
                if(valid) begin     // 不pop但写入
                    case (state)
                        0:
                            {fifo[3],fifo[2],fifo[1],fifo[0]} <= {data,23'b0,23'b0,23'b0};
                        1:
                            {fifo[3],fifo[2],fifo[1],fifo[0]} <= {fifo[3],data,23'b0,23'b0};
                        2:
                            {fifo[3],fifo[2],fifo[1],fifo[0]} <= {fifo[3],fifo[2],data,23'b0};
                        3:
                            {fifo[3],fifo[2],fifo[1],fifo[0]} <= {fifo[3],fifo[2],fifo[1],data};
                        default:
                            {fifo[3],fifo[2],fifo[1],fifo[0]} <= {23'b0,23'b0,23'b0,23'b0};
                    endcase
                end
                else begin      // 不pop也不写入
                    {fifo[3],fifo[2],fifo[1],fifo[0]} <= {fifo[3],fifo[2],fifo[1],fifo[0]};
                end
            end
        end
    end

    assign out = fifo[3];

endmodule //InputBuffer
