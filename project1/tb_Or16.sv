
module tb_Or16;

  logic [15:0] a;
  logic [15:0] b;
  logic [15:0] out;

  Or16 dut (
      .a  (a),
      .b  (b),
      .out(out)
  );

  task automatic check(input logic [15:0] i1, input logic [15:0] i2, input logic [15:0] exp);
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
    check(16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000);
    check(16'b0000000000000000, 16'b1111111111111111, 16'b1111111111111111);
    check(16'b1111111111111111, 16'b1111111111111111, 16'b1111111111111111);
    check(16'b1010101010101010, 16'b0101010101010101, 16'b1111111111111111);
    check(16'b0011110011000011, 16'b0000111111110000, 16'b0011111111110011);
    check(16'b0001001000110100, 16'b1001100001110110, 16'b1001101001110110);
  end

endmodule
