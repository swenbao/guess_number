module Controller(state,digit,keypadBuf,q1,q2,q3,q4,a1,a2,a3,a4);

input state;
input [3:0] digit;
input [3:0] keypadBuf;
output [3:0] q1,q2,q3,q4,a1,a2,a3,a4;

reg [3:0] q1,q2,q3,q4,a1,a2,a3,a4;
reg [3:0] error;

always@(keypadBuf)
begin
   if(!state)
	   begin
		   case(digit)
			   4'b0001:q1=keypadBuf;
				4'b0010:q2=keypadBuf;
				4'b0100:q3=keypadBuf;
				4'b1000:q4=keypadBuf;
				default:error=keypadBuf;
			endcase
		end
	else
	   begin
		   case(digit)
			   4'b0001:a1=keypadBuf;
				4'b0010:a2=keypadBuf;
				4'b0100:a3=keypadBuf;
				4'b1000:a4=keypadBuf;
				default:error=keypadBuf;
			endcase
		end
end
endmodule 