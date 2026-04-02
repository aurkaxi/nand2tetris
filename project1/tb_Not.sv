module tb_Not;  // No ports here!

  // 1. Declare signals to connect to the design
  logic in;
  logic out;

  // 2. Instantiate the Design Under Test (DUT)
  Not dut (
      .in (in),
      .out(out)
  );

  task automatic check(input logic i, input logic exp);
    in = i;
    #1;
    if (out !== exp) begin
      $display("FAIL! Input: %b | Expected: %b | Got: %b", i, exp, out);
    end else begin
      $display("PASS: in=%b -> out=%b", i, out);
    end
  endtask

  initial begin
    check(0, 1);
    check(1, 0);
  end

endmodule


