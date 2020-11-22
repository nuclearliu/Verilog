module Up_DownCounter (Q,CP,Up_Down, CR); //IEEE 1364—1995 Syntax
input CP,Up_Down, CR; //输入端口声明
output [2:0]Q; //输出端口声明
wire UP,CP1,CP2; //中间节点声明
wire S1,S2,S3, S5,S6,S7, notQ2;
JK_FF FF0(1'b1, 1'b1, CP, Q[0], S1, CR);
JK_FF FF1(1'b1, 1'b1, CP1, Q[1], S5, CR);
JK_FF FF2(1'b1, 1'b1, CP2, Q[2], notQ2, CR);
and (S2, Q[0], Up_Down);
not (Up, Up_Down);
and (S3, S1, Up);
or (CP1, S2, S3);
and (S6, Q[1], Up_Down);
and (S7, S5, Up);
or (CP2, S6, S7);
endmodule

module JK_FF (J,K,CP,Q,Qnot,CR); //参见例6.6.6
output Q,Qnot;
input J,K,CP, CR;
reg Q;
assign Qnot = ~ Q ;
always @(posedge CP, negedge CR)
if (~CR) Q <= 0;
else begin
case ({J,K}) //根据J、K的值进行选择
2'b00: Q <= Q;
2'b01: Q <= 1'b0;
2'b10: Q <= 1'b1;
2'b11: Q <= ~ Q;
endcase
end
endmodule