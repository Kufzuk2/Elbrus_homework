module 3_div
#(
    parameter DATA_W = 8
)

(
    output divisibility,
    input [(DATA_W - 1): 0] data
);

    assign even = data[0] + data[2] + data[4] + data[6];
    assign  odd = data[1] + data[3] + data[5] + data[7];

    if (even < odd)
        assign new_data = odd  - even; // 4 bits     
    else
        assign new_data = even -  odd; // 4 bits     



    assign final_data = new_data[0] + new_data[2] - new_data[1] - new_data[3]; // 2 bits
    
    divisibility = (final_data[0] == final_data[1]);
endmodule


