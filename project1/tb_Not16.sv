module tb_Not16;

  logic [15:0] in;
  logic [15:0] out;

  Not16 dut (
      .in (in),
      .out(out)
  );

  task automatic check(input logic [15:0] i1, input logic [15:0] exp);
    in = i1;
    #1;
    if (out !== exp) begin
      $display("FAIL! Input: i1=%b | Expected: %b | Got: %b", i1, exp, out);
    end else begin
      $display("PASS: i1=%b -> out=%b", i1, out);
    end
  endtask


  initial begin
    check(16'b0000000000000000, 16'b1111111111111111);
    check(16'b1111111111111111, 16'b0000000000000000);
    check(16'b1010101010101010, 16'b0101010101010101);
    check(16'b0011110011000011, 16'b1100001100111100);
    check(16'b0001001000110100, 16'b1110110111001011);
  end

endmodule
