class Game {
  // initialize three towers(arrays).
  // in a loop.
    // check if game is won?
    // prompt user and ask what pile to select from
      // and where to put it.
    // check if move is valid
    // make move
    // restart loop
  constructor() {
    // in the constructor, set an ivar for the stacks.
    this.towers = [[3, 2, 1], [], []];
  }

// Write a Game.prototype.promptMove method
  promptMove(reader, callback) {
    // (1) prints the stacks
    this.print();
    // (2) asks the user where they want to move a disc to/from.
    // Pass the startTowerIdx and endTowerIdx to a callback.
    reader.question("Enter a starting tower: ", start => {


    });
  }


}





}

module.exports = Game;
