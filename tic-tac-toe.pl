% Tic Tac Toe prolog program project for
% William Wang (17237158)
% Yue (Johnson) Sun  (39828116)
% Eric Chi Xiang Chou (26505140)

% How to play Player vs. Player:
% Let’s say player 1 wants to place his/her marker x, in position [1,2]. Hence, the query used 
% would be ?-game(x,[1,2],[e,e,e,e,e,e,e,e,e],R,R1].
% player 2 then takes the output value R to make his move. 
% ?-game(y,[1,3],[e,x,e,e,e,e,e,e,e],R,R1].

% How to play Player vs. Ai:
% Let the first parameter be your intended move or leave it empty to let the AI go first.
% ?-gameWithAi([],[e,e,e,e,e,e,e,e,e],R,R1,R2). 

% Each variable in the three board rows can be in states e(empty), x, o, or any 
% other prefered marker.
% makeMove takes in a Player(x,o, or prefered marker), his/her intended move(ex. [2,2] would % represent the middle of the tic tac toe board, the current board state, the resulting board after % the move, then the result (telling them to make the next move, or somebody has won.)

makeMove(Player, [1,1],[R11,R12,R13,R21,R22,R23,R31,R32,R33],[Player,R12,R13,R21,R22,R23,R31,R32,R33]) :- R11 == e.
makeMove(Player, [1,2],[R11,R12,R13,R21,R22,R23,R31,R32,R33],[R11,Player,R13,R21,R22,R23,R31,R32,R33])
:- R12 == e.
makeMove(Player, [1,3],[R11,R12,R13,R21,R22,R23,R31,R32,R33],[R11,R12,Player,R21,R22,R23,R31,R32,R33])
:- R13 == e.
makeMove(Player, [2,1],[R11,R12,R13,R21,R22,R23,R31,R32,R33],[R11,R12,R13,Player,R22,R23,R31,R32,R33])
:- R21 == e.
makeMove(Player, [2,2],[R11,R12,R13,R21,R22,R23,R31,R32,R33],[R11,R12,R13,R21,Player,R23,R31,R32,R33])
:- R22 == e.
makeMove(Player, [2,3],[R11,R12,R13,R21,R22,R23,R31,R32,R33],[R11,R12,R13,R21,R22,Player,R31,R32,R33])
:- R23 == e.
makeMove(Player, [3,1],[R11,R12,R13,R21,R22,R23,R31,R32,R33],[R11,R12,R13,R21,R22,R23,Player,R32,R33])
:- R31 == e.
makeMove(Player, [3,2],[R11,R12,R13,R21,R22,R23,R31,R32,R33],[R11,R12,R13,R21,R22,R23,R31,Player,R33])
:- R32 == e.
makeMove(Player, [3,3],[R11,R12,R13,R21,R22,R23,R31,R32,R33],[R11,R12,R13,R21,R22,R23,R31,R32,Player])
:- R33 == e.
makeMove(Player,Input,A,A).



% Predicates that define winning condition for Player vs. Player
 
determineWin(Player,[Player,Player,Player,_,_,_,_,_,_],R) :- R = playerWin.
determineWin(Player,[_,_,_,Player,Player,Player,_,_,_],R) :- R = playerWin.
determineWin(Player,[_,_,_,_,_,_,Player,Player,Player],R) :- R = playerWin.
determineWin(Player,[Player,_,_,Player,_,_,Player,_,_],R) :- R = playerWin.
determineWin(Player,[_,Player,_,_,Player,_,_,Player,_],R) :- R = playerWin.
determineWin(Player,[_,_,Player,_,_,Player,_,_,Player],R) :- R = playerWin.
determineWin(Player,[Player,_,_,_,Player,_,_,_,Player],R) :- R = playerWin.
determineWin(Player,[_,_,Player,_,Player,_,Player,_,_],R) :- R = playerWin.
determineWin(Player,ResultBoard,R) :- R = makeNextMove.

% Predicates that define winning condition for AI

determineComputerWin(Player,[Player,Player,Player,_,_,_,_,_,_],R) :- R = computerWin.
determineComputerWin(Player,[_,_,_,Player,Player,Player,_,_,_],R) :- R = computerWin.
determineComputerWin(Player,[_,_,_,_,_,_,Player,Player,Player],R) :- R = computerWin.
determineComputerWin(Player,[Player,_,_,Player,_,_,Player,_,_],R) :- R = computerWin.
determineComputerWin(Player,[_,Player,_,_,Player,_,_,Player,_],R) :- R = computerWin.
determineComputerWin(Player,[_,_,Player,_,_,Player,_,_,Player],R) :- R = computerWin.
determineComputerWin(Player,[Player,_,_,_Player,_,_,_,Player],R) :- R = computerWin.
determineComputerWin(Player,[_,_,Player,_,Player,_,Player,_,_],R) :- R = computerWin.
determineComputerWin(Player,ResultBoard,R).

%winning situations
%horizontal

determineComputerMove([o,o,R1,R2,R3,R4,R5,R6,R7],[o,o,o,R2,R3,R4,R5,R6,R7], R) :- R == makeNextMove, R1 == e.
determineComputerMove([o,R1,o,R2,R3,R4,R5,R6,R7],[o,o,o,R2,R3,R4,R5,R6,R7], R) :- R == makeNextMove, R1 == e.
determineComputerMove([R1,o,o,R2,R3,R4,R5,R6,R7],[o,o,o,R2,R3,R4,R5,R6,R7], R) :- R == makeNextMove, R1 == e.
determineComputerMove([R1,R2,R3,o,o,R4,R5,R6,R7],[R1,R2,R3,o,o,o,R5,R6,R7], R) :- R == makeNextMove, R4 == e.
determineComputerMove([R1,R2,R3,o,R4,o,R5,R6,R7],[R1,R2,R3,o,o,o,R5,R6,R7], R) :- R == makeNextMove, R4 == e.
determineComputerMove([R1,R2,R3,R4,o,o,R5,R6,R7],[R1,R2,R3,o,o,o,R5,R6,R7], R) :- R == makeNextMove, R4 == e.
determineComputerMove([R1,R2,R3,R4,R5,R6,o,o,R7],[R1,R2,R3,R4,R5,R6,o,o,o], R) :- R == makeNextMove, R7 == e.
determineComputerMove([R1,R2,R3,R4,R5,R6,o,R7,o],[R1,R2,R3,R4,R5,R6,o,o,o], R) :- R == makeNextMove, R7 == e.
determineComputerMove([R1,R2,R3,R4,R5,R6,R7,o,o],[R1,R2,R3,R4,R5,R6,o,o,o], R) :- R == makeNextMove, R7 == e.

% vertical
determineComputerMove([o,R1,R2,o,R3,R4,R5,R6,R7],[o,R1,R2,o,R3,R4,o,R6,R7], R) :- R == makeNextMove, R5 == e.
determineComputerMove([o,R1,R2,R3,R4,R5,o,R6,R7],[o,R1,R2,o,R4,R5,o,R6,R7], R) :- R == makeNextMove, R3 == e.
determineComputerMove([R1,R2,R3,o,R4,R5,o,R6,R7],[o,R2,R3,o,R4,R5,o,R6,R7], R) :- R == makeNextMove, R1 == e.
determineComputerMove([R1,o,R2,R3,o,R4,R5,R6,R7],[R1,o,R2,R3,o,R4,R5,o,R7], R) :- R == makeNextMove, R6 == e.
determineComputerMove([R1,o,R2,R3,R4,R5,R6,o,R7],[R1,o,R2,R3,o,R5,R6,o,R7], R) :- R == makeNextMove, R4 == e.
determineComputerMove([R1,R2,R3,R4,o,R5,R6,o,R7],[R1,o,R3,R4,o,R5,R6,o,R7], R) :- R == makeNextMove, R2 == e.
determineComputerMove([R1,R2,o,R3,R4,o,R5,R6,R7],[R1,R2,o,R3,R4,o,R5,R6,o], R) :- R == makeNextMove, R7 == e.
determineComputerMove([R1,R2,o,R3,R4,R5,R6,R7,o],[R1,R2,o,R3,R4,o,R6,R7,o], R) :- R == makeNextMove, R5 == e.
determineComputerMove([R1,R2,R3,R4,R5,o,R6,R7,o],[R1,R2,o,R4,R5,o,R6,R7,o], R) :- R == makeNextMove, R3 == e.

% diagonal
determineComputerMove([o,R1,R2,R3,o,R4,R5,R6,R7],[o,R1,R2,R3,o,R4,R5,R6,o], R) :- R == makeNextMove, R7 == e.
determineComputerMove([o,R1,R2,R3,R4,R5,R6,R7,o],[o,R1,R2,R3,o,R5,R6,R7,o], R) :- R == makeNextMove, R4 == e.
determineComputerMove([R1,R2,R3,R4,o,R5,R6,R7,o],[o,R2,R3,R4,o,R5,R6,R7,o], R) :- R == makeNextMove, R1 == e.
determineComputerMove([R1,R2,o,R3,o,R4,R5,R6,R7],[R1,R2,o,R3,o,R4,o,R6,R7], R) :- R == makeNextMove, R5 == e.
determineComputerMove([R1,R2,o,R3,R4,R5,o,R6,R7],[R1,R2,o,R3,o,R5,o,R6,R7], R) :- R == makeNextMove, R4 == e.
determineComputerMove([R1,R2,R3,R4,o,R5,o,R6,R7],[R1,R2,o,R4,o,R5,o,R6,R7], R) :- R == makeNextMove, R3 == e.

% losing situations which tell the AI to block opponent’s winning move
% horizontal
determineComputerMove([x,x,R1,R2,R3,R4,R5,R6,R7],[x,x,o,R2,R3,R4,R5,R6,R7], R) :- R == makeNextMove, R1 == e.
determineComputerMove([x,R1,x,R2,R3,R4,R5,R6,R7],[x,o,x,R2,R3,R4,R5,R6,R7], R) :- R == makeNextMove, R1 == e.
determineComputerMove([R1,x,x,R2,R3,R4,R5,R6,R7],[o,x,x,R2,R3,R4,R5,R6,R7], R) :- R == makeNextMove, R1 == e.
determineComputerMove([R1,R2,R3,x,x,R4,R5,R6,R7],[R1,R2,R3,x,x,o,R5,R6,R7], R) :- R == makeNextMove, R4 == e.
determineComputerMove([R1,R2,R3,x,R4,x,R5,R6,R7],[R1,R2,R3,x,o,x,R5,R6,R7], R) :- R == makeNextMove, R4 == e.
determineComputerMove([R1,R2,R3,R4,x,x,R5,R6,R7],[R1,R2,R3,o,x,x,R5,R6,R7], R) :- R == makeNextMove, R4 == e.
determineComputerMove([R1,R2,R3,R4,R5,R6,x,x,R7],[R1,R2,R3,R4,R5,R6,x,x,o], R) :- R == makeNextMove, R7 == e.
determineComputerMove([R1,R2,R3,R4,R5,R6,x,R7,x],[R1,R2,R3,R4,R5,R6,x,o,x], R) :- R == makeNextMove, R7 == e.
determineComputerMove([R1,R2,R3,R4,R5,R6,R7,x,x],[R1,R2,R3,R4,R5,R6,o,x,x], R) :- R == makeNextMove, R7 == e.

% vertical
determineComputerMove([x,R1,R2,x,R3,R4,R5,R6,R7],[x,R1,R2,x,R3,R4,o,R6,R7], R) :- R == makeNextMove, R5 == e.
determineComputerMove([x,R1,R2,R3,R4,R5,x,R6,R7],[x,R1,R2,o,R4,R5,x,R6,R7], R) :- R == makeNextMove, R3 == e.
determineComputerMove([R1,R2,R3,x,R4,R5,x,R6,R7],[o,R2,R3,x,R4,R5,x,R6,R7], R) :- R == makeNextMove, R1 == e.
determineComputerMove([R1,x,R2,R3,x,R4,R5,R6,R7],[R1,x,R2,R3,x,R4,R5,o,R7], R) :- R == makeNextMove, R6 == e.
determineComputerMove([R1,x,R2,R3,R4,R5,R6,x,R7],[R1,x,R2,R3,o,R5,R6,x,R7], R) :- R == makeNextMove, R4 == e.
determineComputerMove([R1,R2,R3,R4,x,R5,R6,x,R7],[R1,o,R3,R4,x,R5,R6,x,R7], R) :- R == makeNextMove, R2 == e.
determineComputerMove([R1,R2,x,R3,R4,x,R5,R6,R7],[R1,R2,x,R3,R4,x,R5,R6,o], R) :- R == makeNextMove, R7 == e.
determineComputerMove([R1,R2,x,R3,R4,R5,R6,R7,x],[R1,R2,x,R3,R4,o,R6,R7,x], R) :- R == makeNextMove, R5 == e.
determineComputerMove([R1,R2,R3,R4,R5,x,R6,R7,x],[R1,R2,o,R4,R5,x,R6,R7,x], R) :- R == makeNextMove, R3 == e.

% diagonal
determineComputerMove([x,R1,R2,R3,x,R4,R5,R6,R7],[x,R1,R2,R3,x,R4,R5,R6,o], R) :- R == makeNextMove, R7 == e.
determineComputerMove([x,R1,R2,R3,R4,R5,R6,R7,x],[x,R1,R2,R3,o,R5,R6,R7,x], R) :- R == makeNextMove, R4 == e.
determineComputerMove([R1,R2,R3,R4,x,R5,R6,R7,x],[o,R2,R3,R4,x,R5,R6,R7,x], R) :- R == makeNextMove, R1 == e.
determineComputerMove([R1,R2,x,R3,x,R4,R5,R6,R7],[R1,R2,x,R3,x,R4,o,R6,R7], R) :- R == makeNextMove, R5 == e.
determineComputerMove([R1,R2,x,R3,R4,R5,x,R6,R7],[R1,R2,x,R3,o,R5,x,R6,R7], R) :- R == makeNextMove, R4 == e.
determineComputerMove([R1,R2,R3,R4,x,R5,x,R6,R7],[R1,R2,o,R4,x,R5,x,R6,R7], R) :- R == makeNextMove, R3 == e.

determineComputerMove([e,R1,R2,R3,R4,R5,R6,R7,R8],[o,R1,R2,R3,R4,R5,R6,R7,R8], R) :- R == makeNextMove.
determineComputerMove([R1,e,R2,R3,R4,R5,R6,R7,R8],[R1,o,R2,R3,R4,R5,R6,R7,R8], R) :- R == makeNextMove.
determineComputerMove([R1,R2,e,R3,R4,R5,R6,R7,R8],[R1,R2,o,R3,R4,R5,R6,R7,R8], R) :- R == makeNextMove.
determineComputerMove([R1,R2,R3,e,R4,R5,R6,R7,R8],[R1,R2,R3,o,R4,R5,R6,R7,R8], R) :- R == makeNextMove.
determineComputerMove([R1,R2,R3,R4,e,R5,R6,R7,R8],[R1,R2,R3,R4,o,R5,R6,R7,R8], R) :- R == makeNextMove.
determineComputerMove([R1,R2,R3,R4,R5,e,R6,R7,R8],[R1,R2,R3,R4,R5,o,R6,R7,R8], R) :- R == makeNextMove.
determineComputerMove([R1,R2,R3,R4,R5,R6,e,R7,R8],[R1,R2,R3,R4,R5,R6,o,R7,R8], R) :- R == makeNextMove.
determineComputerMove([R1,R2,R3,R4,R5,R6,R7,e,R8],[R1,R2,R3,R4,R5,R6,R7,o,R8], R) :- R == makeNextMove.
determineComputerMove([R1,R2,R3,R4,R5,R6,R7,R8,e],[R1,R2,R3,R4,R5,R6,R7,R8,o], R) :- R == makeNextMove.

determineComputerMove( L, L, R).

gameWithAi(Input,OldBoard,FinalBoard,Result, ComputerResult)
:- makeMove(x,Input,OldBoard,ResultBoard),
   determineWin(x, FinalBoard, Result),
   once(determineComputerMove(ResultBoard, FinalBoard, Result))	,
   determineComputerWin(o, FinalBoard, ComputerResult).

game(Player,Input,OldBoard, ResultBoard, Result)
:- makeMove(Player,Input,OldBoard, ResultBoard),
determineWin(Player,ResultBoard,Result).
