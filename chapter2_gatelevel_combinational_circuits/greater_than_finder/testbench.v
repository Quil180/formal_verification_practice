`default_nettype none `timescale 1ns / 10ps

`include "greater_than_2bit.v"

module testbench (
    input logic [1:0] i0,  // input one
    input logic [1:0] i1,  // input two
    output logic gtf  // output result
);

  // instantiating the simple module we made
  greater_than_2bit test (
      .i0 (i0),
      .i1 (i1),
      .gtf(gtf)
  );  // .* can also be used to indicate all ports are the same name

  always_comb begin
    // We are asserting/stating that this property must always be true
    if (i0 > i1) begin
      assert (gtf == 1);
    end else begin
      assert (gtf == 0);
    end
  end

endmodule
