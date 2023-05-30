module Router (
        input      clk,
        input      RST,
        input [3:0] position,                   // router's position
        input [19:0] in1,in2,in3,in4,in5,       // input data for 5 ports
        input vi1,vi2,vi3,vi4,vi5,              // input valid signal
        input ci1,ci2,ci3,ci4,                  // credit in signal
        output [19:0] o1,o2,o3,o4,o5,           // output data for 5 ports
        output vo1,vo2,vo3,vo4,vo5,             // output valid signal
        output co1,co2,co3,co4,co5              // credit out signal
    );

    /*** in reg ***/
    wire [19:0] in [4:0];
    wire valid [4:0];
    reg [19:0] in_pipe [4:0];
    reg valid_pipe [4:0];
    assign valid[0] = vi1;
    assign valid[1] = vi2;
    assign valid[2] = vi3;
    assign valid[3] = vi4;
    assign valid[4] = vi5;
    assign in[0] = in1;
    assign in[1] = in2;
    assign in[2] = in3;
    assign in[3] = in4;
    assign in[4] = in5;
    integer i;
    always @(posedge clk or negedge RST) begin
        if (!RST) begin
            for (i = 0; i < 5; i = i + 1) begin
                in_pipe[i] <= 0;
                valid_pipe[i] <= 0;
            end
        end
        else begin
            for (i = 0; i < 5; i = i + 1) begin
                in_pipe[i] <= in[i];
                valid_pipe[i] <= valid[i];
            end
        end
    end

    /*** Route Computing***/
    wire [22:0] in_RC [4:0];
    wire valid_RC [4:0];
    genvar j;
generate for(j = 0 ; j < 5; j = j + 1) begin : U1
            RouteCompute RC(.clk(clk),.RST(RST),.datain(in_pipe[j]),
                            .in_valid(valid_pipe[j]),.pos(position),
                            .dataout(in_RC[j]),.out_valid(valid_RC[j]));
        end
    endgenerate

    /*** Input Buffer ***/
    wire [4:0] pop_ctrl;
    wire [22:0] fifo_out [4:0];
    reg [22:0]  fifo_out_reg    [4:0];

generate for(j = 0 ; j < 5; j = j + 1) begin : U2
            InputBuffer IB(
                            .clk    (clk),
                            .RST    (RST),
                            .data   (in_RC[j]),
                            .valid  (valid_RC[j]),
                            .pop    ((fifo_out[j][2:0]!=0 && fifo_out_reg[j][2:0]==0) ? 1'b1 : pop_ctrl[j]),
                            .out    (fifo_out[j])
                        );
        end
    endgenerate

    /*** VC and SA ***/
generate for(j = 0 ; j < 5 ; j = j + 1) begin : U3
            always @(posedge clk or negedge RST) begin
                if (!RST) begin
                    fifo_out_reg[j] <= 0;
                end
                else begin
                    fifo_out_reg[j] <= (fifo_out_reg[j][2:0] == 0) ? fifo_out[j] :
                                pop_ctrl[j] ? fifo_out[j] : fifo_out_reg[j];
                end
            end
        end
    endgenerate

    VCAlloc VCA(
                .clk    (clk),
                .RST    (RST),
                .targ1  (fifo_out_reg[0][2:0]==0 ? fifo_out[0][2:0] : pop_ctrl[0] ? fifo_out[0][2:0] : fifo_out_reg[0][2:0]),
                .targ2  (fifo_out_reg[1][2:0]==0 ? fifo_out[1][2:0] : pop_ctrl[1] ? fifo_out[1][2:0] : fifo_out_reg[1][2:0]),
                .targ3  (fifo_out_reg[2][2:0]==0 ? fifo_out[2][2:0] : pop_ctrl[2] ? fifo_out[2][2:0] : fifo_out_reg[2][2:0]),
                .targ4  (fifo_out_reg[3][2:0]==0 ? fifo_out[3][2:0] : pop_ctrl[3] ? fifo_out[3][2:0] : fifo_out_reg[3][2:0]),
                .targ5  (fifo_out_reg[4][2:0]==0 ? fifo_out[4][2:0] : pop_ctrl[4] ? fifo_out[4][2:0] : fifo_out_reg[4][2:0]),
                .cred1  (ci1),
                .cred2  (ci2),
                .cred3  (ci3),
                .cred4  (ci4),
                .alloc1 (vc1),
                .alloc2 (vc2),
                .alloc3 (vc3),
                .alloc4 (vc4),
                .alloc5 (vc5)
            );

    wire [2:0] to1,to2,to3,to4,to5;
    SwitchAlloc SA(
                    .clk    (clk),
                    .RST    (RST),
                    .targ_pack  ({
                                     fifo_out_reg[4][2:0]==0 ? fifo_out[4][2:0] : pop_ctrl[4] ? fifo_out[4][2:0] : fifo_out_reg[4][2:0],
                                     fifo_out_reg[3][2:0]==0 ? fifo_out[3][2:0] : pop_ctrl[3] ? fifo_out[3][2:0] : fifo_out_reg[3][2:0],
                                     fifo_out_reg[2][2:0]==0 ? fifo_out[2][2:0] : pop_ctrl[2] ? fifo_out[2][2:0] : fifo_out_reg[2][2:0],
                                     fifo_out_reg[1][2:0]==0 ? fifo_out[1][2:0] : pop_ctrl[1] ? fifo_out[1][2:0] : fifo_out_reg[1][2:0],
                                     fifo_out_reg[0][2:0]==0 ? fifo_out[0][2:0] : pop_ctrl[0] ? fifo_out[0][2:0] : fifo_out_reg[0][2:0]
                                 }),
                    .pop_ctrl   (pop_ctrl),
                    .to1    (to1),
                    .to2    (to2),
                    .to3    (to3),
                    .to4    (to4),
                    .to5    (to5)
                );

    Control Ctr (
                .vc1    (vc1),
                .vc2    (vc2),
                .vc3    (vc3),
                .vc4    (vc4),
                .vc5    (vc5),
                .sa1    (to1),
                .sa2    (to2),
                .sa3    (to3),
                .sa4    (to4),
                .sa5    (to5),
                .pop_ctrl   (pop_ctrl)
            );

    /*** Switch Transform stage ***/
    Crossbar ST (
                 .clk    (clk),
                 .RST    (RST),
                 .in1    (fifo_out_reg[0]),
                 .in2    (fifo_out_reg[1]),
                 .in3    (fifo_out_reg[2]),
                 .in4    (fifo_out_reg[3]),
                 .in5    (fifo_out_reg[4]),
                 .cb_ctrl    (pop_ctrl),
                 .o1     (o1),
                 .o2     (o2),
                 .o3     (o3),
                 .o4     (o4),
                 .o5     (o5),
                 .v1     (vo1),
                 .v2     (vo2),
                 .v3     (vo3),
                 .v4     (vo4),
                 .v5     (vo5)
             );

    assign co1 = pop_ctrl[0];
    assign co2 = pop_ctrl[1];
    assign co3 = pop_ctrl[2];
    assign co4 = pop_ctrl[3];
    assign co5 = pop_ctrl[4];
endmodule //Router
