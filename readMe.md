
# Snake-Ladders Game in Verilog

3-11-2023

## Design of the Game
The Game
The game board consists of 50 cells, with cell 1 as the starting point and cell 50 as the endpoint. Some cells on the board represent either snakes or ladders, which impact the players' movements.
It has a total of 3 snakes and 3 ladders with fixed position on the board 
The game automatically generates a random player who is going to take up the first play.
The game also automatically generates random numbers as dice rolls for the players. The dice roll values range from 1 to 6. The players take turns to roll the dice and move their respective positions on the board. The game logic alternates between player 1 and player 2 for each turn by a simple negation operation.

### Action Forward or Backward
The players can take turns to roll the dice and advance their positions on the board. The Verilog code simulates player movements based on the dice roll values. Players move forward with a position difference of the dice roll or fall back if there are snakes on the way according to the board configuration. The player climbs up any ladder that comes in between the dice roll and the player's current position.
The game initializes player positions. 1 is the starting position.
When a player lands on a cell with a ladder, they move forward to the higher-end of the ladder. Conversely, if they land on a cell with a snake, they move backward to the lower-end of the snake.
There is continuous update of information about the players location through 50-bit numbers where the position of 1 in the 50-bit number indicates the current position on board. Other bits are kept as 0.

## Implementation
The simulation of the code is done in Icarus Verilog extension of Verilog

The behavioral simulation is performed in Vivado IDE



