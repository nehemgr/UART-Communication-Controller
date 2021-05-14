module Processor_RX(in_bit, CLK, rx_flag, b_flag, p_flag, data);
input in_bit, CLK;
output rx_flag, b_flag, p_flag;
output [3:0]data;
reg [3:0]data;
reg rx_flag = 0, b_flag = 0, p_flag = 0;
wire [3+3:0]out_word;
integer time_flag = 0, clock_count = -1;

SIPO_SR SP1(in_bit, CLK, out_word);

always@(posedge CLK)
begin
    if ((in_bit == 0) && (time_flag == 0))
        begin
        time_flag = 1;
        clock_count = -1;
        end
     
    if (time_flag == 1)
        begin
           clock_count = clock_count + 1; 
           if (clock_count == 7)
                begin
                    rx_flag = 1;
                    if (out_word[6] == 0)
                        b_flag = 1;
                    else if (out_word[4] ^ out_word[3] ^ out_word[2] ^ out_word[1] != out_word[5])
                        p_flag = 1;
                    else
                        data = out_word[4:1];
                    time_flag = 0;
                end
        end
end

endmodule