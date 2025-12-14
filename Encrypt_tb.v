module test_tb;
  reg clk;
  reg rst;
  reg [127:0] in3;
  wire [127:0] out3;
  reg [255:0] key3;

  Encrypt c (
      clk,
      rst,
      in3,
      key3,
      out3
  );

  integer i;


  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, test_tb);

    $monitor("in256= %h, key256= %h, out256= %h", in3, key3, out3);

    // Initialize reset and clock
    rst = 1;
    clk = 0;
    #10 rst = 0;

    // Scenario 1: Basic input
    in3  = 128'h00000101030307070f0f1f1f3f3f7f7f;
    key3 = 256'h9b5c4d9d0898a850babe4c9336a7ee9dffb3ba8ad90afb5d41380ab46ed46fdf;
    #300;

    // Scenario 2: Multiple test cases in a loop
    for (i = 0; i < 10; i = i + 1) begin
      in3 = 128'h00000101030307070f0f1f1f3f3f7f7f + i * 128'h01010101010101010101010101010101;
      key3 = 256'h9b5c4d9d0898a850babe4c9336a7ee9dffb3ba8ad90afb5d41380ab46ed46fdf + i * 256'h0202020202020202020202020202020202020202020202020202020202020202;
      #300;
    end

    // Scenario 3: Edge cases
    in3  = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;  // All 1's
    key3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;  // All 0's
    #300;

    in3  = 128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;  // Alternating 1's and 0's
    key3 = 256'h5555555555555555555555555555555555555555555555555555555555555555;
    #300;

    in3  = 128'h55555555555555555555555555555555;  // Alternating 0's and 1's
    key3 = 256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    #300;

    // Scenario 4: Randomized test cases
    for (i = 0; i < 5; i = i + 1) begin
      in3  = $random;
      key3 = {$random, $random};
      #300;
    end

    $finish;
  end

  // Generate clock signal
  always #10 clk = ~clk;

endmodule
