module encoder #(
    parameter OUT_SIZE = 4,
    localparam IN_SIZE = 1<<OUT_SIZE
)(
    input logic [IN_SIZE-1:0] in,
    output logic [OUT_SIZE-1:0] out,
    input logic enable
);

    integer i;
    always_comb begin
        out = 0;
        if(enable) begin
            for (i = 0; i < IN_SIZE-1; i++)
                if (in[i])
                    out |= i;
        end
    end
endmodule


// переписать код, задавать out значения от входов*
// 16 разница |= или =, какая их схем будет проще


/*
module encoder2 #(
    parameter N=8
)(
    input logic [N-1:0] in,
    output logic [$clog2(N)-1:0] out,
    input logic enable
);

    integer i;
    always_comb begin
        out = 0;
        if(enable) begin
            for (i = N - 1, i >= 0, i = i - 1)
            if (!in[i]) begin
                out = i;
            end
        end
    end

endmodule
*/

 /*
 out = 0;
    for (i = N - 1; i > 0; i = i - 1) begin
      if (in[i] && !out)
        out = i;
    end
*/


