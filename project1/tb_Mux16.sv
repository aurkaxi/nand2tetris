module tb_Mux16;

  logic [15:0] a;
  logic [15:0] b;
  logic sel;
  logic [15:0] out;

  Mux16 dut (
      .a  (a),
      .b  (b),
      .sel(sel),
      .out(out)
  );

  task automatic check(input logic [15:0] i1, input logic [15:0] i2, input logic s,
                       input logic [15:0] exp);
    a   = i1;
    b   = i2;
    sel = s;
    #1;
    if (out !== exp) begin
      $display("FAIL! Input: i1=%b, i2=%b, s=%b | Expected: %b | Got: %b", i1, i2, s, exp, out);
    end else begin
      $display("PASS: i1=%b, i2=%b, s=%b -> out=%b", i1, i2, s, out);
    end
  endtask


  initial begin
    check(16'b0000000000000000, 16'b0000000000000000, 0, 16'b0000000000000000);
    check(16'b0000000000000000, 16'b0000000000000000, 1, 16'b0000000000000000);
    check(16'b0000000000000000, 16'b0001001000110100, 0, 16'b0000000000000000);
    check(16'b0000000000000000, 16'b0001001000110100, 1, 16'b0001001000110100);
    check(16'b1001100001110110, 16'b0000000000000000, 0, 16'b1001100001110110);
    check(16'b1001100001110110, 16'b0000000000000000, 1, 16'b0000000000000000);
    check(16'b1010101010101010, 16'b0101010101010101, 0, 16'b1010101010101010);
    check(16'b1010101010101010, 16'b0101010101010101, 1, 16'b0101010101010101);
  end

endmodule
