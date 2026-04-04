module tb_ALU;

  // Inputs
  logic [15:0] x, y;
  logic zx, nx, zy, ny, f, no;

  // Outputs
  logic [15:0] out;
  logic zr, ng;

  // Device Under Test (DUT) Instantiation
  ALU dut (
      .x  (x),
      .y  (y),
      .zx (zx),
      .nx (nx),
      .zy (zy),
      .ny (ny),
      .f  (f),
      .no (no),
      .out(out),
      .zr (zr),
      .ng (ng)
  );

  // Task to automate checking
  task automatic check(input logic [15:0] i_x, input logic [15:0] i_y, input logic i_zx,
                       input logic i_nx, input logic i_zy, input logic i_ny, input logic i_f,
                       input logic i_no, input logic [15:0] exp_out, input logic exp_zr,
                       input logic exp_ng);
    x  = i_x;
    y  = i_y;
    zx = i_zx;
    nx = i_nx;
    zy = i_zy;
    ny = i_ny;
    f  = i_f;
    no = i_no;

    #1;  // Wait for combinational logic
    $write("| %16b | %16b | %1b | %1b | %1b | %1b | %1b | %1b | %16b | %1b | %1b |", i_x, i_y,
           i_zx, i_nx, i_zy, i_ny, i_f, i_no, out, zr, ng);

    if ({out, zr, ng} !== {exp_out, exp_zr, exp_ng}) begin
      $display(" FAIL! (Exp: %16b | %1b | %1b)", exp_out, exp_zr, exp_ng);
    end else begin
      $display(" PASS");
    end

  endtask

  initial begin
    $display(
        "|        x         |        y         |zx |nx |zy |ny | f |no |       out        |zr |ng |");
    check(16'h0000, 16'hFFFF, 1, 0, 1, 0, 1, 0, 16'h0000, 1, 0);  // 0
    check(16'h0000, 16'hFFFF, 1, 1, 1, 1, 1, 1, 16'h0001, 0, 0);  // 1
    check(16'h0000, 16'hFFFF, 1, 1, 1, 0, 1, 0, 16'hFFFF, 0, 1);  // -1
    check(16'h0000, 16'hFFFF, 0, 0, 1, 1, 0, 0, 16'h0000, 1, 0);  // x & 0
    check(16'h0000, 16'hFFFF, 1, 1, 0, 0, 0, 0, 16'hFFFF, 0, 1);  // 0 & y
    check(16'h0000, 16'hFFFF, 0, 0, 1, 1, 0, 1, 16'hFFFF, 0, 1);  // !(x & 0)
    check(16'h0000, 16'hFFFF, 1, 1, 0, 0, 0, 1, 16'h0000, 1, 0);  // !(0 & y)
    check(16'h0000, 16'hFFFF, 0, 0, 1, 1, 1, 1, 16'h0000, 1, 0);  // -x
    check(16'h0000, 16'hFFFF, 1, 1, 0, 0, 1, 1, 16'h0001, 0, 0);  // -y
    check(16'h0000, 16'hFFFF, 0, 1, 1, 1, 1, 1, 16'h0001, 0, 0);  // x+1
    check(16'h0000, 16'hFFFF, 1, 1, 0, 1, 1, 1, 16'h0000, 1, 0);  // y+1
    check(16'h0000, 16'hFFFF, 0, 0, 1, 1, 1, 0, 16'hFFFF, 0, 1);  // x-1
    check(16'h0000, 16'hFFFF, 1, 1, 0, 0, 1, 0, 16'hFFFE, 0, 1);  // y-1
    check(16'h0000, 16'hFFFF, 0, 0, 0, 0, 1, 0, 16'hFFFF, 0, 1);  // x+y
    check(16'h0000, 16'hFFFF, 0, 1, 0, 0, 1, 1, 16'h0001, 0, 0);  // x-y
    check(16'h0000, 16'hFFFF, 0, 0, 0, 1, 1, 1, 16'hFFFF, 0, 1);  // y-x
    check(16'h0000, 16'hFFFF, 0, 0, 0, 0, 0, 0, 16'h0000, 1, 0);  // x&y
    check(16'h0000, 16'hFFFF, 0, 1, 0, 1, 0, 1, 16'hFFFF, 0, 1);  // x|y
    check(16'd17, 16'd3, 1, 0, 1, 0, 1, 0, 16'h0000, 1, 0);
    check(16'd17, 16'd3, 1, 1, 1, 1, 1, 1, 16'h0001, 0, 0);
    check(16'd17, 16'd3, 1, 1, 1, 0, 1, 0, 16'hFFFF, 0, 1);
    check(16'd17, 16'd3, 0, 0, 1, 1, 0, 0, 16'd17, 0, 0);
    check(16'd17, 16'd3, 1, 1, 0, 0, 0, 0, 16'd3, 0, 0);
    check(16'd17, 16'd3, 0, 0, 1, 1, 0, 1, ~16'd17, 0, 1);
    check(16'd17, 16'd3, 1, 1, 0, 0, 0, 1, ~16'd3, 0, 1);
    check(16'd17, 16'd3, 0, 0, 1, 1, 1, 1, -16'd17, 0, 1);
    check(16'd17, 16'd3, 1, 1, 0, 0, 1, 1, -16'd3, 0, 1);
    check(16'd17, 16'd3, 0, 1, 1, 1, 1, 1, 16'd18, 0, 0);
    check(16'd17, 16'd3, 1, 1, 0, 1, 1, 1, 16'd4, 0, 0);
    check(16'd17, 16'd3, 0, 0, 1, 1, 1, 0, 16'd16, 0, 0);
    check(16'd17, 16'd3, 1, 1, 0, 0, 1, 0, 16'd2, 0, 0);
    check(16'd17, 16'd3, 0, 0, 0, 0, 1, 0, 16'd20, 0, 0);
    check(16'd17, 16'd3, 0, 1, 0, 0, 1, 1, 16'd14, 0, 0);
    check(16'd17, 16'd3, 0, 0, 0, 1, 1, 1, -16'd14, 0, 1);
    check(16'd17, 16'd3, 0, 0, 0, 0, 0, 0, 16'd1, 0, 0);
    check(16'd17, 16'd3, 0, 1, 0, 1, 0, 1, 16'd19, 0, 0);
  end

endmodule
