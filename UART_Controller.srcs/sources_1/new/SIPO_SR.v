module SIPO_SR(in_bit, CLK, out_word);
input in_bit, CLK;
output [3+3:0]out_word;

D_FF D6(in_bit, CLK, out_word[6]);
D_FF D5(out_word[6], CLK, out_word[5]);
D_FF D4(out_word[5], CLK, out_word[4]);
D_FF D3(out_word[4], CLK, out_word[3]);
D_FF D2(out_word[3], CLK, out_word[2]);
D_FF D1(out_word[2], CLK, out_word[1]);
D_FF D0(out_word[1], CLK, out_word[0]);

endmodule