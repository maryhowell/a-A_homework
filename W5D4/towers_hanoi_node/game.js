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
       const startTowerIdx = parseInt(start);
      reader.question("Enter an ending tower: ", end => {
        const endTowerIdx = parseInt(end);
        callback(startTowerIdx, endTowerIdx);
      });
    });
  }


  isValidMove(startTowerIdx, endTowerIdx) {
    // that you can move the top of startTowerIdx
    // onto the top of endTowerIdx.
    const startTower = this.towers[startTowerIdx];
    const endTower = this.towers[endTowerIdx];
    if (startTower.length === 0){
      return false;
    } else if (endTower.length ===0) {
      return true;
    } else {
        const topStartDisc = startTower[startTower.length - 1];
        const topEndDisc = endTower[endTower.length - 1];
        return topStartDisc < topEndDisc;
    }

  }

  isWon() {
     // move all the discs to the last or second tower
     return (this.towers[2].length == 3) || (this.towers[1].length == 3);

}





}

module.exports = Game;
