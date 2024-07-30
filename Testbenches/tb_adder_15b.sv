`timescale 1ns / 1ps

module tb_adder_15b;

  // Inputs
  logic  [14:0]      A;
  logic  [14:0]      B;

  // Outputs
  logic  [14:0]      S;
  logic              overflow;

  adder_15b adder_15b (
    .A(A),
    .B(B),
    .Cin(0),
    .S(S),
    .overflow(overflow)
  );

  initial begin
    #5;
    A = 15'b000000000001010; // 10
    B = 15'b000000000010100; // 20

    #10;
    A = 15'b111111111110110; //-10
    B = 15'b000000000110010; // 50

    #10;
    A = 15'b111111110011100; //-100
    B = 15'b000000001001101; // 77

    #10;
    A = 15'b111110111111011; //-517
    B = 15'b111111000100111; //-473

    #10;
    A = 15'b101101011110011; // -9485
    B = 15'b100001110111101; // -15427

    #10;
    A = 15'b011101011110011; // 15091
    B = 15'b001001110111101; // 5053

    #10;
    B = 15'b011101011110011; // 15091
    A = 15'b000000000000000; // 0

  end


endmodule