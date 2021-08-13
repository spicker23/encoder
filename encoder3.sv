module encoder #(
    parameter OUT_SIZE = 4,
    localparam IN_SIZE = 1<<OUT_SIZE
)(
    input logic [IN_SIZE-1:0] in,
    output logic [OUT_SIZE-1:0] out,
    input logic enable
);
    logic [OUT_SIZE-1:0] rom_int    [IN_SIZE-1:0]; // массив шин

    integer i, j;
    genvar i_gen;   // блок для генерации ...

    generate;
        for (i_gen = 0; i_gen < IN_SIZE; i_gen++)
            rom_int[i_gen] = i_gen; // получили нумерованный список
    endgenerate

    always_comb begin
        for (i = 0; i < OUT_SIZE; i++) begin // на каждой итерации формируем одно значение выхода
            out[i] = '0;    // ' выравненное количество нулей с Out[i]
            for (j = 0; j < IN_SIZE; j++) begin //
                out[i] |= in[j] & rom_int[j][i];
            end
        end
    end



endmodule
