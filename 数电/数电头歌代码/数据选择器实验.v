module mux21(a,b,s,y);
input a,b,s;
output y;
reg y;
/* Begin */
always @ (*)
begin
case(s)
1'b0:y = a;
1'b1:y = b;
endcase
end
/* End */
endmodule

