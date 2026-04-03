module Mux16 (
    input  logic [15:0] a,
    input  logic [15:0] b,
    input  logic        sel,
    output logic [15:0] out
);
  logic ns;
  logic [15:0] ans;
  logic [15:0] bs;

  nand g_not_sel (ns, sel, sel);

  genvar i;
  generate
    for (i = 0; i < 16; i = i + 1) begin : gen_mux_logic
      nand g1 (ans[i], a[i], ns);
      nand g2 (bs[i], b[i], sel);
      nand g3 (out[i], ans[i], bs[i]);
    end
  endgenerate
endmodule
