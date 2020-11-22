module Encoder8to3_bh(EI, I, Y, GS, EO);
input EI;
input [7:0] I;
output reg [2:0] Y;
output reg GS, EO;
always @(EI, I)
begin
	if (EI == 0) begin Y = 3'b000; GS = 0; EO = 0; end
	else begin
		GS = 1;
		EO = 0;
		if (I[7]) Y = 3'b111; 
		else if (I[6]) Y = 3'b110; 
		else if (I[5]) Y = 3'b101; 
		else if (I[4]) Y = 3'b100; 
		else if (I[3]) Y = 3'b011; 
		else if (I[2]) Y = 3'b010; 
		else if (I[1]) Y = 3'b001; 
		else if (I[0]) Y = 3'b000; 
		else begin Y = 3'b000; GS = 0; EO = 1; end
	end
end
endmodule