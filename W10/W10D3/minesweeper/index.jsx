import React from "react";
import ReactDOM from "react-dom";
import Tile from "./components/tile";
import Board from "./components/board";
import Game from "./components/game";

// Renders a SimpleComponent into #root.
document.addEventListener("DOMContentLoaded", function () {
  const root = document.getElementById("root");
  ReactDOM.render(<Game />, root);
});
