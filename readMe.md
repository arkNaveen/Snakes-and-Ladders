
Snake-Ladders Game in Verilog

Naveen Kollepara
EC21B1030
VLSI Testing and Testable Design EC5001
Assignment - 02
3-11-2023

Contents
Requirement Specification
Design
Microarchitecture
Features
Results
Further Plans
Specifications
Xilinx Vivado or any other such tool for synthesis and simulation of the target code 
Any Mid-Range FPGA for implementation of project in Hardware, e.g., ZedBoard Zynq-7000 ARM/FPGA SoC Development Board  (Around $589)
The various specifications of the game are explained throughout this document.



Design of the Game
The Game
The game board consists of 50 cells, with cell 1 as the starting point and cell 50 as the endpoint. Some cells on the board represent either snakes or ladders, which impact the players' movements.
It has a total of 3 snakes and 3 ladders with fixed position on the board 
The Lucky Roll
The game automatically generates a random player who is going to take up the first play.
The game also automatically generates random numbers as dice rolls for the players. The dice roll values range from 1 to 6. The players take turns to roll the dice and move their respective positions on the board. The game logic alternates between player 1 and player 2 for each turn by a simple negation operation.

Action Forward or Backward
The players can take turns to roll the dice and advance their positions on the board. The Verilog code simulates player movements based on the dice roll values. Players move forward with a position difference of the dice roll or fall back if there are snakes on the way according to the board configuration. The player climbs up any ladder that comes in between the dice roll and the player's current position.
The Gameplay
The game initializes player positions. 1 is the starting position.
When a player lands on a cell with a ladder, they move forward to the higher-end of the ladder. Conversely, if they land on a cell with a snake, they move backward to the lower-end of the snake.
There is continuous update of information about the players location through 50-bit numbers where the position of 1 in the 50-bit number indicates the current position on board. Other bits are kept as 0.
The display information also includes each player's dice rolls, movements - backward or forward, and any encounters with snakes or ladders and how much position the player has dropped after the encounter.
The Win
The game continues for so on and concludes when one of the players reaches the 50th position, which is the endpoint representing a win, the corresponding player is declared as the winner and the game concludes.
The Features
Self Testing  (Automated Self-Checking Tests)
To check continuously if dice roll is generating values within 1 to 6 
To continuously every loop iteration if there is a snake or ladder in the path of the player
Stop the game if one of the players reach last position
Reporting results after every iteration
Reset
The game resets when this signal is high
The players are moved back to their original positions that is 1 place on the board
Verification (Tests Used)
To check all the above properties 
If the position is updated correctly
Generate random test cases for dice rolls and player movements
Testing of  individual components or modules of the game, such as the dice roll generator, player movement logic, and snakes/ladders handling, each independently.


Microarchitecture 
Automated Approach
The rolling of dice and the movement of the players when encountering a snake or a ladder and the declaration of the winner are all done in an automated fashion with integrated control logic present in the code. 
State Machine
Detailed State Machine for the Implementation of the Game.

Results
The game randomly chose Player 2 to play first and the initial positions of the  players are at 1

When one of the players reaches at a snake a drop of position equal to the snake’s length is performed

The simulation of the code is done in Icarus Verilog extension of Verilog


When Player 1 reaches the 50th bit the game concludes and declares Player 1 as the winner.
The behavioral simulation is performed in Vivado IDE



