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
