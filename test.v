`include "frequency_divider.v"

module TEST( input  CLOCK, output [4:0] LEDS);   
  wire clock;
  reg led_state = 0;

  always @(posedge clock) begin
    led_state <= ~led_state;
  end

  FREQUENCY_DIVIDER #(.frequency_divisor(22)) FD(.CLOCK(CLOCK), .clock(clock));

  assign LEDS = {5{led_state}};
endmodule