module tb_DMux4Way;

  logic in;
  logic [1:0] sel;
  logic a, b, c, d;

  DMux4Way dut (
      .in (in),
      .sel(sel),
      .a  (a),
      .b  (b),
      .c  (c),
      .d  (d)
  );

  task automatic check(input logic i1, input logic [1:0] i2, input logic exp1, input logic exp2,
                       input logic exp3, input logic exp4);
    in  = i1;
    sel = i2;
    #1;
    if (a !== exp1 || b !== exp2 || c !== exp3 || d !== exp4) begin
      $display(
          "FAIL! Input: in=%b, sel=%b | Expected: a=%b, b=%b, c=%b, d=%b | Got: a=%b, b=%b, c=%b",
          i1, i2, exp1, exp2, exp3, exp4, a, b, c, d);
    end else begin
      $display("PASS: in=%b, sel=%b -> a=%b, b=%b, c=%b, d=%b", i1, i2, a, b, c, d);
    end
  endtask


  initial begin
    check(0, 2'b00, 0, 0, 0, 0);
    check(0, 2'b01, 0, 0, 0, 0);
    check(0, 2'b10, 0, 0, 0, 0);
    check(0, 2'b11, 0, 0, 0, 0);
    check(1, 2'b00, 1, 0, 0, 0);
    check(1, 2'b01, 0, 1, 0, 0);
    check(1, 2'b10, 0, 0, 1, 0);
    check(1, 2'b11, 0, 0, 0, 1);
  end

endmodule

