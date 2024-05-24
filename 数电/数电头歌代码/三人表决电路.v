module JG3(ABC,X,Y);
	//input Port(s)
	input [2:0] ABC;
	//output Port(s)
	output X, Y;
	reg X, Y;
	//Additional Module Item(s)
	always@(ABC)
    // 请在下面添加代码，实现满足三人表决器真值表;
        /********** Begin *********/
    case(ABC)
    3'b 000:begin X <= 0;Y <= 1;end
    3'b 001:begin X <= 0;Y <= 0;end
    3'b 010:begin X <= 0;Y <= 0;end
    3'b 011:begin X <= 0;Y <= 0;end
    3'b 100:begin X <= 0;Y <= 0;end
    3'b 101:begin X <= 1;Y <= 0;end
    3'b 110:begin X <= 1;Y <= 0;end
    3'b 111:begin X <= 1;Y <= 0;end
    endcase
        /********** End *********/
endmodule