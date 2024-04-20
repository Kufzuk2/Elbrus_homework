`timescale 1ns/100ps

module testbench
#(
    parameter DATA_W = 8
)
();

    reg  [DATA_W - 1:0] data;
    reg  clock    =     1'b1;

    wire divisibility;


    always
    begin
        #5 clock = ~clock;
    end

    div div (.data(data), .divisibility(divisibility));

    initial begin
    $dumpfile ("dump.vcd"); $dumpvars;
    end


    initial begin
        
        #10; data = 8'd0; #10;
        $display("if data = %d, divisibility = %d", data, divisibility);
        
        #10; data = 8'd1; #10;
        $display("if data = %d, divisibility = %d", data, divisibility);
        
        #10; data = 8'd3; #10;
        $display("if data = %d, divisibility = %d", data, divisibility);
        
        #10; data = 8'd8; #10;
        $display("if data = %d, divisibility = %d", data, divisibility);
        
        #10; data = 8'd11; #10;
        $display("if data = %d, divisibility = %d", data, divisibility);
        
        #10; data = 8'd15; #10;
        $display("if data = %d, divisibility = %d", data, divisibility);
        
        #10; data = 8'd171; #10;
        $display("if data = %d, divisibility = %d", data, divisibility);
        
        #10; data = 8'd255; #10;
        $display("if data = %d, divisibility = %d", data, divisibility);
        
        #10; data = 8'd115; #10;
        $display("if data = %d, divisibility = %d", data, divisibility);
        
        #10; data = 8'd222; #10;
        $display("if data = %d, divisibility = %d", data, divisibility);

        $finish;
    end
endmodule
