import React from "react";
import Board from "./board.jsx";
import * as MineSweeper from "./minesweeper.js";
import Modal from "react-modal";

Modal.setAppElement(document.getElementById("root"));

export default class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = { board: new MineSweeper.Board(10, 20) };
    this.updateGame = this.updateGame.bind(this);
    this.restartGame = this.restartGame.bind(this);
  }

  updateGame(tile, flagged) {
    if (flagged) {
      tile.toggleFlag();
    } else {
      tile.explore();
    }
    this.setState({ board: this.state.board });
  }

  restartGame() {
    document.getElementById("modal").style.display = "none";
    const board = new MineSweeper.Board(10, 20);
    this.setState({ board: board }, () => {
      console.log(this.state.board);
    });
  }
  componentDidUpdate() {
    if (this.state.board.lost() || this.state.board.won()) {
      document.getElementById("modal").style.display = "block";
    }
  }

  render() {
    let text = "";
    if (this.state.board.lost()) {
      text = "You lost!";
    } else {
      text = "You won!";
    }
    return (
      <div>
        <button onClick={this.restartGame}> restartGame</button>
        <div className="modal" id="modal">
          <div className="modal-content">
            <p>{text}</p>
            <button onClick={this.restartGame}> restartGame</button>
          </div>
        </div>
        <Board board={this.state.board} update={this.updateGame} />
      </div>
    );
  }
}
