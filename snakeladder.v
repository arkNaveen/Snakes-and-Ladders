module legit_SnakeLadder (
  input reset,start_game,clk,
  output reg [49:0] p1_position,
  output reg [49:0] p2_position
);
    // Board Variable 8x8 board : 0 - Start  64 - Finish
    wire [49:0] ladder_pos1;
    wire [49:0] ladder_pos2;
    wire [49:0] ladder_pos3;
    wire [49:0] snake_pos1;
    wire [49:0] snake_pos2;
    wire [49:0] snake_pos3;
    wire [49:0] winner;
    integer dice_roll;
    // Ladder Length on Board
    parameter ladder_len1 = 10;
    parameter ladder_len2 = 4;
    parameter ladder_len3 = 30;
    // Snake Lengths on Boards
    parameter snake_len1 = 10;
    parameter snake_len2 = 19;
    parameter snake_len3 = 29;
    // Assigning Snakes and Ladder Positions
    assign ladder_pos1 = 50'b00000000000000000000000000000001000000000000000000;   // pos 20
    assign ladder_pos2 = 50'b00000000000000001000000000000000000000000000000000;   // pos 36
    assign ladder_pos3 = 50'b00000000000000000000000000000000000000000000010000;   // pos 5
    assign snake_pos1 =  50'b00100000000000000000000000000000000000000000000000;   // pos 48
    assign snake_pos2 =  50'b00000000000000001000000000000000000000000000000000;   // pos 36
    assign snake_pos3 =  50'b00000000000010000000000000000000000000000000000000;   // pos 38
    assign winner =      50'b10000000000000000000000000000000000000000000000000;       // Winner position
    // Implement Self Testing to check if the Ladder Tail > Ladder Head
    // Implement Self Testing to check if the Snake Tail < Snake Head
    reg player_turn; // Player turn (1 for P1 0 for 2)
    integer i;
    initial begin
        if(reset) begin
            // Initial Positions
            p1_position = 50'b00000000000000000000000000000000000000000000000001;
            p2_position = 50'b00000000000000000000000000000000000000000000000001;
        end
        p1_position = 50'b00000000000000000000000000000000000000000000000001;
        p2_position = 50'b00000000000000000000000000000000000000000000000001;
        player_turn = $urandom;
        if(player_turn) begin
            $display("Its Player 1 turn");
        end
        else begin
            $display("Its Player 2 turn");
        end

    end
    always@(clk)  begin
    while(start_game)
        begin
        $display("Position 1 %b , Position 2 %b",p1_position,p2_position);
        if(player_turn) begin
            dice_roll = ($urandom % 6) + 1;
            if((dice_roll>=0)&&(dice_roll<=6))  begin   
            // Roll Dice Every Loop
            $display("Player 1 rolled %d",dice_roll);
            // Advance Player1 Movement
            p1_position = p1_position << dice_roll;
            // Change Players Turn
            player_turn = !player_turn;
            // For Player 1
            // Push bits backward if landed on a snake
            if(p1_position === snake_pos1) begin
                p1_position = p1_position >> snake_len1;
                $display("P1 landed on snake ,goes down by %d",snake_len1);
                end
            else if(p1_position === snake_pos2)  begin
                p1_position = p1_position >> snake_len2;
                $display("P1 landed on snake ,goes down by %d",snake_len2);
                end
            else if(p1_position === snake_pos3) begin
                p1_position = p1_position >> snake_len3; 
                $display("P1 landed on snake ,goes down by %d",snake_len3);
                end
            // PUsh bits forward if landed on ladder
            else if(p1_position == ladder_pos1) begin
                p1_position = p1_position << ladder_len1; 
                $display("P1 reached on a ladder goes up by %d",ladder_len1);   
                end 
            else if(p1_position == ladder_pos2) begin
                p1_position = p1_position << ladder_len2;
                $display("P1 reached on a ladder goes up by %d",ladder_len2);
                end
            else if(p1_position == ladder_pos3) begin
                p1_position = p1_position << ladder_len3;
                $display("P1 reached on a ladder goes up by %d",ladder_len3);
                end
            // Check if P1 wins
            else if(p1_position == winner) begin
                $display("Player 1 wins");
                $stop;  
            end
        end
        end
        if(!player_turn) begin
            // Roll Dice Every Loop
            dice_roll = ($urandom % 6) + 1;
            if((dice_roll>=0)&&(dice_roll<=6))  begin     
            $display("Player 2 rolled %d",dice_roll);
            // Advance Player2 Movement
            p2_position = p2_position << dice_roll;
            player_turn = !player_turn;
            // For Player 2
            // Push bits backward if landed on a snake
            if(p2_position === snake_pos1) begin
                p2_position = p2_position >> snake_len1;
                $display("P2 landed on snake ,goes down by %d",snake_len1);
            end
            else if(p2_position === snake_pos2) begin
                p2_position = p2_position >> snake_len2;
                $display("P2 landed on snake ,goes down by %d",snake_len2);
            end
            else if(p2_position === snake_pos3) begin
                p2_position = p2_position >> snake_len3; 
                $display("P2 landed on snake ,goes down by %d",snake_len3);
            end
            // PUsh bits forward if landed on ladder
            else if(p2_position == ladder_pos1) begin
                p2_position = p2_position << ladder_len1; 
                $display("P2 reached on a ladder goes up by %d",ladder_len1); 
            end
            else if(p2_position == ladder_pos2) begin
                p2_position = p2_position << ladder_len2;
                $display("P2 reached on a ladder goes up by %d",ladder_len2);
            end
            else if(p2_position == ladder_pos3) begin
                p2_position = p2_position << ladder_len3;
                $display("P2 reached on a ladder goes up by %d",ladder_len3);
            end
            // Check if P1 wins
            else if(p2_position == winner) begin
                $display("Player 2 wins");
                $stop;
                #10;
                end
            end
        end
            // $display("Position 1 %b , Position 2 %b",p1_position,p2_position);
            #50; 
        end  // end of while
    end     // end of always
endmodule