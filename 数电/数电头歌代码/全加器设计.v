module fa_behavioral(a,b,ci,s,co);//考虑进位的加法器模块 
       input a,b;
       input ci;
       output  s;
       output co;
// 请在下面添加代码，完成一位全加器功能
/* Begin */
assign s=(a^b^ci);
assign co=a * b + (a ^ b) * ci;
/* End */

endmodule
