module clear(state,match,in,keypadBuf);

input state,match;
input [3:0] in;
output reg[3:0] keypadBuf;	

always@(posedge state or posedge match)
begin
	keypadBuf <= 4'h0;
end
endmodule		
