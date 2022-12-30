module clear(state,seven_reset,in,keypadBuf);

input seven_reset,state;
input [3:0] in;
output reg[3:0] keypadBuf;	

always@(seven_reset or in)
begin
	if(seven_reset != state)
	begin
		keypadBuf <= 4'h0;
	end
	else
	begin
		keypadBuf <= in;
	end
end
endmodule		
