`default_nettype none `timescale 1us / 100 ns

`include "simple.v"

module simple_formal (
    input logic clk,
    input logic we,
    input logic [63:0] in,
    output logic [63:0] y
);

  simple simple (
      .clk(clk),
      .we (we),
      .in (in),
      .y  (y)
  );

  logic past_valid;
  // We will assume that the first past_valid flag is always false
  initial assume (past_valid == 0);

  always @(posedge clk) begin
    past_valid <= 1;
  end

  // Remember, only blocking statements are allowed in always_comb
  always_ff @(posedge clk) begin
    if (past_valid) begin
      // $past will check last value, must check if its valid beforehand
      // though.
      if ($past(we)) begin
        assert (y == $past(in));
        cover(y == 64'hAAAA0000);
      end
    end
  end

endmodule
