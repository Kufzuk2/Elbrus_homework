module memory
#(
    parameter    DATA_W = 8,
    parameter  MEM_SIZE = 6,
    parameter ADDR_SIZE = $clog2(MEM_SIZE)
)

(
    input write,
    input  read,
    input clock,

    output reg [(DATA_W    - 1): 0] dataout,
    input      [(DATA_W    - 1): 0]  datain,
    input      [(ADDR_SIZE - 1): 0]  addr_w,
    input      [(ADDR_SIZE - 1): 0]  addr_r
);

    reg [(MEM_SIZE - 1): 0] memory [(DATA_W - 1): 0];

    always @(posedge clock)
    begin 
    
        if (read & write)
        begin
            if (addr_r < MEM_SIZE)
            begin
                dataout <= memory[addr_r];
                memory[addr_w]  <= datain;
            end
            else
                dataout <= 0;
        end


        else if (read) 
        begin
            if (addr_r  <  MEM_SIZE)
                dataout <= memory[addr_r];
            else
                dataout <= 0;
        end


        else if (write)
        begin
            if (addr_w < MEM_SIZE)
                memory[addr_w]  <= datain;
        end

    end
endmodule

