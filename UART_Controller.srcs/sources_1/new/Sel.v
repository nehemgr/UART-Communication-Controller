module Sel(bit_in, D_out, SHIFT_LD, CLK, out);
input bit_in, D_out, SHIFT_LD, CLK;
output out;
reg out;

always@(CLK)
begin
    if (SHIFT_LD == 0)
        out = bit_in;
    else if (SHIFT_LD == 1)
        out = D_out;
end

endmodule