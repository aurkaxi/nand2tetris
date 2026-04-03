module tb_Or8Way;

  logic [7:0] in;
  logic out;

  Or8Way dut (
      .in (in),
      .out(out)
  );

  task automatic check(input logic [7:0] i1, input logic exp);
    in = i1;
    #1;
    if (out !== exp) begin
      $display("FAIL! Input: i1=%b | Expected: %b | Got: %b", i1, exp, out);
    end else begin
      $display("PASS: i1=%b, -> out=%b", i1, out);
    end
  endtask

  initial begin
    check(8'b00000000, 0);
    check(8'b11111111, 1);
    check(8'b00010000, 1);
    check(8'b00000001, 1);
    check(8'b00100110, 1);
  end

endmodule




