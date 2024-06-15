module nonblocking (q4, d, clk, rstn);

output q4;
input d;
input clk;
input rstn;

reg q4, q3, q2, q1;

always @(posedge clk or negedge rstn) // low activate async reset
begin
	if(!rstn) begin 
	   q1 <= 0;
	   q2 <= 0;
	   q3 <= 0;
	   q4 <= 0;
	end 
	else begin
	   q1 <= d;
	   q2 <= q1;
	   q3 <= q2;
	   q4 <= q3;
	end
end

endmodule