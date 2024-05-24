module mux81(count,din,ds);
input [7:0]din;
input [2:0]count;
output ds;

reg ds;
always @(*)
case(count)
3'd0:ds<=din[0];
3'd1:ds<=din[1];
3'd2:ds<=din[2];
3'd3:ds<=din[3];
3'd4:ds<=din[4];
3'd5:ds<=din[5];
3'd6:ds<=din[6];
3'd7:ds<=din[7];

default:ds<=1'b0;
endcase

endmodule