module tb_HalfAdder;

  logic a, b, sum, carry;

  HalfAdder dut (
      .a(a),
      .b(b),
      .sum(sum),
      .carry(carry)
  );

  task automatic check(input logic i1, input logic i2, input logic exp1, input logic exp2);
    a = i1;
    b = i2;
    #1;
    if ({sum, carry} !== {exp1, exp2}) begin
      $display("FAIL! Input: a:%b, b:%b | Expected: sum:%b, carry:%b | Got: sum:%b, carry:%", i1,
               i2, exp1, exp2, sum, carry);
    end else begin
      $display("PASS: a=%b, b=%b -> sum=%b, carry=%b", i1, i2, sum, carry);
    end
  endtask


  initial begin
    check(0, 0, 0, 0);
    check(0, 1, 1, 0);
    check(1, 0, 1, 0);
    check(1, 1, 0, 1);
  end

endmodule

