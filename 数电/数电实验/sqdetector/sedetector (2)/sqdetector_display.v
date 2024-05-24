//*************************************************************************
//   > �ļ���: sqdetector_display.v
//   > ����  �����м������ʾģ�飬����FPGA���ϵ�IO�ӿںʹ�����
//   > ����  : �ɽ�
//   > ����  : 2021-02-18
//*************************************************************************
module sqdetector_display(
    //ʱ���븴λ�ź�
     input clk,
    input resetn,    //��׺"n"����͵�ƽ��Ч

    //���뿪�أ�����ѡ��������
    input  input_sel, //0:����Ϊ���м����Ԥ������(setd)
                           //1:����Ϊ�����źŷ�����Ԥ������(din)                        
    
   //���忪�أ����ڲ�������clock��ʵ�ֵ���ִ��
    input clock,
   
    //���м�������ݼ���������
    output dc,
    //���м����״̬�������
    output [3:0] c,

    //��������ؽӿڣ�����Ҫ����
    output lcd_rst,
    output lcd_cs,
    output lcd_rs,
    output lcd_wr,
    output lcd_rd,
    inout[15:0] lcd_data_io,
    output lcd_bl_ctr,
    inout ct_int,
    inout ct_sda,
    output ct_scl,
    output ct_rstn
    );
//-----{����sqdetectorģ��}begin
    reg   [7:0] setd;     // sqdetector8λԤ���������
    wire  ds;
    sqdetector sqd(.ds(ds),.setd(setd),.clk(clock),.clrn(resetn),.dc(dc),.c(c));
//-----{����sqdetectorģ��}end

//-----{����sequencerģ��}begin
    reg   [7:0] din;  // sequencerԤ�����������
    
    sequencer sequencer_module(.clk(clock),.clrn(resetn),.din(din),.ds(ds));
//-----{����sequencerģ��}end

//---------------------{���ô�����ģ��}begin--------------------//
//-----{ʵ����������}begin
//��С�ڲ���Ҫ����
    reg         display_valid;
    reg  [39:0] display_name;
    reg  [31:0] display_value;
    wire [5 :0] display_number;
    wire        input_valid;
    wire [31:0] input_value;

    lcd_module lcd_module(
        .clk            (clk           ),   //10Mhz
        .resetn         (resetn        ),

        //���ô������Ľӿ�
        .display_valid  (display_valid ),
        .display_name   (display_name  ),
        .display_value  (display_value ),
        .display_number (display_number),
        .input_valid    (input_valid   ),
        .input_value    (input_value   ),

        //lcd��������ؽӿڣ�����Ҫ����
        .lcd_rst        (lcd_rst       ),
        .lcd_cs         (lcd_cs        ),
        .lcd_rs         (lcd_rs        ),
        .lcd_wr         (lcd_wr        ),
        .lcd_rd         (lcd_rd        ),
        .lcd_data_io    (lcd_data_io   ),
        .lcd_bl_ctr     (lcd_bl_ctr    ),
        .ct_int         (ct_int        ),
        .ct_sda         (ct_sda        ),
        .ct_scl         (ct_scl        ),
        .ct_rstn        (ct_rstn       )
    ); 
//-----{ʵ����������}end

//-----{�Ӵ�������ȡ����}begin
//����ʵ����Ҫ��������޸Ĵ�С�ڣ�
//�����ÿһ���������룬��д����һ��always��
    //��input_selΪ0ʱ����ʾ����Ϊ���м����Ԥ������(setd)
    always @(posedge clk)
    begin
        if (!resetn)
        begin
            setd <= 4'd0;
        end
        else if (input_valid && input_sel==1'b0)
        begin
            setd <= input_value[7:0];
        end
    end
    
   //��input_selΪ1ʱ����ʾ������Ϊ�����źŷ�����Ԥ������(din)
    always @(posedge clk)
    begin
        if (!resetn)
        begin
            din <= 32'b0;
        end
        else if (input_valid && input_sel==1'b1)
        begin
            din <= input_value[7:0];
        end
    end
//-----{�Ӵ�������ȡ����}end

//-----{�������������ʾ}begin
//������Ҫ��ʾ�����޸Ĵ�С�ڣ�
//�������Ϲ���44����ʾ���򣬿���ʾ44��32λ����
//44����ʾ�����1��ʼ��ţ����Ϊ1~44��
    always @(posedge clk)
    begin
        case(display_number)
            6'd1 :
            begin
                display_valid <= 1'b1;
                display_name  <= "CLRN";
                display_value <= resetn;
            end
            6'd3 :
            begin
                display_valid <= 1'b1;
                display_name  <= "SETD";
                display_value <= {24'b0,setd};
            end
            6'd4 :
            begin
                display_valid <= 1'b1;
                display_name  <= "DIN";
                display_value <= {24'b0,din};
            end
            6'd5 :
            begin
                display_valid <= 1'b1;
                display_name  <= "C";
                display_value <= {28'b0,c};
            end
            6'd6 :
            begin
                display_valid <= 1'b1;
                display_name  <= "DC";
                display_value <= dc;
            end                   
            default :
            begin
                display_valid <= 1'b0;
                display_name  <= 40'd0;
                display_value <= 32'd0;
            end
        endcase
    end
//-----{�������������ʾ}end
//----------------------{���ô�����ģ��}end---------------------//
endmodule
