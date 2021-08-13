module encoder #(
    parameter OUT_SIZE = 2,
    parameter IN_SIZE = 1<<OUT_SIZE
)(
    input logic [IN_SIZE-1:0] in,
    output logic [OUT_SIZE-1:0] out,
    input logic enable
);


    always_comb begin

        out = 0;
        if(enable) begin
		  logic [OUT_SIZE-1:0] i;
            for (i = 0; i < IN_SIZE-1; i++)
                if (in[i])
                    //out |= i;
					out = i;
			/*out[0] = in[1] | in[3];
			out[1] = in[2] | in[3];*/
        end

    end
endmodule

// На 2-х вложенных циклах для универсального случая (строчки должны выполнять то же что и строки 20-21).

    integer i;
    always_comb begin
        out = 0;
        if(enable) begin
            for (i = 0; i < IN_SIZE-1; i++)
                if (in[i])
                    out |= i;
        end
    end
