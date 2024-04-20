`timescale 1ns/100ps
module testbench();
  
	wire [7:0] DATAOUT;
  	reg  [7:0]  DATAIN;  
  	reg  [2:0]  addr_r;
  	reg  [2:0]  addr_w;
  	reg          write;
  	reg           read;
	reg  clock =  1'b1;
    

	always begin
		#5 clock = ~clock;
	end

  	memory memory ( .write(write), .read(read), .clock(clock), .dataout(DATAOUT), .datain(DATAIN), .addr_w(addr_w), .addr_r(addr_r) );
  
	initial begin 
		$dumpfile("dump.vcd"); $dumpvars;
	end
	
	initial begin
		#10; write  =    1;   read =    0;
		#20; addr_w = 3'd0; DATAIN = 8'h0;
        #10; addr_w = 3'd5; DATAIN = 8'h5;
        #20; addr_w = 3'd5; addr_r = 3'd5; DATAIN = 8'h8;
        #10; addr_r = 3'd0;

        #10; write  =    1;   read =    1;
        #10; addr_w = 3'd7; DATAIN = 8'h4; // invalid adress
        #20; addr_w = 3'd5; addr_r = 3'd5; DATAIN = 8'h8;
        #10; addr_w = 3'd4; addr_r = 3'd0; DATAIN = 8'h10;

        #10; write  =    1;   read =     0;
        #20; addr_w = 3'd3; DATAIN = 8'h40;
        #10; addr_w = 3'd1; DATAIN = 8'h70;
        #10; addr_w = 3'd2; DATAIN = 8'h4;
        
        #10; write  =    0;   read =     0;
        #20; addr_w = 3'd3; DATAIN = 8'h40;
        #10; addr_w = 3'd1; DATAIN = 8'h70;
        #10; addr_w = 3'd2; DATAIN = 8'h4;

        write = 0; read = 1;
        #20; addr_r = 3'd0;
        #10; addr_r = 3'd5;
        #10; addr_r = 3'd2;
        #10; addr_r = 3'd4;
        #10; addr_r = 3'd1;
        #10; addr_r = 3'd3;
        #10; addr_r = 3'd7; // invalid adress
        #10; $finish;
    end

endmodule
