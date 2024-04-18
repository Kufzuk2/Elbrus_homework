module 3_div
#(
    parameter DATA_W = 8
)

(
    output divisibility,
    input [(DATA_W - 1): 0] data
);

    localparam power = $clog2(DATA_W);
    /*
    if (2  **  power == DATA_W)
    begin
        localparam CUR_DATA = DATA_W;
    end


    else if
    begin
        
        localparam CUR_DATA = 2 ** (power + 1);
    end
*/

    begin

    reg [(power - 1): 0]  odd;
    reg [(power - 1): 0] even;
    reg [(power - 1): 0]  res;




    always @*
        begin

        for (int i = 0; i < DATA_W; i = i + 2)
        begin
            even = even + data[i]; 
        end

        for (int i = 1; i < DATA_W; i = i + 2)
        begin
            odd  =  odd + data[i]; 
        end

        res = (even & odd) + !(even ^ odd);

        

    end





    
