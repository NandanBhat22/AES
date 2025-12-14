module mul2(
  input [7:0] x,
  output reg [7:0] y
);

  always @(*) begin
    if (x[7] == 1) y = ((x << 1) ^ 8'h1b);
    else y = (x << 1);
  end
endmodule
