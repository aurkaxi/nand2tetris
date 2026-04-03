module tb_DMux8Way;

  logic in;
  logic [2:0] sel;
  logic a, b, c, d, e, f, g, h;

  DMux8Way dut (
      .in (in),
      .sel(sel),
      .a  (a),
      .b  (b),
      .c  (c),
      .d  (d),
      .e  (e),
      .f  (f),
      .g  (g),
      .h  (h)
  );

  task automatic check(input logic i1, input logic [2:0] i2, input logic exp1, input logic exp2,
                       input logic exp3, input logic exp4, input logic exp5, input logic exp6,
                       input logic exp7, input logic exp8);
    in  = i1;
    sel = i2;
    #1;
    if ({a, b, c, d, e, f, g, h} !== {exp1, exp2, exp3, exp4, exp5, exp6, exp7, exp8}) begin
      $display("FAIL! Input: in=%b, sel=%b", i1, i2);
      $display("Expected: a:%b b:%b c:%b d:%b e:%b f:%b g:%b h:%b", exp1, exp2, exp3, exp4, exp5,
               exp6, exp7, exp8);
      $display("Got: a:%b b:%b c:%b d:%b e:%b f:%b g:%b h:%b", a, b, c, d, e, f, g, h);
    end else begin
      $display("PASS: in=%b, sel=%b ->  a:%b b:%b c:%b d:%b e:%b f:%b g:%b h:%b", i1, i2, a, b, c,
               d, e, f, g, h);
    end
  endtask


  initial begin
    check(0, 3'b000, 0, 0, 0, 0, 0, 0, 0, 0);
    check(0, 3'b001, 0, 0, 0, 0, 0, 0, 0, 0);
    check(0, 3'b010, 0, 0, 0, 0, 0, 0, 0, 0);
    check(0, 3'b011, 0, 0, 0, 0, 0, 0, 0, 0);
    check(0, 3'b100, 0, 0, 0, 0, 0, 0, 0, 0);
    check(0, 3'b101, 0, 0, 0, 0, 0, 0, 0, 0);
    check(0, 3'b110, 0, 0, 0, 0, 0, 0, 0, 0);
    check(0, 3'b111, 0, 0, 0, 0, 0, 0, 0, 0);
    check(1, 3'b000, 1, 0, 0, 0, 0, 0, 0, 0);
    check(1, 3'b001, 0, 1, 0, 0, 0, 0, 0, 0);
    check(1, 3'b010, 0, 0, 1, 0, 0, 0, 0, 0);
    check(1, 3'b011, 0, 0, 0, 1, 0, 0, 0, 0);
    check(1, 3'b100, 0, 0, 0, 0, 1, 0, 0, 0);
    check(1, 3'b101, 0, 0, 0, 0, 0, 1, 0, 0);
    check(1, 3'b110, 0, 0, 0, 0, 0, 0, 1, 0);
    check(1, 3'b111, 0, 0, 0, 0, 0, 0, 0, 1);
  end

endmodule

