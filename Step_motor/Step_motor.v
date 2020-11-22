module Step_motor(
input M,CP,nCR, // Input Ports
output reg A,B,C // Output Ports
);
reg [2:0] current_state, next_state;
// Parameter Declarations
parameter [2:0] S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100, S5=3'b101, S6=3'b110, S7=3'b111;

always @(posedge CP, negedge nCR)
begin
	if (~nCR) current_state <= S0;
	else current_state <= next_state;
end
always @(current_state, M)
begin
	{A, B, C} = current_state;
	case (current_state)
		S0: next_state = S1;
		S1: next_state = (M == 0) ? S5 : S3;
		S2: next_state = (M == 0) ? S3 : S6;
		S3: next_state = (M == 0) ? S1 : S2;
		S4: next_state = (M == 0) ? S6 : S5;
		S5: next_state = (M == 0) ? S4 : S1;
		S6: next_state = (M == 0) ? S2 : S4;
		S7: next_state = S6;
	endcase
end
endmodule

