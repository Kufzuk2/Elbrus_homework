module div
#(
    parameter DATA_W = 8
)

(
    input [(DATA_W - 1): 0] data_0,
    output divisibility
);

    localparam power = $clog2(DATA_W);
    localparam res_size = DATA_W;
    
    reg [(power - 1): 0]  odd = 0;
    reg [(power - 1): 0] even = 0;

    localparam i_max = $clog2($clog2(DATA_W));
    wire [i_max - 1: 0][DATA_W - 1: 0] res;
    assign res[0] = data;


    genvar i;
    generate

        for (i = 0; i < i_max; i = i + 1)
        begin
        always
        begin

            for (integer N = 0; N < DATA_W; N = N + 2)
            begin
                even = even + res[i][N]; 
            end

            for (integer N = 1; N < DATA_W; N = N + 2)
            begin
                odd  =  odd + res[i][N]; 
            end

            res[i + 1] = (even < odd) ? odd - even: even - odd;
            even = 0;
            odd  = 0;
        end
        end
    endgenerate

    

      assign divisibility = ~res[i_max - 1];

endmodule





    
