module FREQUENCY_DIVIDER(
  input CLOCK,
  output clock,
);
  parameter frequency_divisor = 0;
  generate
    reg[frequency_divisor:0] slow_frequency = 0;
    always @(posedge CLOCK) begin
        slow_frequency <= slow_frequency + 1;
    end
    assign clock = slow_frequency[frequency_divisor];
  endgenerate
endmodule