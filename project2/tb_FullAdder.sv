module tb_FullAdder;

  logic a, b, c, sum, carry;

  FullAdder dut (
      .a(a),
      .b(b),
      .c(c),
      .sum(sum),
      .carry(carry)
  );

  task automatic check(input logic i1, input logic i2, input logic i3, input logic exp1,
                       input logic exp2);
    a = i1;
    b = i2;
    c = i3;
    #1;
    if ({sum, carry} !== {exp1, exp2}) begin
      $display("FAIL! Input: a:%b, b:%b, c:%b | Expected: sum:%b, carry:%b | Got: sum:%b, carry:%",
               i1, i2, i3, exp1, exp2, sum, carry);
    end else begin
      $display("PASS: a=%b, b=%b, i3=%b -> sum=%b, carry=%b", i1, i2, i3, sum, carry);
    end
  endtask


  initial begin
    check(0, 0, 0, 0, 0);
    check(0, 0, 1, 1, 0);
    check(0, 1, 0, 1, 0);
    check(0, 1, 1, 0, 1);
    check(1, 0, 0, 1, 0);
    check(1, 0, 1, 0, 1);
    check(1, 1, 0, 0, 1);
    check(1, 1, 1, 1, 1);
  end

endmodule

