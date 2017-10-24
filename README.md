## CPSC312-Project-1-Tic-Tac-Toe
Tic-tac-toe implemented in prolog with artificial intelligence

# How to play Player vs. Player:
Let’s say player 1 wants to place his/her marker x, in position [1,2]. Hence, the query used 
would be ?-game(x,[1,2],[e,e,e,e,e,e,e,e,e],R,R1].
player 2 then takes the output value R to make his move. 
?-game(y,[1,3],[e,x,e,e,e,e,e,e,e],R,R1].

# How to play Player vs. Ai:
Let the first parameter be your intended move or leave it empty to let the AI go first.
?-gameWithAi([],[e,e,e,e,e,e,e,e,e],R,R1,R2). 
