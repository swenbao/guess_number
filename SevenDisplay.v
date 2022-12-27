module SevenDisplay(r_a,r_b,o1,o2,o3,o4,show,keypadBuf,o5);

input [2:0] r_a,r_b;
input show;
input [3:0] keypadBuf;
output [6:0] o1,o2,o3,o4,o5;

reg [6:0] o1,o2,o3,o4,o5;

always@(*)
begin
   case(keypadBuf)
				4'd0: o5 <= 7'b1000000;
				4'd1: o5 <= 7'b1111001;
				4'd2: o5 <= 7'b0100100;
				4'd3: o5 <= 7'b0110000;
				4'd4: o5 <= 7'b0011001;
				4'd5: o5 <= 7'b0010010;
				4'd6: o5 <= 7'b0000010;
				4'd7: o5 <= 7'b1011000;
				4'd8: o5 <= 7'b0000000;
				4'd9: o5 <= 7'b0010000;
				4'd10: o5 <= 7'b0001000;
				4'd11: o5 <= 7'b0000011;
				4'd12: o5 <= 7'b1000110;
				4'd13: o5 <= 7'b0100001;
				4'd14: o5 <= 7'b0000110;
				4'd15: o5 <= 7'b0001110;
			endcase 
   if(!show)
	   begin
		   o1=7'b0000011;
			o2=7'b1000000;
			o3=7'b0001000;
			o4=7'b1000000;
		end
	else
	begin
	   case(r_a)
         0:o4=7'b1000000;
         1:o4=7'b1111001;
         2:o4=7'b0100100;
         3:o4=7'b0110000;
         4:o4=7'b0011001;
         default:o4=7'b1000000;
      endcase
	   o3=7'b0001000;
		case(r_b)
         0:o2=7'b1000000;
         1:o2=7'b1111001;
         2:o2=7'b0100100;
         3:o2=7'b0110000;
         4:o2=7'b0011001;
         default:o2=7'b1000000;
      endcase
		o1=7'b0000011;
	end
end
endmodule 