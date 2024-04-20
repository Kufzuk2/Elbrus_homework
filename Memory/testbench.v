`timescale 1ns/100ps
module testbench();
  
	wire [7:0] dataout;
  	reg  [7:0]  datain;  
  	reg  [2:0]  addr_r;
  	reg  [2:0]  addr_w;
  	reg          write;
  	reg           read;
	reg  clock =  1'b1;
    

	always begin
		#5 clock = ~clock;
	end

  	memory memory ( .write(write), .read(read), .clock(clock), .dataout(dataout), .datain(datain), .addr_w(addr_w), .addr_r(addr_r) );
  
	initial begin 
		$dumpfile("dump.vcd"); $dumpvars;
	end
	
	initial begin
		#10; write  =    1;   read =    0;
		#20; addr_w = 3'd0; datain = 8'h0;
        #10; addr_w = 3'd5; datain = 8'h5;
        #20; addr_w = 3'd5; addr_r = 3'd5; datain = 8'h8;
        #10; addr_r = 3'd0;

        #10; write  =    1;   read =    1;
        #10; addr_w = 3'd7; datain = 8'h4; // invalid adress
        #20; addr_w = 3'd5; addr_r = 3'd5; datain = 8'h8; // same addr
        #10; addr_w = 3'd4; addr_r = 3'd0; datain = 8'h10; // different addr
        #10; addr_r = 3'd4;

        #10; write  =    1;   read =    0;
        #20; addr_w = 3'd6; addr_r = 3'd6; datain = 8'h9;
        #20; addr_w = 3'd6; addr_r = 3'd7; datain = 8'h10;
        #20; addr_w = 3'd3; datain = 8'h40;
        #10; addr_w = 3'd1; datain = 8'h70;
        #10; addr_w = 3'd2; datain = 8'h4;
        #10; addr_r = 3'd1;
        #10; addr_r = 3'd2;
        
        #10; write  =    0;   read =     0;
        #20; addr_w = 3'd5; addr_r = 3'd5; datain = 8'h8; // same addr
        #10; addr_w = 3'd4; addr_r = 3'd0; datain = 8'h10; // different addr
        #10; addr_w = 3'd3; datain = 8'h40;
        #10; addr_w = 3'd1; datain = 8'h70;
        #10; addr_w = 3'd2; datain = 8'h4;
        #10; addr_r = 3'd7;
        #10; addr_r = 3'd3;

        #10; write  =    0; read   =    1;
        #20; addr_w = 3'd5; addr_r = 3'd5; datain = 8'h8; // same addr
        #10; addr_w = 3'd4; addr_r = 3'd0; datain = 8'h10; // different addr
        #10; addr_w = 3'd3; datain = 8'h40;
        #10; addr_r = 3'd0;
        #10; addr_r = 3'd5;
        #10; addr_w = 3'd1; datain = 8'h70;
        #10; addr_w = 3'd2; datain = 8'h4;
        #10; addr_r = 3'd2;
        #10; addr_r = 3'd4;
        #10; addr_r = 3'd1;
        #10; addr_r = 3'd3;
        #10; addr_r = 3'd7; // invalid adress
        #10; $finish;
    end

endmodule
