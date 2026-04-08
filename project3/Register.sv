module Register (
    input logic [15:0] in,
    input logic load,
    clk,
    output logic [15:0] out
);
  Bit g[15:0] (
      .in  (in),
      .load(load),
      .clk (clk),
      .out (out)
  );
endmodule
