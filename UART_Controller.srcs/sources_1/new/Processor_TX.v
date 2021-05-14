module Processor_TX(in_word, data_ready, CLK, tx_flag, out_bit);
input [3:0]in_word;
input data_ready, CLK;
output tx_flag, out_bit;
reg tx_flag = 0;
reg [3+3:0]data = 7'b1111111;
reg SHIFT_LD = 0;
integer time_flag = 0, clock_count = -1;

PISO_SR PS1(data, SHIFT_LD, CLK, out_bit);

always@(posedge CLK)
begin
    if (data_ready == 0)
        begin
        data = 7'b1111111;
        end
    else if ((data_ready == 1) && (time_flag == 0))
        begin
            data[0] = 0;
            data[4:1] = in_word;
            data[5] = in_word[0] ^ in_word[1] ^ in_word[2] ^ in_word[3];
            data[6] = 1;
            //data[5] = 0; //Parity Flag Trigger
            //data[6] = 0; //Break Flag Trigger
            SHIFT_LD = 0;
            time_flag = 1;
            clock_count = -1;
        end
     
     if (time_flag == 1)
        begin
           clock_count = clock_count + 1; 
           if (clock_count == 1)
                SHIFT_LD = 1;
           else if (clock_count == 7)
                begin
                    data = 7'b1111111;
                    SHIFT_LD = 0;
                end
           else if (clock_count == 8)
                begin
                    tx_flag = 1;
                    time_flag = 0;
                end
        end
end

endmodule