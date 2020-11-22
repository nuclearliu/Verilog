module ripplecounter(Q0,Q1,Q2,Q3,CP, Rd); //Ripple counter
output Q0,Q1,Q2,Q3;
input CP, Rd;
D_FF FF0(Q0, ~Q0, CP, Rd);
D_FF FF1(Q1, ~Q1, Q0, Rd);
D_FF FF2(Q2, ~Q2, Q1, Rd);
D_FF FF3(Q3, ~Q3, Q2, Rd);
endmodule

module D_FF (Q,D,CP,Rd); //module D_FF with asynchronous reset
output Q;
input D,CP,Rd;
reg Q;
always @(posedge CP or negedge Rd)
if (~Rd) Q <= 1'b0;
else Q <= D;
endmodule