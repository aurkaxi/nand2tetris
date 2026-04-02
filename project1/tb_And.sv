module tb_And;  // No ports here!

  // 1. Declare signals to connect to the design
  logic a;
  logic b;
  logic out;

  // 2. Instantiate the Design Under Test (DUT)
  And dut (
      .a  (a),
      .b  (b),
      .out(out)
  );

  task automatic check(input logic i1, input logic i2, input logic exp);
    a = i1;
    b = i2;
    #1;
    if (out !== exp) begin
      $display("FAIL! Input: i1=%b, i2=%b | Expected: %b | Got: %b", i1, i2, exp, out);
    end else begin
      $display("PASS: i1=%b, i2=%b -> out=%b", i1, i2, out);
    end
  endtask

  initial begin
    check(0, 0, 0);
    check(0, 1, 0);
    check(1, 0, 0);
    check(1, 1, 1);
  end

endmodule


