module Controller(state,digit,keypadBuf,q1,q2,q3,q4,a1,a2,a3,a4,digit_4,digit_3,digit_2,digit_1,clock,digit_state);

input state;
input [3:0] digit;
input [3:0] keypadBuf;
output [3:0] q1,q2,q3,q4,a1,a2,a3,a4;

reg [3:0] q1,q2,q3,q4,a1,a2,a3,a4;
reg [3:0] error;

//------------------
input digit_4,digit_3,digit_2,digit_1;
output reg [3:0]digit_state;
reg [1:0]next_state;
parameter d_4 = 3,d_3 = 2,d_2 = 1,d_1 = 0;
input clock;


always@(posedge clock)
begin

digit_state = next_state;

end


always@(digit_4 or digit_3 or digit_2 or digit_1)
begin
	
	if(!digit_4)
		next_state <= d_4;
	else if(!digit_3)
		next_state <= d_3;
	else if(!digit_2)
		next_state <= d_2;
	else if(!digit_1)
		next_state <= d_1;
	else
		next_state <= digit_state;

end

always@(keypadBuf)
begin
   if(!state) //question
	   begin
		   case(digit_state)
			   d_1:q1=keypadBuf;
				d_2:q2=keypadBuf;
				d_3:q3=keypadBuf;
				d_4:q4=keypadBuf;
			endcase
		end
	else //answer
	   begin
		   case(digit_state)
			   d_1:a1=keypadBuf;
				d_2:a2=keypadBuf;
				d_3:a3=keypadBuf;
				d_4:a4=keypadBuf;
			endcase
		end
end



//---------------------------------
/*always@(keypadBuf)
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
end*/


endmodule 