module rcon(
input [3:0] in,
output reg [31:0] out
);

always @(*)
  case(in)
    4'h0: out = 32'h01000000;
    4'h1: out = 32'h02000000;
    4'h2: out = 32'h04000000;
    4'h3: out = 32'h08000000;
    4'h4: out = 32'h10000000;
    4'h5: out = 32'h20000000;
    4'h6: out = 32'h40000000;
    4'h7: out = 32'h80000000;
    4'h8: out = 32'h1b000000;
    4'h9: out = 32'h36000000;
    4'ha: out = 32'h6c000000;
    4'hb: out = 32'hd8000000;
    4'hc: out = 32'hab000000;
    4'hd: out = 32'h4d000000;
    4'he: out = 32'h9a000000;
    4'hf: out = 32'h2f000000;
    default: out = 32'h00000000;
  endcase
endmodule 
