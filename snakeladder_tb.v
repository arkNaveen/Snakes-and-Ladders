`timescale 1ns / 1ps
`include "snakeladder.v"
module snakeladder_tb;
  reg reset;
  reg start_game;
  reg clk;
  wire [49:0] p1_position;
  wire [49:0] p2_position;
  legit_SnakeLadder uut (
    reset,start_game,clk,p1_position,p2_position
  );
  initial begin
    clk = 0;
    reset = 0;
    start_game = 0;

    // Apply reset
    reset = 1;
    #10 reset = 0;

    // Start the game
    start_game = 1;
    
    // Continue the simulation for some cycles
    #50;

    // Toggle start_game to initiate player movements
    start_game = 0;
    #20;
    start_game = 1;
    #5000;
    // Stop the simulation
    $finish;
  end
always #10 clk = ~clk;
endmodule

