module UART_testbench();
reg [3:0]out_word;
reg data_ready, CLK1, CLK2;
wire tx_flag, in_bit;
wire rx_flag, b_flag, p_flag;
wire [3:0]rx_word;

Processor_TX P1(out_word, data_ready, CLK1, tx_flag, in_bit);
Processor_RX P2(in_bit, CLK2, rx_flag, b_flag, p_flag, rx_word);

always #50 CLK1 = ~CLK1;
always #50 CLK2 = ~CLK2;

initial
begin
    out_word = 4'b1011;
    data_ready = 1;
    CLK1 <= 1;
    CLK2 <= 1;
    
    #(100 * 8) data_ready <= 0;
end

endmodule