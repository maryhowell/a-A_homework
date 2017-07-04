const View = require('./node_game/view.js');
const Game = require('./node_game/game.js');

$( () => {
  const rootEl = $('.hanoi');
  const game = new Game();
  new View(game, rootEl);
});
