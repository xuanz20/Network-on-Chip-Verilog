//二维数组打包为一维数组
`define PACK_ARRAY(PK_WIDTH,PK_LEN,PK_SRC,PK_DEST) \
                generate \
                genvar pk_idx; \
                for (pk_idx=0; pk_idx<(PK_LEN); pk_idx=pk_idx+1) \
                begin \
                        assign PK_DEST[((PK_WIDTH)*pk_idx+((PK_WIDTH)-1)):((PK_WIDTH)*pk_idx)] = PK_SRC[pk_idx][((PK_WIDTH)-1):0]; \
                end \
                endgenerate

//一维数组展开为二维数组
`define UNPACK_ARRAY(PK_WIDTH,PK_LEN,PK_DEST,PK_SRC) \
                generate \
                genvar unpk_idx; \
                for (unpk_idx=0; unpk_idx<(PK_LEN); unpk_idx=unpk_idx+1) \
                begin \
                        assign PK_DEST[unpk_idx][((PK_WIDTH)-1):0] = PK_SRC[((PK_WIDTH)*unpk_idx+(PK_WIDTH-1)):((PK_WIDTH)*unpk_idx)]; \
                end \
                endgenerate

module SwitchAlloc (
        input      clk,
        input      RST,
        input [14:0] targ_pack,
        input [4:0] pop_ctrl,                       // 不需要UNPACK，pop_ctrl[0]即是pop[0]
        output [2:0] to1,to2,to3,to4,to5            // 每个input的传播方向，0为不传播
    );

    wire [2:0] ti [4:0];
    `UNPACK_ARRAY(3,5,ti,targ_pack)                 // targ_pack[2:0] 对应 ti[0]
                 reg [2:0] count [4:0];             // 记录每个output buffer接收哪个input，0为不接收
    integer i;
    always @(posedge clk or negedge RST) begin
        if (!RST) begin
            for (i = 0; i < 5; i = i + 1)
                count[i] <= 1;
        end
        else begin
            for (i = 0; i < 5; i = i + 1) begin
                if(pop_ctrl[i])
                    count[i] <= 1;
                else if(count[i] == 7)
                    count[i] <= count[i];
                else
                    count[i] <= count[i] + 1;
            end
        end
    end

    reg [2:0] prio [4:0][4:0];             // 第一个索引为out，第二个索引为in
    integer j;
    always @(*) begin
        for (i = 0; i < 5; i = i + 1) begin
            for (j = 0; j < 5; j = j + 1) begin
                prio[i][j] = (ti[j] == (i+1)) ? pop_ctrl[j] ? 1 : count[j] : 0;
            end
        end
    end

    reg [2:0] to [4:0];
    always @(posedge clk or negedge RST) begin
        if (!RST) begin
            for (i = 0; i < 5; i = i + 1) begin
                to[i] <= 0;
            end
        end
        else begin
            case (ti[0])        // 注意 target仍然是1~5
                1:
                    to[0] <= (prio[0][0] >= prio[0][1] && prio[0][0] >= prio[0][2] && prio[0][0] >= prio[0][3] && prio[0][0] >= prio[0][4]) ? 1 : 0;
                2:
                    to[0] <= (prio[1][0] >= prio[1][1] && prio[1][0] >= prio[1][2] && prio[1][0] >= prio[1][3] && prio[1][0] >= prio[1][4]) ? 2 : 0;
                3:
                    to[0] <= (prio[2][0] >= prio[2][1] && prio[2][0] >= prio[2][2] && prio[2][0] >= prio[2][3] && prio[2][0] >= prio[2][4]) ? 3 : 0;
                4:
                    to[0] <= (prio[3][0] >= prio[3][1] && prio[3][0] >= prio[3][2] && prio[3][0] >= prio[3][3] && prio[3][0] >= prio[3][4]) ? 4 : 0;
                5:
                    to[0] <= (prio[4][0] >= prio[4][1] && prio[4][0] >= prio[4][2] && prio[4][0] >= prio[4][3] && prio[4][0] >= prio[4][4]) ? 5 : 0;
                default:
                    to[0] <= 0;
            endcase
            case (ti[1])        // 注意 target仍然是1~5
                1:
                    to[1] <= (prio[0][0] < prio[0][1] && prio[0][1] >= prio[0][2] && prio[0][1] >= prio[0][3] && prio[0][1] >= prio[0][4]) ? 1 : 0;
                2:
                    to[1] <= (prio[1][0] < prio[1][1] && prio[1][1] >= prio[1][2] && prio[1][1] >= prio[1][3] && prio[1][1] >= prio[1][4]) ? 2 : 0;
                3:
                    to[1] <= (prio[2][0] < prio[2][1] && prio[2][1] >= prio[2][2] && prio[2][1] >= prio[2][3] && prio[2][1] >= prio[2][4]) ? 3 : 0;
                4:
                    to[1] <= (prio[3][0] < prio[3][1] && prio[3][1] >= prio[3][2] && prio[3][1] >= prio[3][3] && prio[3][1] >= prio[3][4]) ? 4 : 0;
                5:
                    to[1] <= (prio[4][0] < prio[4][1] && prio[4][1] >= prio[4][2] && prio[4][1] >= prio[4][3] && prio[4][1] >= prio[4][4]) ? 5 : 0;
                default:
                    to[1] <= 0;
            endcase
            case (ti[2])        // 注意 target仍然是1~5
                1:
                    to[2] <= (prio[0][0] < prio[0][2] && prio[0][1] < prio[0][2] && prio[0][2] >= prio[0][3] && prio[0][2] >= prio[0][4]) ? 1 : 0;
                2:
                    to[2] <= (prio[1][0] < prio[1][2] && prio[1][1] < prio[1][2] && prio[1][2] >= prio[1][3] && prio[1][2] >= prio[1][4]) ? 2 : 0;
                3:
                    to[2] <= (prio[2][0] < prio[2][2] && prio[2][1] < prio[2][2] && prio[2][2] >= prio[2][3] && prio[2][2] >= prio[2][4]) ? 3 : 0;
                4:
                    to[2] <= (prio[3][0] < prio[3][2] && prio[3][1] < prio[3][2] && prio[3][2] >= prio[3][3] && prio[3][2] >= prio[3][4]) ? 4 : 0;
                5:
                    to[2] <= (prio[4][0] < prio[4][2] && prio[4][1] < prio[4][2] && prio[4][2] >= prio[4][3] && prio[4][2] >= prio[4][4]) ? 5 : 0;
                default:
                    to[2] <= 0;
            endcase
            case (ti[3])        // 注意 target仍然是1~5
                1:
                    to[3] <= (prio[0][0] < prio[0][3] && prio[0][1] < prio[0][3] && prio[0][2] < prio[0][3] && prio[0][3] >= prio[0][4]) ? 1 : 0;
                2:
                    to[3] <= (prio[1][0] < prio[1][3] && prio[1][1] < prio[1][3] && prio[1][2] < prio[1][3] && prio[1][3] >= prio[1][4]) ? 2 : 0;
                3:
                    to[3] <= (prio[2][0] < prio[2][3] && prio[2][1] < prio[2][3] && prio[2][2] < prio[2][3] && prio[2][3] >= prio[2][4]) ? 3 : 0;
                4:
                    to[3] <= (prio[3][0] < prio[3][3] && prio[3][1] < prio[3][3] && prio[3][2] < prio[3][3] && prio[3][3] >= prio[3][4]) ? 4 : 0;
                5:
                    to[3] <= (prio[4][0] < prio[4][3] && prio[4][1] < prio[4][3] && prio[4][2] < prio[4][3] && prio[4][3] >= prio[4][4]) ? 5 : 0;
                default:
                    to[3] <= 0;
            endcase
            case (ti[4])        // 注意 target仍然是1~5
                1:
                    to[4] <= (prio[0][0] < prio[0][4] && prio[0][1] < prio[0][4] && prio[0][2] < prio[0][4] && prio[0][3] < prio[0][4]) ? 1 : 0;
                2:
                    to[4] <= (prio[1][0] < prio[1][4] && prio[1][1] < prio[1][4] && prio[1][2] < prio[1][4] && prio[1][3] < prio[1][4]) ? 2 : 0;
                3:
                    to[4] <= (prio[2][0] < prio[2][4] && prio[2][1] < prio[2][4] && prio[2][2] < prio[2][4] && prio[2][3] < prio[2][4]) ? 3 : 0;
                4:
                    to[4] <= (prio[3][0] < prio[3][4] && prio[3][1] < prio[3][4] && prio[3][2] < prio[3][4] && prio[3][3] < prio[3][4]) ? 4 : 0;
                5:
                    to[4] <= (prio[4][0] < prio[4][4] && prio[4][1] < prio[4][4] && prio[4][2] < prio[4][4] && prio[4][3] < prio[4][4]) ? 5 : 0;
                default:
                    to[4] <= 0;
            endcase
        end
    end

    assign to1 = to[0];
    assign to2 = to[1];
    assign to3 = to[2];
    assign to4 = to[3];
    assign to5 = to[4];

endmodule //SwitchAlloc
