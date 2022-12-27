`define TimeExpire 32'd250000

module FrequencyDivider(clk,rst,clk_div);
input clk,rst;
output clk_div;

reg clk_div;
reg [31:0] count;

always@(posedge clk or negedge rst)
begin
if(!rst)
begin
count <=32'd0;
clk_div <= 1'b0;
end
else
begin
  if(count == `TimeExpire)
  begin
	 count <=32'd0;
    clk_div <= ~clk_div;
  end
  else
  begin
	 count <= count + 32'd1;
  end
end
end
endmodule 