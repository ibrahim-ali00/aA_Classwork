const View = require("./ttt-view.js");
const Game = require("../nodeSolution/game.js");
window.View = View;
window.Game = Game;
$(() => {
  let game = new Game();
  let $grid = $(".ttt");
  let view = new View(game, $grid);
});
