import React from "react";
import * as MineSweeper from "./minesweeper.js";

export default class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(event) {
    const flag = event.altKey ? true : false;
    this.props.update(this.props.tile, flag);
  }

  render() {
    const tile = this.props.tile;
    let piece;
    if (tile.explored) {
      if (tile.bombed) {
        piece = "💣";
      } else {
        if (tile.adjacentBombCount() === 0) {
          piece = " ";
        } else {
          piece = `${tile.adjacentBombCount()}`;
        }
      }
    } else {
      if (tile.flagged) {
        piece = "🚩";
      } else {
        piece = " ";
      }
    }
    return (
      <div
        className="tile"
        explored={tile.explored ? "true" : "false"}
        onClick={this.handleClick}
      >
        {piece}
      </div>
    );
  }
}
