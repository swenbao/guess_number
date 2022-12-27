module Match(q1,q2,q3,q4,a1,a2,a3,a4,r_a,r_b,match);

input [3:0] q1,q2,q3,q4,a1,a2,a3,a4;
input match;
output [2:0] r_a,r_b;

reg [2:0] r_a,r_b;

always@(*)
begin
   if(!match)
	   begin
		   r_a=0;
			r_b=0;
		end
	else
	   begin
	   r_a=0;
      r_b=0;	
		r_a=(a1==q1)+(a2==q2)+(a3==q3)+(a4==q4);
		r_b=(a1==q2)+(a1==q3)+(a1==q4)
			  +(a2==q1)+(a2==q3)+(a2==q4)
			  +(a3==q1)+(a3==q2)+(a3==q4)
			  +(a4==q1)+(a4==q2)+(a4==q3);
		end
end
endmodule 