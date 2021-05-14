module PISO_SR(in_word, SHIFT_LD, CLK, out_bit);
input [3+3:0]in_word;
input CLK, SHIFT_LD;
output out_bit;
wire [3+3-1:0]D_out;
wire [3+3-1:0]S_out;

D_FF D6(in_word[6], CLK, D_out[5]);
Sel S5(in_word[5], D_out[5], SHIFT_LD, CLK, S_out[5]);
D_FF D5(S_out[5], CLK, D_out[4]);
Sel S4(in_word[4], D_out[4], SHIFT_LD, CLK, S_out[4]);
D_FF D4(S_out[4], CLK, D_out[3]);
Sel S3(in_word[3], D_out[3], SHIFT_LD, CLK, S_out[3]);
D_FF D3(S_out[3], CLK, D_out[2]);
Sel S2(in_word[2], D_out[2], SHIFT_LD, CLK, S_out[2]);
D_FF D2(S_out[2], CLK, D_out[1]);
Sel S1(in_word[1], D_out[1], SHIFT_LD, CLK, S_out[1]);
D_FF D1(S_out[1], CLK, D_out[0]);
Sel S0(in_word[0], D_out[0], SHIFT_LD, CLK, S_out[0]);
D_FF D0(S_out[0], CLK, out_bit);

endmodule