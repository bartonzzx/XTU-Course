module hadder(a,b,cout,sum);
 output cout;
 output sum;
 input a,b;
 /*Begin*/
assign {cout,sum} = a + b;


/*End*/
endmodule