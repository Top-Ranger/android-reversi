A reversi (also known as Othello) implementation for Android.

This is a port of the SailfishOS-App which can be found at
https://github.com/Top-Ranger/harbour-reversi

This implementation features an easy way to implement different players.
Currently avaiable are:
   * Human: A human player
   * Random AI: A simple AI selecting a random tile
   * Greedy AI: Tries to get as many points as possible
   * Tree AI: Builds a tree and tries to get the best possible result. Sometimes gets greedy.
   * Balanced AI: An AI which tries to combine the more clever aspect of the "Tree AI" with the power of the "Greedy AI"
   * Static Rule AI: An AI which determines the best turn by applying different static rules
   * Tutorial: A player that tries to teach basic strategies
   * Adaptive Tree AI: A variant of the Tree AI which tries to guess your next moves
   * Control AI: An AI that tries to control the board by conquering key positions

---

HOWTO implement an own AI/Player:
   1. Inhert Player
   2. Overwrite doTurn(), isHuman(), getBoard(Gameboard board), humanInput(int x, int y)
   3. Add new AI to Gamemaster::initialise(QString player1, QString player2, int bonus)
   4. Add new AI to UI

---

HOWTO use a rule:
   1. Use the "applicable(Gameboard board, int player)" method
   2. Only when you get true use the "doTurn(Gameboard board, int player)" method

Failure to do so will result in undefined behaviour