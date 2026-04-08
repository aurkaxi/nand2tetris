module tb_Bit;

  logic clk;
  logic in, load, out;

  Bit dut (
      .in  (in),
      .load(load),
      .out (out),
      .clk (clk)
  );

  task automatic step(input logic i_in, input logic i_load, input logic expected_out);
    in   = i_in;
    load = i_load;

    clk  = 1;
    #5;

    clk = 0;
    #5;

    if (out !== expected_out) begin
      $display("FAIL! Input: %b, Load: %b | Expected: %b | Got: %b", i_in, i_load, expected_out,
               out);
    end else begin
      $display("PASS: Input: %b, Load: %b -> Out: %b", i_in, i_load, out);
    end
  endtask

  initial begin
    clk = 0;
    step(0, 0, 0);  // Start: 0
    step(0, 1, 0);  // Load 0: 0
    step(1, 0, 0);  // Try load 1 (load=0): remains 0
    step(1, 1, 1);  // Load 1: 1
    step(0, 0, 1);  // Try load 0 (load=0): remains 1
    step(1, 0, 1);  // Try load 1 (load=0): remains 1
    step(0, 1, 0);  // Load 0: 0
    step(1, 1, 1);  // Load 1: 1

    repeat (50) begin
      step(0, 0, 1);
    end

    step(0, 1, 0);  // Load 0: 0

    repeat (50) begin
      step(1, 0, 0);
    end
  end

endmodule
