module memory
#(
    parameter    DATA_W = 8;
    parameter  MEM_SIZE = 6;
    parameter ADDR_SIZE = $clog2(MEM_SIZE) + 1;
)

(
    input write;
    input  read;
    input clock;

    output [(DATA_W    - 1): 0] dataout;
    input  [(DATA_W    - 1): 0]  datain;
    input  [(ADDR_SIZE - 1): 0]  addr_w;
    input  [(ADDR_SIZE - 1): 0]  addr_r;
);

    reg [(MEM_SIZE - 1): 0] memory [(DATA_W - 1): 0];

    always @(posedge clock)
    begin 
    
        if (read & write)
        begin
            dataout <= memory[addr_w];
            memory[addr_w]  <= datain;
        end


        else if (read) 
        begin
            dataout <= memory[addr_w];
        end


        else if (write)
        begin
            memory[addr_w]  <= datain;
        end

    end
end
