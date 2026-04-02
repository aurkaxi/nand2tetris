module tb_Mux;

  logic a;
  logic b;
  logic sel;
  logic out;

  Mux dut (
      .a  (a),
      .b  (b),
      .sel(sel),
      .out(out)
  );

  task automatic check(input logic i1, input logic i2, input logic s, input logic exp);
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
    check(0, 0, 0, 0);
    check(0, 0, 1, 0);
    check(0, 1, 0, 0);
    check(0, 1, 1, 1);
    check(1, 0, 0, 1);
    check(1, 0, 1, 0);
    check(1, 1, 0, 1);
    check(1, 1, 1, 1);
  end

endmodule
