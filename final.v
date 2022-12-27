module final(state,digit,clk,keypadCol,rst,keypadRow,show,match,o1,o2,o3,o4,o5,digit_4,digit_3,digit_2,digit_1,digit_state);

input state,clk,rst,match,show;
input [3:0] digit,keypadCol;
input digit_4,digit_3,digit_2,digit_1;

output [3:0] keypadRow;
output [6:0] o1,o2,o3,o4,o5;
output [1:0] digit_state;

wire div_clk;
wire [3:0] q1,q2,q3,q4,a1,a2,a3,a4;
wire [2:0] r_a,r_b;
wire [3:0] keypadBuf;

FrequencyDivider fd(clk,rst,div_clk);
Checkkeypad cp(div_clk,rst,keypadRow,keypadCol,keypadBuf);
Controller md(state,digit,keypadBuf,q1,q2,q3,q4,a1,a2,a3,a4,digit_4,digit_3,digit_2,digit_1,div_clk,digit_state);
Match mt(q1,q2,q3,q4,a1,a2,a3,a4,r_a,r_b,match);
SevenDisplay sd(r_a,r_b,o1,o2,o3,o4,show,keypadBuf,o5);

endmodule 