`timescale 1 ns/ 1 ns
module encoder_tb();
    localparam OUT_SIZE = 4;
    localparam IN_SIZE = 1<<OUT_SIZE;
    logic [IN_SIZE-1:0] in;
    logic [OUT_SIZE-1:0] out;

/*
initial begin
    for (in = 0; in < IN_SIZE; in++)
        #10;
    $finish;
end
*/

initial begin
    $monitor ($time, " in= %b, out = %b", in, out);

    //for (int i = 0, in = 0; i < IN_SIZE; i++, in = (1 << 2**(i-1)))     // in = 0
    //for (in = 0; in < IN_SIZE; in++)
    //for (in = 0; (1 << in) < (1 << IN_SIZE); in++)
    //for (in = 0; (1 << 2**(in - 1)) != (1 << 2**(IN_SIZE - 1)); in++)
    for (in = 1; in < (1 << (IN_SIZE - 1)); in = in * 2)
    #10;

    #10 $finish;
end

encoder  #(
    .OUT_SIZE(OUT_SIZE)
)
i_encoder
(
    .in         (in     ),
    .out        (out    )
    //.enable     (1'b1   )
);

endmodule
