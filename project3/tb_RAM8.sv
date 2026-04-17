module tb_RAM8;

  logic [15:0] in;
  logic load, clk;
  logic [ 2:0] address;
  logic [15:0] out;

  // Instantiate the Unit Under Test (UUT)
  // Assuming a RAM8 module: out = memory[address]
  RAM8 dut (
      .in     (in),
      .load   (load),
      .address(address),
      .clk    (clk),
      .out    (out)
  );

  // Task to simulate a synchronous Write (Tick-Tock)
  task automatic step(input logic [15:0] i_in, input logic i_load, input logic [2:0] i_addr,
                      input logic [15:0] expected_out);
    in      = i_in;
    load    = i_load;
    address = i_addr;

    // Pulse the clock (Tick)
    clk     = 1;
    #5;
    // (Tock)
    clk = 0;
    #5;

    if (out !== expected_out) begin
      $display("FAIL! Time: %0t | In: %d, Load: %b, Addr: %d | Expected: %d | Got: %d", $time,
               $signed(i_in), i_load, i_addr, $signed(expected_out), $signed(out));
    end else begin
      $display("PASS: Addr[%d] -> Out: %d", i_addr, $signed(out));
    end
  endtask

  // Task to simulate an Asynchronous Read (Address changes between ticks)
  task automatic check_read(input logic [2:0] i_addr, input logic [15:0] expected_out);
    address = i_addr;
    #1;  // Brief delay for combinational logic to settle
    if (out !== expected_out) begin
      $display("FAIL READ! Addr: %d | Expected: %d | Got: %d", i_addr, $signed(expected_out),
               $signed(out));
    end else begin
      $display("PASS READ: Addr[%d] -> Out: %d", i_addr, $signed(out));
    end
  endtask

  initial begin
    // Initialize signals
    clk     = 0;
    in      = 0;
    load    = 0;
    address = 0;

    $display("--- Starting RAM8 Simulation (Nand2Tetris Table) ---");

    // Table Time 0-2
    step(16'd0, 0, 3'd0, 16'd0);
    step(16'd0, 1, 3'd0, 16'd0);
    // Time 3-4: Load 11111 into Addr 1
    step(16'd11111, 0, 3'd0, 16'd0);
    step(16'd11111, 1, 3'd1, 16'd11111);

    // Time 5-7: Load 3333 into Addr 3
    step(16'd3333, 0, 3'd3, 16'd0);
    step(16'd3333, 1, 3'd3, 16'd3333);

    // Time 8: Check Addr 3 then Addr 1 (Asynchronous Read)
    check_read(3'd3, 16'd3333);
    check_read(3'd1, 16'd11111);

    // Time 9-10: Load 7777 into Addr 7
    step(16'd7777, 0, 3'd1, 16'd11111);
    step(16'd7777, 1, 3'd7, 16'd7777);

    // Time 11: Check multiple reads
    check_read(3'd7, 16'd7777);
    check_read(3'd3, 16'd3333);
    check_read(3'd7, 16'd7777);

    // Time 12: Sequential address scan
    check_read(3'd0, 16'd0);
    check_read(3'd1, 16'd11111);
    check_read(3'd2, 16'd0);
    check_read(3'd3, 16'd3333);
    check_read(3'd4, 16'd0);
    check_read(3'd5, 16'd0);
    check_read(3'd6, 16'd0);
    check_read(3'd7, 16'd7777);

    // Time 13-20: Sequential Fill of 21845 into all slots
    for (int i = 0; i < 8; i++) begin
      step(16'd21845, 1, i[2:0], 16'd21845);
    end

    // Time 21: Verify all slots are 21845
    for (int i = 0; i < 8; i++) begin
      check_read(i[2:0], 16'd21845);
    end

    // Time 22-23: Load -21846 into Addr 0
    step(-16'sd21846, 1, 3'd0, -16'sd21846);
    // Time 23: Verify state
    check_read(3'd0, -16'sd21846);
    for (int i = 1; i < 8; i++) check_read(i[2:0], 16'd21845);

    // Time 24-26: Swap logic / loading -21846 into Addr 1
    step(16'd21845, 1, 3'd0, 16'd21845);
    step(-16'sd21846, 1, 3'd1, -16'sd21846);
    // Verify Addr 1 is -21846, others are 21845
    check_read(3'd1, -16'sd21846);
    check_read(3'd0, 16'd21845);

    // ... Continues for remaining address tests in your table ...
    // The pattern in your table (27-46) alternates loading -21846
    // into each register and checking the impact.

    $display("--- Simulation Complete ---");
    $finish;
  end

endmodule
