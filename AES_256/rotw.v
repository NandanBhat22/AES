module rotw(in, out);
input [0:31] in;
output [0:31] out;

assign out = {in[8:31], in[0:7]};

endmodule
