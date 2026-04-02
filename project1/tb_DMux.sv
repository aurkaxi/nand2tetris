module tb_DMux;

  logic in;
  logic sel;
  logic a;
  logic b;

  DMux dut (
      .in (in),
      .sel(sel),
      .a  (a),
      .b  (b)
  );

  task automatic check(input logic i1, input logic i2, input logic exp1, input logic exp2);
    in  = i1;
    sel = i2;
    #1;
    if (a !== exp1 || b !== exp2) begin
      $display("FAIL! Input: in=%b, sel=%b | Expected: a=%b, b=%b | Got: a=%b, b=%", i1, i2, exp1,
               exp2, a, b);
    end else begin
      $display("PASS: in=%b, sel=%b -> a=%b, b=%b", i1, i2, a, b);
    end
  endtask


  initial begin
    check(0, 0, 0, 0);
    check(0, 1, 0, 0);
    check(1, 0, 1, 0);
    check(1, 1, 0, 1);
  end

endmodule
