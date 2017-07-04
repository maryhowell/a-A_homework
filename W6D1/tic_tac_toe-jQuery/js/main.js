const View = require('./ttt-view');
const Game = require('./ttt_node/game');

$( () => {
  const rootEl = $('.ttt');
  const game = new Game ();
  new View(game, rootEl);
});
