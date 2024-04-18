module testbench();

    wire [7:0]   data,
    wire divisibility

    3_div 3_div (.data(data), .divisibility(divisibility));
	
    initial begin
        data = 8'd6;
        $display(divisibility);

    end

