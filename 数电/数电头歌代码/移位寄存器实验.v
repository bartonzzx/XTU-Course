module shifter(din,s,srsi,slsi,clk,clrn,dout);
input[7:0] din;
input[1:0] s;
input srsi,slsi,clk,clrn;
output[7:0] dout;
reg[7:0] dout;
/*begin*/
always @ (posedge clk or negedge clrn)
begin
    if(clrn == 0)
        dout = 0;
    else
    begin
        case(s)
        2'b00:dout = dout;
        2'b10:begin dout = (dout >> 1);dout[7] = srsi;end
        2'b01:begin dout = (dout << 1);dout[0] = slsi;end
        2'b11:dout = din;
        endcase
    end
end



/*end*/
endmodule