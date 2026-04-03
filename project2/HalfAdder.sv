module HalfAdder (
    input  logic a,
    b,
    output logic sum,
    carry
);
  xor g1 (sum, a, b);
  and g2 (carry, a, b);
endmodule
