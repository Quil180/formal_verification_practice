`default_nettype none `timescale 1us / 100 ns

`include "simple.v"

module simple_formal (
    input logic clk,
    output logic [63:0] y
);

  simple simple (
      .clk(clk),
      .y  (y)
  );

  logic [63:0] past_y;

  logic past_valid;
  initial past_valid = 0;

  // Remember, only blocking statements are allowed in always_comb
  always_ff @(posedge clk) begin
    past_valid <= 1;
    past_y <= y;
    if (past_valid) begin
      assert (y == past_y + 1);
    end
  end

endmodule
