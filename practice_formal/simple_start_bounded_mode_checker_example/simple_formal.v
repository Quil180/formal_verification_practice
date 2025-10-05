`default_nettype none `timescale 1us / 100 ns

`include "simple.v"

module simple_formal (
    // You put the same inputs and outputs as the module in the testbench
    // input/outputs
    input  logic [63:0] a,
    input  logic [63:0] b,
    output logic [63:0] sum
);

  // instantiating the simple module we made
  simple simple (
      .a  (a),
      .b  (b),
      .sum(sum)
  );

  always_comb begin
    // We are asserting/stating that this property must always be true
    assert (sum == a - b);
  end

endmodule
