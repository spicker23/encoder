`timescale 1 ns/ 1 ns
module tb();
    localparam OUT_SIZE = 4;
    localparam IN_SIZE = 1<<OUT_SIZE;
    logic [IN_SIZE-1:0] in;
    logic [OUT_SIZE-1:0] out;


initial begin
    for (in = 0; in < IN_SIZE; in++)
        #10;
    $finish;
end

encoder i_encoder #(
    .OUT_SIZE(OUT_SIZE)
)(
    .in         (in     ),
    .out        (out    ),
    .enable     (1'b1   )
);

endmodule
