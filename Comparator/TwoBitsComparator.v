module Comparator(input A, B, output GT, ET, LT);
	assign GT = (A > B);
	assign ET = (A == B);
	assign LT = (A < B);
endmodule

module TwoBitsComparator(input A1, A0, B1, B0, output GT, ET, LT);
	wire GT1, ET1, LT1, GT0, ET0, LT0, w1, w2;
	Comparator C0(A0, B0, GT0, ET0, LT0);
	Comparator C1(A1, B1, GT1, ET1, LT1);
	and (w1, ET1, GT0);
	and (w2, ET1, LT0);
	and (ET, ET1, ET0);
	or (GT, GT1, w1);
	or (LT, LT1, w2);
endmodule
