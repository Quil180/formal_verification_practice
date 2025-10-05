`default_nettype none `timescale 1ns / 10ps

`include "comparator.v"

module testbench (
    input  logic i0,  // input one
    input  logic i1,  // input two
    output logic eq   // output result
);

  // instantiating the simple module we made
  comparator test (
      .i0(i0),
      .i1(i1),
      .eq(eq)
  );  // .* can also be used to indicate all ports are the same name

  always_comb begin
    // We are asserting/stating that this property must always be true
    if (i0 == i1) begin
      assert (eq == 1);
    end else begin
      assert (eq == 0);
    end
  end

endmodule
