module div
#(
    parameter DATA_W = 8

)
(
    input [(DATA_W - 1): 0] data,
    output divisibility
);
    localparam NEW_DATA_W = $clog2(DATA_W);
    wire [NEW_DATA_W - 1: 0]      new_data;
    wire [NEW_DATA_W - 1: 0]          even;
    wire [NEW_DATA_W - 1: 0]           odd;

    assign even = data[0] + data[2] + data[4] + data[6];
    assign  odd = data[1] + data[3] + data[5] + data[7];

    assign new_data = (even < odd) ? odd - even: even - odd; 


    // just check if new_data = 0, 3 or 6;
    // div = (~A)(~B)(~C) | AB(~C) | (~A)BC = ~(A | B | C) | B(A ^ B)
    assign divisibility = ~(new_data[0] |  new_data[1] | new_data[2]) | 
                            new_data[1] & (new_data[0] ^ new_data[2]);
endmodule

