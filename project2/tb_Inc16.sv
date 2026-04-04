module tb_Inc16;

  logic [15:0] in, out;

  Inc16 dut (
      .in (in),
      .out(out)
  );

  task automatic check(input logic [15:0] i1, input logic [15:0] exp1);
    in = i1;
    #1;
    if ({out} !== {exp1}) begin
      $display("FAIL! Input: a:%b | Expected: out:%b | Got: out:%b", i1, exp1, out);
    end else begin
      $display("PASS: a=%b -> out=%b", i1, out);
    end
  endtask


  initial begin
    check(16'b0000000000000000, 16'b0000000000000001);
    check(16'b1111111111111111, 16'b0000000000000000);
    check(16'b0000000000000101, 16'b0000000000000110);
    check(16'b1111111111111011, 16'b1111111111111100);
  end

endmodule



