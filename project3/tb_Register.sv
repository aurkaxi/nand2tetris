module tb_Register;

  logic [15:0] in;
  logic load, clk;
  logic [15:0] out;

  // Instantiate the Unit Under Test (UUT)
  Register dut (
      .in  (in),
      .load(load),
      .clk (clk),
      .out (out)
  );

  // Task to simulate a Nand2Tetris tick-tock cycle
  // expected_out should be the value AFTER the clock cycle completes
  task automatic step(input logic [15:0] i_in, input logic i_load, input logic [15:0] expected_out);
    in   = i_in;
    load = i_load;

    // tick
    clk  = 1;
    #5;

    // tock
    clk = 0;
    #5;

    if (out !== expected_out) begin
      $display("FAIL! In: %d (0x%h), Load: %b | Expected: %d | Got: %d", $signed(i_in), i_in,
               i_load, $signed(expected_out), $signed(out));
    end else begin
      $display("PASS: In: %d, Load: %b -> Out: %d", $signed(i_in), i_load, $signed(out));
    end
  endtask

  initial begin
    clk  = 0;
    in   = 0;
    load = 0;

    step(16'd0, 0, 16'd0);  // Start: 0
    step(16'd0, 1, 16'd0);  // Load 0
    step(16'sd32123, 0, 16'd0);  // Try load -32123 with load=0 (Hold 0)
    step(16'd11111, 0, 16'd0);  // Try load 11111 with load=0 (Hold 0)
    step(16'sd32123, 1, 16'sd32123);  // Load -32123
    step(16'sd32123, 1, 16'sd32123);  // Refresh -32123
    step(16'sd32123, 0, 16'sd32123);  // Hold -32123
    step(16'd12345, 1, 16'd12345);  // Load 12345
    step(16'd0, 0, 16'd12345);  // Hold 12345
    step(16'd0, 1, 16'd0);  // Load 0

    for (int i = 0; i < 16; i++) begin
      automatic logic [15:0] val = (16'd1 << i);
      step(val, 0, (i == 0) ? 16'd0 : (16'd1 << (i - 1)));  // Hold previous
      step(val, 1, val);  // Load new
    end

    for (int i = 0; i < 16; i++) begin
      automatic logic [15:0] val = ~(16'd1 << i);
      step(val, 0, (i == 0) ? (16'd1 << 15) : ~(16'd1 << (i - 1)));  // Hold previous
      step(val, 1, val);  // Load new
    end
  end

endmodule












