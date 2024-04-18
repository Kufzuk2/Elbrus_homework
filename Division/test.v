
module test
#(
    parameter DATA_W = 8;
)

();

    wire OUT;
    wire [(DATA_W - 1): 0] IN;

    3_div 3_div (.data(IN), .divisibility(OUT));

    initial begin
        $dumpfile

    end
