//`include "mul2.v"

module mul3(
  input [7:0] x,
  output [7:0] y
);

  wire [7:0] mul2out;
  mul2 mul2(.x(x), .y(mul2out));
  assign y = mul2out ^ x;
endmodule

